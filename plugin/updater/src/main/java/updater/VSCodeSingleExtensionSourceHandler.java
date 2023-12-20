/**
 * SPDX-FileCopyrightText: © Sebastian Thomschke and contributors.
 * SPDX-FileContributor: Sebastian Thomschke
 * SPDX-License-Identifier: EPL-2.0
 * SPDX-ArtifactOfProjectHomePage: https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin
 */
package updater;

import static updater.utils.Log.logInfo;
import static updater.utils.ObjectMappers.JSON;
import static updater.utils.Validation.*;

import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.imageio.ImageIO;

import net.coobird.thumbnailator.Thumbnails;
import updater.Updater.Config;
import updater.Updater.State.ExtensionState;
import updater.Updater.State.LanguageState;
import updater.Updater.VsCodeExtensionPackageJson;
import updater.Updater.VsCodeExtensionPackageJson.Contributions;

/**
 * @author Sebastian Thomschke
 */
class VSCodeSingleExtensionSourceHandler extends AbstractSourceHandler<Config.VSCodeSingleExtensionSource> {

   final ExtensionState state;

   VSCodeSingleExtensionSourceHandler(final String sourceId, final Config.VSCodeSingleExtensionSource source, final Path sourceRepoDir,
      final Path targetSyntaxDir, final ExtensionState state) {
      super(sourceId, source, sourceRepoDir, targetSyntaxDir);
      this.state = state;
   }

   @Override
   void handle() throws IOException {
      final var pkgJson = JSON.readValue(sourceExtensionDir.resolve("package.json").toFile(), VsCodeExtensionPackageJson.class);
      assertArgNotEmpty("package.json/contributes/grammars", pkgJson.contributes().grammars());
      assertArgNotEmpty("package.json/contributes/languages", pkgJson.contributes().languages());

      final var pkgJsonLangs = new TreeMap<String /*langId*/, Contributions.Language>();
      for (final var lang : pkgJson.contributes().languages()) {
         pkgJsonLangs.put(lang.id(), lang);
      }
      final var pkgJsonGrammars = new TreeMap<String /*langId*/, Contributions.Grammar>();
      for (final var grammar : pkgJson.contributes().grammars()) {
         if (grammar.language() != null && pkgJsonLangs.containsKey(grammar.language())) {
            pkgJsonGrammars.put(grammar.language(), grammar);
         }
      }

      if (source.languages != null) {
         logInfo("Validating language configuration overrides...", false);
         for (final Entry<String, Config.LanguageIgnoreable> langOverrides : source.languages.entrySet()) {
            final var langId = langOverrides.getKey();
            if (!pkgJsonLangs.containsKey(langId)) {
               logInfo("FAILED", true, false);
               throw new IllegalArgumentException("No language with id [" + langId + "] found at [package.json/contributes/languages]");
            }
         }
         logInfo("OK", true, false);
      }

      final var targetSyntaxDir = targetSyntaxesDir.resolve(sourceId);
      Files.createDirectories(targetSyntaxDir);

      downloadLicenseFile(targetSyntaxDir);

      if (!isBlank(pkgJson.icon())) {
         final var targetIcon = targetSyntaxDir.resolve("icon.png");
         logInfo("Copying file [icon.png]...");
         final var sourceIcon = ImageIO.read(sourceExtensionDir.resolve(pkgJson.icon()).toFile());
         Thumbnails.of(sourceIcon).size(16, 16).outputFormat("png").toFile(targetIcon.toFile());
         Thumbnails.of(sourceIcon).size(32, 32).outputFormat("png").toFile(targetSyntaxDir.resolve("icon@2x.png").toFile());
      }

      for (final Entry<String, Contributions.Language> lang : pkgJsonLangs.entrySet()) {
         final var langId = lang.getKey();
         final var langCfg = lang.getValue();
         final var langOverrides = source.languages != null ? source.languages.get(langId) : null;
         if (langOverrides != null && !isBlank(langOverrides.ignoredReason) && !"false".equals(langOverrides.ignoredReason)) {
            logInfo("Ignoring language contribution [" + langId + "] as per user config" + ("true".equals(langOverrides.ignoredReason) ? "."
               : ": " + langOverrides.ignoredReason));
            continue;
         }

         final var grammarCfg = pkgJsonGrammars.get(langId);
         final var grammarPath = langOverrides != null && !isBlank(langOverrides.grammar) //
            ? langOverrides.grammar //
            : grammarCfg != null //
               ? grammarCfg.path() //
               : null;
         if (grammarPath == null) {
            logInfo("Ignoring language contribution [" + langId + "] as no grammar is provided.");
         }

         final var ctx = new DownloadContext(langId, langOverrides == null || langOverrides.update, targetSyntaxDir);
         final var grammarFile = downloadTextMateGrammarFile(ctx, grammarPath);

         final var langcfgPath = langOverrides != null && !isBlank(langOverrides.langcfg) //
            ? langOverrides.langcfg //
            : langCfg.configuration();
         downloadLangConfigurationJSONFile(ctx, langcfgPath);

         if (langOverrides != null) {
            downloadExampleFile(ctx, langOverrides.example);
         }

         if (langCfg.icon() != null && !isBlank(langCfg.icon().light())) {
            final var targetIcon = ctx.targetDir().resolve(langId + ".png");
            if (ctx.updateExistingFiles() || !Files.exists(targetIcon)) {
               logInfo("Copying image [" + langCfg.icon().light() + "] -> [" + targetIcon.getFileName() + "]...", false);
               try {
                  final var sourceIcon = ImageIO.read(sourceExtensionDir.resolve(langCfg.icon().light()).toFile());
                  Thumbnails.of(sourceIcon).size(16, 16).outputFormat("png").toFile(targetIcon.toFile());
                  Thumbnails.of(sourceIcon).size(32, 32).outputFormat("png").toFile(ctx.targetDir().resolve(langId + "@2x.png").toFile());
                  logInfo(" OK", true, false);
               } catch (final Exception ex) {
                  logInfo(" ERROR [" + ex.getMessage().replace("\n", " | ") + "]", true, false);
               }
            }
         }

         final var langState = new LanguageState();
         langState.label = langOverrides != null && !isBlank(langOverrides.label) //
            ? langOverrides.label //
            : isEmpty(langCfg.aliases()) ? langId : langCfg.aliases().get(0);
         langState.scopeName = langOverrides != null && !isBlank(langOverrides.scopeName) //
            ? langOverrides.scopeName //
            : grammarCfg == null ? null : grammarCfg.scopeName();
         langState.fileExtensions = langOverrides != null && !isEmpty(langOverrides.fileExtensions) //
            ? new TreeSet<>(langOverrides.fileExtensions) //
            : langCfg.fileExtensions() == null ? null : new TreeSet<>(langCfg.fileExtensions());
         langState.fileNames = langOverrides != null && !isEmpty(langOverrides.fileNames) //
            ? new TreeSet<>(langOverrides.fileNames) //
            : langCfg.fileNames() == null ? null : new TreeSet<>(langCfg.fileNames());
         langState.filePatterns = langOverrides != null && !isEmpty(langOverrides.filePatterns) //
            ? new TreeSet<>(langOverrides.filePatterns) //
            : langCfg.filePatterns() == null ? null : new TreeSet<>(langCfg.filePatterns());
         langState.upstreamURL = getUpstreamUrlFromGrammarFile(grammarFile);
         state.languages.put(langId, langState);
      }
   }

   BufferedImage resizeImage(final BufferedImage originalImage, final int targetWidth, final int targetHeight) {
      final BufferedImage resizedImage = new BufferedImage(targetWidth, targetHeight, Transparency.TRANSLUCENT);
      final Graphics2D g2d = resizedImage.createGraphics();

      // Use RenderingHints to improve image quality
      g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BICUBIC);
      g2d.drawImage(originalImage, 0, 0, targetWidth, targetHeight, null);
      g2d.dispose();

      return resizedImage;
   }
}
