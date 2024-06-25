/*
 * SPDX-FileCopyrightText: © Sebastian Thomschke and contributors.
 * SPDX-FileContributor: Sebastian Thomschke
 * SPDX-License-Identifier: EPL-2.0
 * SPDX-ArtifactOfProjectHomePage: https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin
 */
package updater.utils;

import java.util.Collection;
import java.util.Map;
import java.util.function.Supplier;

/**
 * @author Sebastian Thomschke
 */
public abstract class Validation {

   public static void assertArgNotEmpty(final String argName, final Collection<?> coll) {
      if (isEmpty(coll))
         throw new IllegalArgumentException("[" + argName + "] must not be empty");
   }

   public static void assertArgNotEmpty(final String argName, final Map<?, ?> map) {
      if (isEmpty(map))
         throw new IllegalArgumentException("[" + argName + "] must not be empty");
   }

   public static void assertArgNotEmpty(final String argName, final String str) {
      if (str == null || str.isEmpty())
         throw new IllegalArgumentException("[" + argName + "] must not be empty");
   }

   public static void assertArgNotNull(final String argName, final Object obj) {
      if (obj == null)
         throw new IllegalArgumentException("[" + argName + "] must not be empty");
   }

   public static boolean isBlank(final String str) {
      return str == null || str.isBlank();
   }

   public static boolean isEmpty(final Collection<?> coll) {
      return coll == null || coll.isEmpty();
   }

   public static boolean isEmpty(final Map<?, ?> map) {
      return map == null || map.isEmpty();
   }

   public static boolean isURL(final String str) {
      return str == null ? false : str.contains("://");
   }

   public static <T> T defaultIfNull(final T value, final Supplier<T> supplier) {
      return value == null ? supplier.get() : value;
   }

   public static <T> T defaultIfNull(final T value, final T defaultValue) {
      return value == null ? defaultValue : value;
   }
}
