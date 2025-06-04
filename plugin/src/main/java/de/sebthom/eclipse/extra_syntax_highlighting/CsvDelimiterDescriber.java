/*
 * SPDX-FileCopyrightText: © Sebastian Thomschke and contributors.
 * SPDX-FileContributor: Sebastian Thomschke
 * SPDX-License-Identifier: EPL-2.0
 * SPDX-ArtifactOfProjectHomePage: https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin
 */
package de.sebthom.eclipse.extra_syntax_highlighting;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

import org.eclipse.core.runtime.QualifiedName;
import org.eclipse.core.runtime.content.IContentDescription;
import org.eclipse.core.runtime.content.ITextContentDescriber;

/**
 * Abstract base: subclasses just override {@link #delimiter()}.
 * The base logic samples the file, finds the most frequent delimiter among {@code CANDIDATES},
 * stores it as a property, and returns VALID only if that winner equals {@code expected()}.
 *
 * @author Sebastian Thomschke
 */
public abstract class CsvDelimiterDescriber implements ITextContentDescriber {

   public static final class Passthrough extends CsvDelimiterDescriber {
      @Override
      protected int analyze(final String sample) {
         return INDETERMINATE;
      }

      @Override
      protected char delimiter() {
         return ',';
      }
   }

   public static final class Pipe extends CsvDelimiterDescriber {
      @Override
      protected char delimiter() {
         return '|';
      }
   }

   public static final class Semicolon extends CsvDelimiterDescriber {
      @Override
      protected char delimiter() {
         return ';';
      }
   }

   public static final class Space extends CsvDelimiterDescriber {
      @Override
      protected char delimiter() {
         return ' ';
      }
   }

   private static final QualifiedName[] SUPPORTED_OPERATIONS = {};
   private static final int SAMPLE_SIZE = 4 * 1024;
   private static final char[] CANDIDATES = {',', ';', '|', ' '};

   protected int analyze(final String sample) {
      final String firstLine = sample.split("\\R", 2)[0];
      char winner = 0;
      long best = -1;
      for (final char d : CANDIDATES) {
         final long count = firstLine.chars().filter(ch -> ch == d).count();
         if (count > best) {
            best = count;
            winner = d;
         }
      }

      if (best <= 0)
         return INDETERMINATE; // no delimiter found

      return winner == delimiter() ? VALID : INVALID;
   }

   @Override
   public int describe(final InputStream in, final IContentDescription desc) throws IOException {
      in.mark(SAMPLE_SIZE);
      final byte[] bytesRead = in.readNBytes(SAMPLE_SIZE);
      in.reset();

      if (bytesRead.length == 0)
         return INDETERMINATE;

      // Use charset already detected by Eclipse, fall back to UTF-8
      final Charset charset = desc == null //
            ? StandardCharsets.UTF_8
            : desc.getProperty(IContentDescription.CHARSET) instanceof final String cs //
                  ? Charset.forName(cs)
                  : StandardCharsets.UTF_8;

      return analyze(new String(bytesRead, charset));
   }

   @Override
   public int describe(final Reader reader, final IContentDescription desc) throws IOException {
      reader.mark(SAMPLE_SIZE);
      final char[] buff = new char[SAMPLE_SIZE];
      final int charsRead = reader.read(buff);
      reader.reset();

      if (charsRead <= 0)
         return INDETERMINATE;

      return analyze(new String(buff, 0, charsRead));
   }

   /** Each subclass states which delimiter it is responsible for */
   protected abstract char delimiter();

   @Override
   public QualifiedName[] getSupportedOptions() {
      return SUPPORTED_OPERATIONS;
   }
}
