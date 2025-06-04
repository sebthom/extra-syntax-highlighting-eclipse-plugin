/*
 * SPDX-FileCopyrightText: © Sebastian Thomschke and contributors.
 * SPDX-FileContributor: Sebastian Thomschke
 * SPDX-License-Identifier: EPL-2.0
 * SPDX-ArtifactOfProjectHomePage: https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin
 */
package updater;

import static updater.utils.Validation.assertArgNotEmpty;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map.Entry;
import java.util.TreeSet;

import updater.Updater.Config;
import updater.Updater.Config.InlineGrammar;
import updater.Updater.State.ExtensionState;
import updater.Updater.State.LanguageState;
import updater.utils.Strings;

/**
 * @author Sebastian Thomschke
 */
class CustomSourceHandler extends AbstractSourceHandler<Config.CustomSource> {

   final ExtensionState state;

   CustomSourceHandler(final String sourceId, final Config.CustomSource source, final Path sourceRepoDir, final Path syntaxesDir,
         final ExtensionState state) {
      super(sourceId, source, sourceRepoDir, syntaxesDir);
      this.state = state;
   }

   @Override
   void handle() throws IOException {
      assertArgNotEmpty("sources/" + sourceId + "/languages", source.languages);

      final var targetSyntaxDir = targetSyntaxesDir.resolve(sourceId);
      Files.createDirectories(targetSyntaxDir);

      downloadLicenseFile(targetSyntaxDir);

      state.languages.clear();

      for (final Entry<String, Config.Language> lang : source.languages.entrySet()) {
         final var langId = lang.getKey();
         final var langCfg = lang.getValue();
         assertArgNotEmpty("sources/" + sourceId + "/languages/" + langId + "/label", langCfg.label);
         assertArgNotEmpty("sources/" + sourceId + "/languages/" + langId + "/scope-name", langCfg.scopeName);
         assertArgNotEmpty("sources/" + sourceId + "/languages/" + langId + "/grammar", langCfg.grammar);

         final var ctx = new DownloadContext(Strings.sanitizeFilename(langId), langCfg.update, targetSyntaxDir);
         final var grammarFile = downloadTextMateGrammarFile(ctx, langCfg.grammar);
         downloadLangConfigurationJSONFile(ctx, langCfg.langcfg);
         downloadExampleFile(ctx, langCfg.example);

         final var langState = new LanguageState();
         langState.label = langCfg.label;
         langState.scopeName = langCfg.scopeName;
         langState.fileExtensions = langCfg.fileExtensions == null ? null : new TreeSet<>(langCfg.fileExtensions);
         langState.fileNames = langCfg.fileNames == null ? null : new TreeSet<>(langCfg.fileNames);
         langState.filePatterns = langCfg.filePatterns == null ? null : new TreeSet<>(langCfg.filePatterns);
         langState.upstreamURL = getUpstreamUrlFromGrammarFile(grammarFile);
         state.languages.put(langId, langState);
      }

      for (final Entry<String, InlineGrammar> inlineGrammar : source.inlineGrammars.entrySet()) {
         final var scopeName = inlineGrammar.getKey();
         final var grammarCfg = inlineGrammar.getValue();
         assertArgNotEmpty("sources/" + sourceId + "/inline-grammars/" + scopeName + "/grammar", grammarCfg.grammar);
         final var ctx = new DownloadContext(Strings.sanitizeFilename(scopeName), grammarCfg.update, targetSyntaxDir);
         downloadTextMateGrammarFile(ctx, grammarCfg.grammar);
         state.inlineGrammarScopeNames.add(scopeName);
      }
   }
}
