#!/bin/sh
# SPDX-FileCopyrightText: © Sebastian Thomschke and contributors.
# SPDX-FileContributor: Sebastian Thomschke
# SPDX-License-Identifier: EPL-2.0
# SPDX-ArtifactOfProjectHomePage: https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin

cd "$(dirname "$0")" || exit 1

export MAVEN_OPTS="-Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8 -XX:TieredStopAtLevel=1 -XX:+UseParallelGC"

echo "Launching..."
mvn --quiet -e compiler:compile -Dexec.mainClass="updater.Updater" exec:java -Dexec.args="$*"
