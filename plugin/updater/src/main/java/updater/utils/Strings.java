/*
 * SPDX-FileCopyrightText: © Sebastian Thomschke and contributors.
 * SPDX-FileContributor: Sebastian Thomschke
 * SPDX-License-Identifier: EPL-2.0
 * SPDX-ArtifactOfProjectHomePage: https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin
 */
package updater.utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.function.Consumer;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * @author Sebastian Thomschke
 */
public abstract class Strings {

   public static String indent(final int spaces, final String input) {
      final String indentation = " ".repeat(spaces);
      final String[] lines = input.split("\\n");
      for (int i = 0; i < lines.length; i++) {
         if (!lines[i].isEmpty()) {
            lines[i] = indentation + lines[i];
         }
      }
      return String.join("\n", lines);
   }

   public static String join(final Collection<?> coll, final String separator) {
      return join(coll.stream(), separator);
   }

   public static String join(final Stream<?> stream, final String separator) {
      return stream.map(Objects::toString).collect(Collectors.joining(separator));
   }

   public static String render(String template, final Map<String, Object> variables) {
      for (final Map.Entry<String, Object> entry : variables.entrySet()) {
         final String key = "{" + entry.getKey() + "}";
         final String value = Objects.toString(entry.getValue());
         template = template.replace(key, value);
      }
      return template;
   }

   public static String render(final String template, final Consumer<Map<String, Object>> variablesProvider) {
      final var variables = new HashMap<String, Object>();
      variablesProvider.accept(variables);
      return render(template, variables);
   }

   public static String replaceSubstringBetween(final String searchIn, final String startTag, final String endTag,
         final String replaceWith) {
      return Pattern //
         .compile(Pattern.quote(startTag) + ".*" + Pattern.quote(endTag), Pattern.DOTALL) //
         .matcher(searchIn) //
         .replaceAll(startTag + replaceWith + endTag);
   }

   public static String removeLeadingDot(final String input) {
      if (input.startsWith("."))
         return input.substring(1);
      return input;
   }

   /**
    * Splits the command string using shell-like syntax.
    *
    * <li>Inspired by https://docs.python.org/3/library/shlex.html#shlex.split
    * <li>Based on https://gist.github.com/raymyers/8077031
    */
   public static List<String> splitLikeShell(final CharSequence command) {
      final List<String> args = new ArrayList<>();
      boolean isNextCharEscaped = false;
      char quoteChar = 0;
      boolean isQuoting = false;
      int lastClosingQuoteIdx = Integer.MIN_VALUE;
      final var arg = new StringBuilder();
      char prevChar = ' ';
      for (int i = 0; i < command.length(); i++) {
         final char ch = command.charAt(i);
         if (isNextCharEscaped) {
            arg.append(ch);
            isNextCharEscaped = false;
         } else if (ch == '\\' && !(isQuoting && quoteChar == '\'')) {
            isNextCharEscaped = true;
         } else if (isQuoting && ch == quoteChar) {
            isQuoting = false;
            lastClosingQuoteIdx = i;
         } else if (!isQuoting && ch == '#' && Character.isWhitespace(prevChar)) {
            // ignore trailing comment
            break;
         } else if (!isQuoting && (ch == '\'' || ch == '"')) {
            isQuoting = true;
            quoteChar = ch;
         } else if (!isQuoting && Character.isWhitespace(ch)) {
            if (lastClosingQuoteIdx == i - 1 || arg.length() > 0) {
               args.add(arg.toString());
               arg.setLength(0);
            }
         } else {
            arg.append(ch);
         }
         prevChar = ch;
      }
      if (arg.length() > 0 || lastClosingQuoteIdx == command.length() - 1) {
         args.add(arg.toString());
      }
      return args;
   }
}
