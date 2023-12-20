/**
 * SPDX-FileCopyrightText: © Sebastian Thomschke and contributors.
 * SPDX-FileContributor: Sebastian Thomschke
 * SPDX-License-Identifier: EPL-2.0
 * SPDX-ArtifactOfProjectHomePage: https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin
 */
package updater;

import static updater.utils.Git.gitSparseCheckout;
import static updater.utils.Log.*;
import static updater.utils.ObjectMappers.YAML;
import static updater.utils.Strings.*;
import static updater.utils.Sys.findFirstFile;
import static updater.utils.Validation.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.core.JacksonException;

import updater.utils.Git.GitCheckoutConfig;
import updater.utils.Git.GitCheckoutState;
import updater.utils.Log.WithToString;
import updater.utils.Strings;
import updater.utils.Sys;

/**
 * @author Sebastian Thomschke
 */
public class Updater {

   /**
    * model for update-syntaxes-config.yaml
    */
   record Config( //
      @JsonProperty(required = true) String contentTypePrefix, //
      @JsonProperty(required = true) Map<String, Source> sources, //
      @JsonProperty(required = true) Targets targets //
   ) {
      record Targets( //
         @JsonProperty(required = true) String sourceReposCacheDir, //
         @JsonProperty(required = true) String pluginXml, //
         @JsonProperty(required = true) String readmeMd, //
         @JsonProperty(required = true) String stateFile, //
         @JsonProperty(required = true) String syntaxesDir) {
      }

      static class Language extends WithToString {
         public boolean update = true;
         public String label;
         public String scopeName;
         public String grammar;
         public String langcfg;
         public String example;
         public List<String> fileExtensions;
         public List<String> fileNames;
         public List<String> filePatterns;
      }

      static class LanguageIgnoreable extends Language {
         public @JsonProperty("ignored") String ignoredReason;
      }

      @JsonTypeInfo(use = JsonTypeInfo.Id.NAME, property = "type")
      @JsonSubTypes({ //
         @JsonSubTypes.Type(value = CustomSource.class, name = "custom"), //
         @JsonSubTypes.Type(value = VSCodeSingleExtensionSource.class, name = "vscode-extension"), //
         @JsonSubTypes.Type(value = VSCodeMultiExtensionsSource.class, name = "vscode-extensions") //
      })
      abstract static class Source extends WithToString {
         public @JsonProperty(required = true) GitCheckoutConfig github;
         public boolean licenseDownload = true;
      }

      static class CustomSource extends Source {
         public @JsonProperty(required = true) Map<String, Language> languages;
      }

      static class VSCodeSingleExtensionSource extends Source {
         public Map<String, LanguageIgnoreable> languages;
      }

      static class VSCodeMultiExtensionsSource extends Source {
         record Extension( //
            @JsonProperty("ignored") String ignoredReason, //
            Map<String, LanguageIgnoreable> languages) {
         }

         public boolean includeAllByDefault = false;

         public Map<String, Extension> extensions;
      }
   }

   /**
    * model for update-syntaxes-state.yaml
    */
   record State(SortedMap<String, ExtensionState> extensions) {
      static class ExtensionState extends WithToString {
         public GitCheckoutState github;
         public final SortedMap<String, LanguageState> languages = new TreeMap<>();
      }

      static class LanguageState extends WithToString {
         public String label;
         public String scopeName;
         public String upstreamURL;
         public SortedSet<String> fileExtensions;
         public SortedSet<String> fileNames;
         public SortedSet<String> filePatterns;
      }
   }

   /**
    * model for VSCode extension package.json
    */
   record VsCodeExtensionPackageJson( //
      @JsonProperty(required = true) String name, //
      String icon, //
      String license, //
      String version, //
      @JsonProperty(required = true) Contributions contributes //
   ) {
      record Contributions( //
         @JsonProperty(required = true) List<Grammar> grammars, //
         @JsonProperty(required = true) List<Language> languages //
      ) {
         record Grammar( //
            String language, //
            @JsonProperty(required = true) String scopeName, //
            @JsonProperty(required = true) String path) {
         }

         record Language( //
            @JsonProperty(required = true) String id, //
            List<String> aliases, //
            @JsonProperty("extensions") List<String> fileExtensions, //
            @JsonProperty("filenames") List<String> fileNames, //
            @JsonProperty("filenamePatterns") List<String> filePatterns, //
            Icon icon, //
            String configuration) {
            record Icon(String light, String dark) {
            }
         }
      }
   }

   private static final Path CONFIG_FILE = Path.of("updater-config.yaml").toAbsolutePath().normalize();

   public static void main(final String... args) throws Exception {
      try {
         new Updater().run(args.length == 0 ? null : args[0]);
      } catch (final JacksonException ex) {
         logError(ex);
         System.exit(1);
      }
   }

   private final Config config;
   private final State state;
   private final Path stateFile;
   private final Path sourceReposCacheDir;
   private final Path syntaxesDir;

   private Path toAbsolute(final Path relativeOrAbsolutePath, final Path referencePath) {
      if (relativeOrAbsolutePath.isAbsolute())
         return relativeOrAbsolutePath.normalize();
      return referencePath.toAbsolutePath().resolve(relativeOrAbsolutePath).normalize();
   }

   public Updater() throws Exception {
      logInfo("Loading [" + CONFIG_FILE + "]...");
      config = YAML.readValue(CONFIG_FILE.toFile(), Config.class);
      try (var l = withLogIndented()) {
         logInfo("-> " + config.sources.size() + " source repos defined");
      }

      syntaxesDir = toAbsolute(Path.of(config.targets.syntaxesDir), CONFIG_FILE.getParent());
      logInfo("Syntaxes Folder: [" + syntaxesDir + "]");

      sourceReposCacheDir = toAbsolute( //
         Path.of(config.targets.sourceReposCacheDir.replace("{TEMP_DIR}", Sys.TEMP_DIR.toString())), //
         CONFIG_FILE.getParent());
      logInfo("Source Repos Cache Dir: [" + sourceReposCacheDir + "]");

      stateFile = toAbsolute(Path.of(config.targets.stateFile), CONFIG_FILE.getParent());
      if (Files.exists(stateFile)) {
         logInfo("Loading [" + stateFile + "]...");
         state = YAML.readValue(stateFile.toFile(), State.class);
      } else {
         state = new State(new TreeMap<>());
      }
   }

   private void downloadFiles(final String sourceIdToUpdate) throws IOException, InterruptedException {
      int i = 0;
      for (final var sourceEntry : config.sources.entrySet()) {
         i++;
         final var sourceId = sourceEntry.getKey();
         final var source = sourceEntry.getValue();

         if (sourceIdToUpdate == null) {
            logHeader("[" + i + "/" + config.sources.size() + "] " //
               + "Processing [" + sourceId + "] " //
               + "(" + source.getClass().getSimpleName() + ")");
         } else {
            if (!sourceId.equals(sourceIdToUpdate)) {
               continue;
            }
            logHeader("[1/1] " //
               + "Processing [" + sourceId + "] " //
               + "(" + source.getClass().getSimpleName() + ")");
         }

         final var sourceRepoPath = sourceReposCacheDir.resolve(sourceId);
         final var gitCheckoutState = gitSparseCheckout(sourceRepoPath, source.github);

         if (source instanceof final Config.CustomSource src) {
            final var extensionState = new State.ExtensionState();
            extensionState.github = gitCheckoutState;
            state.extensions.put(sourceId, extensionState);
            new CustomSourceHandler(sourceId, src, sourceRepoPath, syntaxesDir, extensionState).handle();
         } else if (source instanceof final Config.VSCodeSingleExtensionSource src) {
            final var extensionState = new State.ExtensionState();
            extensionState.github = gitCheckoutState;
            state.extensions.put(sourceId, extensionState);
            new VSCodeSingleExtensionSourceHandler(sourceId, src, sourceRepoPath, syntaxesDir, extensionState).handle();
         } else if (source instanceof final Config.VSCodeMultiExtensionsSource src) {
            new VSCodeMultiExtensionsSourceHandler(sourceId, src, sourceRepoPath, gitCheckoutState, syntaxesDir, state.extensions).handle();
         }

         logInfo("Saving state to [" + stateFile + "]");
         try (var writer = Files.newBufferedWriter(stateFile)) {
            writer.write("# AUTO-GENERATED FILE - Do not edit manually; changes will be lost.");
            writer.newLine();
            YAML.writeValue(writer, state);
         }
      }
   }

   private void updateReadmeMD() throws IOException {
      logHeader("Updating [README.md.]...");

      final var readmeLines = new StringBuilder();
      for (final var ext : state.extensions.entrySet()) {
         final var extId = ext.getKey();
         final var extState = ext.getValue();
         for (final var lang : extState.languages.entrySet()) {
            final var langId = lang.getKey();
            final var langState = lang.getValue();

            final var syntaxDir = syntaxesDir.resolve(extId);
            final var iconFileName = Files.exists(syntaxDir.resolve(langId + ".png")) ? langId + ".png"
               : Files.exists(syntaxDir.resolve("icon.png")) ? "icon.png" : null;

            final var templateVars = new HashMap<String, Object>();

            templateVars.put("label", langState.label);
            templateVars.put("icon", iconFileName == null ? ""
               : " <img src=\"plugin/syntaxes/" + extId + "/" + iconFileName + "\" width=16/>");

            templateVars.put("file_associations", Arrays.asList( //
               isEmpty(langState.fileExtensions) ? null
                  : "file-extensions=\"" + join(langState.fileExtensions.stream().map(Strings::removeLeadingDot).distinct().sorted(), ", ")
                     + "\"", //
               isEmpty(langState.fileNames) ? null : "file-names=\"" + join(langState.fileNames, ", ") + "\"", //
               isEmpty(langState.filePatterns) ? null : "file-patterns=\"" + join(langState.filePatterns, ", ") + "\"" //
            ).stream().filter(Objects::nonNull).collect(Collectors.joining("<br />")).replace("*", "\\*"));

            templateVars.put("repo_name", extState.github.repo);
            templateVars.put("repo_ref", extState.github.ref);
            templateVars.put("repo_path", extState.github.path == null ? "" : extState.github.path);
            templateVars.put("commit", extState.github.commit);

            templateVars.put("upstream_url", isURL(langState.upstreamURL) ? " [[upstream]](" + langState.upstreamURL + ")" : "");

            readmeLines.append(render(
               """
                  | {label}{icon} | {file_associations} | [{repo_ref}@{repo_name}](https://github.com/{repo_name}/tree/{commit}/{repo_path}){upstream_url}
                  """,
               templateVars));
         }
      }

      final var readmeMD = Path.of(config.targets.readmeMd).toAbsolutePath().normalize();
      logInfo("Saving [" + readmeMD + "]...");
      Files.writeString(readmeMD, //
         replaceSubstringBetween(Files.readString(readmeMD), //
            "<!-- START-GENERATED -->", "<!-- END-GENERATED -->", //
            """
               \n
               | Language/Format | File Associations | Source
               |:--------------- |:----------------- |:------ |
               """ + readmeLines.toString() + "\n") //
      );
   }

   private void updatePluginXML() throws IOException {
      logHeader("Updating [plugin.xml]...");
      final var pluginLines = new StringBuilder();
      for (final var ext : state.extensions.entrySet()) {
         final var extId = ext.getKey();
         final var extCfg = ext.getValue();
         for (final var lang : extCfg.languages.entrySet()) {
            final var langId = lang.getKey();
            final var langCfg = lang.getValue();
            logInfo("Rendering entry [" + extId + "/" + langId + "]...");

            final var syntaxDir = syntaxesDir.resolve(extId);

            final var grammarFile = findFirstFile(syntaxDir, //
               f -> f.matches(Pattern.quote(langId) + "[.]tmLanguage[.](yaml|json|plist)"));

            final var iconFileName = Files.exists(syntaxDir.resolve(langId + ".png")) ? langId + ".png"
               : Files.exists(syntaxDir.resolve("icon.png")) ? "icon.png" : null;

            final var exampleFile = findFirstFile(syntaxDir, //
               f -> f.matches(Pattern.quote(langId) + "[.]example[.].*"));

            final var templateVars = new HashMap<String, Object>();
            templateVars.put("ext_id", extId);
            templateVars.put("lang_id", langId);
            templateVars.put("label", langCfg.label);
            templateVars.put("content_type_prefix", config.contentTypePrefix);
            templateVars.put("content_type_id", config.contentTypePrefix + "." + langId);
            templateVars.put("scope_name", langCfg.scopeName);
            templateVars.put("grammar_filename", grammarFile.get().getFileName());
            templateVars.put("icon_filename", iconFileName);
            templateVars.put("example_filename", exampleFile.isPresent() ? exampleFile.get().getFileName() : null);

            templateVars.put("file_associations", Arrays.asList( //
               isEmpty(langCfg.fileExtensions) ? null
                  : "file-extensions=\"" + join(langCfg.fileExtensions.stream().map(Strings::removeLeadingDot).distinct().sorted(), ",")
                     + "\"", //
               isEmpty(langCfg.fileNames) ? null : "file-names=\"" + join(langCfg.fileNames, ",") + "\"", //
               isEmpty(langCfg.filePatterns) ? null : "file-patterns=\"" + join(langCfg.filePatterns, ",") + "\"" //
            ).stream().filter(Objects::nonNull).collect(Collectors.joining(" ")));

            pluginLines.append(render("""
               \n
               <!-- ======================================== -->
               <!-- {ext_id}/{lang_id}: {label} -->
               <!-- ======================================== -->
               <extension point="org.eclipse.core.contenttype.contentTypes">
                 <content-type id="{content_type_id}" name="{label}" base-type="{content_type_prefix}.basetype" priority="normal"
                               {file_associations} />
               </extension>

               <extension point="org.eclipse.ui.editors">
                  <editorContentTypeBinding editorId="org.eclipse.ui.genericeditor.GenericEditor" contentTypeId="{content_type_id}" />
               </extension>

               <extension point="org.eclipse.tm4e.registry.grammars">
                 <grammar scopeName="{scope_name}" path="syntaxes/{ext_id}/{grammar_filename}" />
                 <scopeNameContentTypeBinding scopeName="{scope_name}" contentTypeId="{content_type_id}" />
               </extension>""", templateVars));

            if (Files.exists(syntaxDir.resolve(langId + ".language-configuration.json"))) {
               pluginLines.append(render(
                  """
                     \n
                     <extension point="org.eclipse.tm4e.languageconfiguration.languageConfigurations">
                       <languageConfiguration contentTypeId="{content_type_id}" path="syntaxes/{ext_id}/{lang_id}.language-configuration.json" />
                     </extension>""",
                  templateVars));
            }

            if (iconFileName != null) {
               pluginLines.append(render("""
                  \n
                  <extension point="org.eclipse.ui.genericeditor.icons">
                    <icon contentType="{content_type_id}" icon="syntaxes/{ext_id}/{icon_filename}"/>
                  </extension>""", templateVars));
            }

            if (exampleFile.isPresent()) {
               pluginLines.append(render("""
                  \n
                  <extension point="org.eclipse.tm4e.ui.snippets">
                    <snippet name="{label} Example" path="syntaxes/{ext_id}/{example_filename}" scopeName="{scope_name}" />
                  </extension>""", templateVars));
            }
         }
      }

      final var pluginXML = Path.of(config.targets.pluginXml).toAbsolutePath().normalize();
      logInfo("Saving [" + pluginXML + "]...");
      Files.writeString(pluginXML, //
         replaceSubstringBetween(Files.readString(pluginXML), //
            "<!-- START-GENERATED -->", "<!-- END-GENERATED -->", //
            indent(2, pluginLines.toString()) + "\n\n  ") //
      );
   }

   /**
    * @param sourceId the source to get updates from or null to get updates from all sources
    */
   public void run(final String sourceId) throws Exception {
      downloadFiles(sourceId);
      updatePluginXML();
      updateReadmeMD();
   }

}
