#!/usr/bin/env python3
# SPDX-FileCopyrightText: © Sebastian Thomschke and contributors.
# SPDX-FileContributor: Sebastian Thomschke
# SPDX-License-Identifier: EPL-2.0
# SPDX-ArtifactOfProjectHomePage: https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin
import json, os, platform, re, string, subprocess, sys, urllib.error, urllib.request

try:
    import yaml
except ImportError:
    subprocess.run((sys.executable, "-m", "pip", "install", "pyyaml"))
    import yaml

THIS_FILE_DIR = os.path.dirname(os.path.abspath(__file__))

URL_PREFIX = "https://raw.githubusercontent.com/"

syntaxes = (
    ("apache-http", "mrmlnc/vscode-apache/master", "syntaxes/Apache.tmLanguage", "apache.configuration.json", "LICENSE", ""),
    ("astro", "withastro/language-tools/main/packages/vscode", "syntaxes/astro.tmLanguage.json", "languages/astro-language-configuration.json", "LICENSE", "../../../../astro/main/examples/basics/src/pages/index.astro"),
    ("c", "microsoft/vscode/main", "extensions/cpp/syntaxes/c.tmLanguage.json", "extensions/cpp/language-configuration.json", "LICENSE.txt", ""),
    ("cpp", "microsoft/vscode/main", "extensions/cpp/syntaxes/cpp.tmLanguage.json", "extensions/cpp/language-configuration.json", "LICENSE.txt", ""),
    ("csharp", "microsoft/vscode/main", "extensions/csharp/syntaxes/csharp.tmLanguage.json", "extensions/csharp/language-configuration.json", "LICENSE.txt", ""),
    ("dart", "microsoft/vscode/main", "extensions/dart/syntaxes/dart.tmLanguage.json", "extensions/dart/language-configuration.json", "LICENSE.txt", ""),
    ("dot", "textmate/graphviz.tmbundle/master", "Syntaxes/DOT.plist", "", "", ""),
    ("er", "mikkel-ol/vsc-er-syntax-highlighting/master", "syntaxes/er.tmLanguage.json", "language-configuration.json", "LICENSE", "example.er"),
    ("glsl", "GeForceLegend/vscode-glsl/master", "syntaxes/glsl.tmLanguage.json", "language-configuration.json", "LICENSE", "sample/test.glsl"),
    ("graphql", "graphql/graphiql/main/packages", "vscode-graphql-syntax/grammars/graphql.json", "vscode-graphql-syntax/language/language-configuration.json", "../LICENSE", "graphql-language-service/benchmark/fixtures/kitchen-sink.graphql"),
    ("hcl", "hashicorp/syntax/main", "syntaxes/hcl.tmGrammar.json", "", "LICENSE", "tests/snapshot/hcl/basic.hcl"),
    ("ini", "microsoft/vscode/main", "extensions/ini/syntaxes/ini.tmLanguage.json", "extensions/ini/ini.language-configuration.json", "LICENSE.txt", ""),
    ("kotlin", "fwcd/kotlin-language-server/main", "grammars/Kotlin.tmLanguage.json", "grammars/kotlin.configuration.json", "LICENSE.txt", ""),
    ("ldif", "FlashSystems/LDIF-Syntax/master", "ldif.tmLanguage", "", "LICENSE", ""),
    ("lua", "microsoft/vscode/main", "extensions/lua/syntaxes/lua.tmLanguage.json", "extensions/lua/language-configuration.json", "LICENSE.txt", ""),
    ("haxe", "vshaxe/haxe-TmLanguage/master", "haxe.tmLanguage", "../../vshaxe/master/configurations/haxe.language-configuration.json", "LICENSE.md", ""),
    ("makefile", "microsoft/vscode/main", "extensions/make/syntaxes/make.tmLanguage.json", "extensions/make/language-configuration.json", "LICENSE.txt", ""),
    ("nushell", "nushell/vscode-nushell-lang/main", "syntaxes/nushell.tmLanguage.json", "language-configuration.json", "LICENSE", "example.nu"),
    ("php", "microsoft/vscode/main", "extensions/php/syntaxes/php.tmLanguage.json", "extensions/php/language-configuration.json", "LICENSE.txt", ""),
    ("plantuml", "qjebbs/vscode-plantuml/master", "syntaxes/plantuml.yaml-tmLanguage", "language-configuration.json", "LICENSE.txt", "test/testFixture/macros.puml"),
    ("powershell", "microsoft/vscode/main", "extensions/powershell/syntaxes/powershell.tmLanguage.json", "extensions/powershell/language-configuration.json", "LICENSE.txt", ""),
    ("prisma", "prisma/language-tools/main/packages", "vscode/syntaxes/prisma.tmLanguage.json", "vscode/language-configuration.json", "../LICENSE", "language-server/test/fixtures/correct_mongodb.prisma"),
    ("sentinel", "hashicorp/syntax/main", "syntaxes/sentinel.tmGrammar.json", "", "LICENSE", "tests/snapshot/sentinel/basic.sentinel"),
    ("svelte", "sveltejs/language-tools/master/packages", "svelte-vscode/syntaxes/svelte.tmLanguage.src.yaml", "svelte-vscode/language-configuration.json", "../LICENSE", "svelte2tsx/test/emitDts/samples/svelte3/src/TestJs.svelte"),
    ("swift", "microsoft/vscode/main", "extensions/swift/syntaxes/swift.tmLanguage.json", "extensions/swift/language-configuration.json", "LICENSE.txt", ""),
    ("terraform", "hashicorp/syntax/main", "syntaxes/terraform.tmGrammar.json", "", "LICENSE", "tests/snapshot/terraform/basic.tf"),
    ("toml", "oovm/vscode-toml/master", "extension/toml.tmLanguage.json", "extension/toml.configuration.json", "License.md", "test/showtime.toml"),
    # https://github.com/tamasfe/taplo/issues/245
    # ("toml", "tamasfe/taplo/master", "editors/vscode/toml.tmLanguage.json", "editors/vscode/language-configuration.json", "LICENSE.md", ""),
    ("vb", "microsoft/vscode/main", "extensions/vb/syntaxes/asp-vb-net.tmlanguage.json", "extensions/vb/language-configuration.json", "LICENSE.txt", "")
)

DOWNLOAD_DIR = os.path.join(THIS_FILE_DIR, "syntaxes")
print(f"Download directory: {DOWNLOAD_DIR}")


def unix2dos(filepath):
    with open(filepath, "rt", encoding = 'utf-8') as fh:
        content = fh.read()

    with open(filepath, "wt", encoding = 'utf-8') as fh:
        fh.write(content)


def download(github_branch, github_file, target_file):
    url = URL_PREFIX + github_branch + "/" + github_file
    try:
        urllib.request.urlretrieve(url, target_file)
    except urllib.error.HTTPError as ex:
        print(f"ERROR: Failed to download {url}")
        raise ex
    if platform.system() == "Windows":
        unix2dos(os.path.join(syntax_dir, target_file))


for (lang_id, github_branch, syntax_path, langcfg_path, license_path, sample_path)  in syntaxes:
    print(f"Downloading [{lang_id}] Grammar [{syntax_path}]...")
    syntax_dir = os.path.join(DOWNLOAD_DIR, lang_id)
    os.makedirs(syntax_dir, exist_ok = True)

    # download in JSON format
    if re.match(".*json.*", syntax_path, re.IGNORECASE):
        download(github_branch, syntax_path, os.path.join(syntax_dir, f"{lang_id}.tmLanguage.json"))

    # download in YAML format and convert to JSON
    elif re.match(".*yaml.*", syntax_path, re.IGNORECASE):
        yaml_file = os.path.join(syntax_dir, f"{lang_id}.tmLanguage.yaml")
        json_file = os.path.join(syntax_dir, f"{lang_id}.tmLanguage.json")
        download(github_branch, syntax_path, os.path.join(syntax_dir, yaml_file))

        with open(yaml_file) as infile:
            yaml_content = yaml.load(infile, Loader = yaml.FullLoader)

        with open(json_file, 'w') as outfile:
             json.dump(yaml_content, outfile, indent = 4)

        os.remove(yaml_file)

    # download in PLIST/XML format
    else:
        download(github_branch, syntax_path, os.path.join(syntax_dir, f"{lang_id}.tmLanguage.plist"))

    if langcfg_path:
        print(f"Downloading [{lang_id}] Language Config [{langcfg_path}]...")
        download(github_branch, langcfg_path, os.path.join(syntax_dir, f"{lang_id}.langcfg.json"))

    if license_path:
        print(f"Downloading [{lang_id}] License [{license_path}]...")
        download(github_branch, license_path, os.path.join(syntax_dir, "LICENSE.txt"))

    if sample_path:
        print(f"Downloading [{lang_id}] Sample file [{sample_path}]...")
        download(github_branch, sample_path, os.path.join(syntax_dir, f"{lang_id}.sample{os.path.splitext(sample_path)[1]}"))

print("**DONE**")
