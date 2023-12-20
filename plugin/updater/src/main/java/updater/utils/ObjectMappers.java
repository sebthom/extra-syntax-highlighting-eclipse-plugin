/**
 * SPDX-FileCopyrightText: © Sebastian Thomschke and contributors.
 * SPDX-FileContributor: Sebastian Thomschke
 * SPDX-License-Identifier: EPL-2.0
 * SPDX-ArtifactOfProjectHomePage: https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin
 */
package updater.utils;

import org.yaml.snakeyaml.DumperOptions;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactoryBuilder;
import com.fasterxml.jackson.dataformat.yaml.YAMLGenerator;

/**
 * @author Sebastian Thomschke
 */
public abstract class ObjectMappers {

   public static final ObjectMapper JSON = new ObjectMapper() //
      .configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

   public static final ObjectMapper YAML;
   static {
      YAML = new ObjectMapper(new YAMLFactoryBuilder(new YAMLFactory()) //
         .dumperOptions(new DumperOptions() {
            {
               // :-( https://github.com/FasterXML/jackson-dataformats-text/issues/4
               setDefaultFlowStyle(DumperOptions.FlowStyle.AUTO);
            }
         }) //
         .enable(YAMLGenerator.Feature.MINIMIZE_QUOTES) //
         .disable(YAMLGenerator.Feature.WRITE_DOC_START_MARKER) //
         .build()) //
            .setSerializationInclusion(JsonInclude.Include.NON_NULL) //
            .setPropertyNamingStrategy(PropertyNamingStrategies.KEBAB_CASE);
   }
}
