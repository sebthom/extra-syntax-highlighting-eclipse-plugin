#!/usr/bin/env python3
import json, os, platform, re, string, subprocess, sys, urllib.error, urllib.request

try:
    import yaml
except ImportError:
    subprocess.run((sys.executable, "-m", "pip", "install", "pyyaml"))
    import yaml

THIS_FILE_DIR = os.path.dirname(os.path.abspath(__file__))

URL_PREFIX = "https://raw.githubusercontent.com/"

syntaxes = (
    ("apache-http", "mrmlnc/vscode-apache/master", "syntaxes/Apache.tmLanguage", "apache.configuration.json", "LICENSE"),
    ("c", "microsoft/vscode/main", "extensions/cpp/syntaxes/c.tmLanguage.json", "extensions/cpp/language-configuration.json", "LICENSE.txt"),
    ("cpp", "microsoft/vscode/main", "extensions/cpp/syntaxes/cpp.tmLanguage.json", "extensions/cpp/language-configuration.json", "LICENSE.txt"),
    ("csharp", "microsoft/vscode/main", "extensions/csharp/syntaxes/csharp.tmLanguage.json", "extensions/csharp/language-configuration.json", "LICENSE.txt"),
    ("dart", "microsoft/vscode/main", "extensions/dart/syntaxes/dart.tmLanguage.json", "extensions/dart/language-configuration.json", "LICENSE.txt"),
    ("dot", "textmate/graphviz.tmbundle/master", "Syntaxes/DOT.plist", "", ""),
    ("er", "mikkel-ol/vsc-er-syntax-highlighting/master", "syntaxes/er.tmLanguage.json", "language-configuration.json", "LICENSE"),
    ("graphql", "graphql/vscode-graphql/master", "grammars/graphql.json", "language/language-configuration.json", "LICENSE"),
    ("hcl", "hashicorp/syntax/main", "syntaxes/hcl.tmGrammar.json", "", "LICENSE"),
    ("ini", "microsoft/vscode/main", "extensions/ini/syntaxes/ini.tmLanguage.json", "extensions/ini/ini.language-configuration.json", "LICENSE.txt"),
    ("ldif", "FlashSystems/LDIF-Syntax/master", "ldif.tmLanguage", "", "LICENSE"),
    ("lua", "microsoft/vscode/main", "extensions/lua/syntaxes/lua.tmLanguage.json", "extensions/lua/language-configuration.json", "LICENSE.txt"),
    ("haxe", "vshaxe/haxe-TmLanguage/master", "haxe.tmLanguage", "../../vshaxe/master/configurations/haxe.language-configuration.json", "LICENSE.md"),
    ("php", "microsoft/vscode/main", "extensions/php/syntaxes/php.tmLanguage.json", "extensions/php/language-configuration.json", "LICENSE.txt"),
    ("plantuml", "qjebbs/vscode-plantuml/master", "syntaxes/plantuml.yaml-tmLanguage", "language-configuration.json", "LICENSE.txt"),
    ("powershell", "microsoft/vscode/main", "extensions/powershell/syntaxes/powershell.tmLanguage.json", "extensions/powershell/language-configuration.json", "LICENSE.txt"),
    ("prisma", "prisma/language-tools/main", "packages/vscode/syntaxes/prisma.tmLanguage.json", "packages/vscode/language-configuration.json", "LICENSE"),
    ("sentinel", "hashicorp/syntax/main", "syntaxes/sentinel.tmGrammar.json", "", "LICENSE"),
    ("svelte", "sveltejs/language-tools/master", "packages/svelte-vscode/syntaxes/svelte.tmLanguage.src.yaml", "packages/svelte-vscode/language-configuration.json", "LICENSE"),
    ("terraform", "hashicorp/syntax/main", "syntaxes/terraform.tmGrammar.json", "", "LICENSE"),
    ("toml", "oovm/vscode-toml/master", "extension/toml.tmLanguage.json", "extension/toml.configuration.json", "License.md"),
    # https://github.com/tamasfe/taplo/issues/245
    # ("toml", "tamasfe/taplo/master", "editors/vscode/toml.tmLanguage.json", "editors/vscode/language-configuration.json", "LICENSE.md"),
    ("vb", "microsoft/vscode/main", "extensions/vb/syntaxes/asp-vb-net.tmlanguage.json", "extensions/vb/language-configuration.json", "LICENSE.txt"),
    ("vue", "vuejs/vue-syntax-highlight/master", "vue.tmLanguage", "", "LICENSE")
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


for (lang_id, github_branch, syntax_uri, langcfg_uri, licence_uri)  in syntaxes:
    print(f"Downloading [{lang_id}] Grammar...")
    syntax_dir = os.path.join(DOWNLOAD_DIR, lang_id)
    os.makedirs(syntax_dir, exist_ok = True)

    # download in JSON format
    if re.match(".*json.*", syntax_uri, re.IGNORECASE):
        download(github_branch, syntax_uri, os.path.join(syntax_dir, f"{lang_id}.tmLanguage.json"))

    # download in YAML format and convert to JSON
    elif re.match(".*yaml.*", syntax_uri, re.IGNORECASE):
        yaml_file = os.path.join(syntax_dir, f"{lang_id}.tmLanguage.yaml")
        json_file = os.path.join(syntax_dir, f"{lang_id}.tmLanguage.json")
        download(github_branch, syntax_uri, os.path.join(syntax_dir, yaml_file))

        with open(yaml_file) as infile:
            yaml_content = yaml.load(infile, Loader = yaml.FullLoader)

        with open(json_file, 'w') as outfile:
             json.dump(yaml_content, outfile, indent = 4)

        os.remove(yaml_file)

    # download in PLIST/XML format
    else:
        download(github_branch, syntax_uri, os.path.join(syntax_dir, f"{lang_id}.tmLanguage.plist"))

    if langcfg_uri:
        print(f"Downloading [{lang_id}] Language Config...")
        download(github_branch, langcfg_uri, os.path.join(syntax_dir, f"{lang_id}.langcfg.json"))

    if licence_uri:
        print(f"Downloading [{lang_id}] License...")
        download(github_branch, licence_uri, os.path.join(syntax_dir, "LICENSE.txt"))

print("**DONE**")
