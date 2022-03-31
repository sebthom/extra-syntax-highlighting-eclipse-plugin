#!/usr/bin/env python3
import os, urllib.request

URL_PREFIX = "https://raw.githubusercontent.com/"

DOWNLOAD_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "syntaxes")

syntaxes = (
 ("c.tmLanguage", "textmate/c.tmbundle/master/Syntaxes/C.plist", ""),
 ("cpp.tmLanguage", "textmate/c.tmbundle/master/Syntaxes/C%2B%2B.plist", ""),
 ("csharp.tmLanguage", "dotnet/csharp-tmLanguage/main/grammars/csharp.tmLanguage", "dotnet/csharp-tmLanguage/main/LICENSE"),
 ("dot.tmLanguage", "textmate/graphviz.tmbundle/master/Syntaxes/DOT.plist", ""),
 ("graphql.tmLanguage.json", "graphql/vscode-graphql/master/grammars/graphql.json", "graphql/vscode-graphql/master/LICENSE"),
 ("hcl.tmLanguage.json", "hashicorp/syntax/main/syntaxes/hcl.tmGrammar.json", "hashicorp/syntax/main/LICENSE"),
 ("ini.tmLanguage", "textmate/ini.tmbundle/master/Syntaxes/Ini.plist", ""),
 ("ldif.tmLanguage", "FlashSystems/LDIF-Syntax/master/ldif.tmLanguage", "FlashSystems/LDIF-Syntax/master/LICENSE"),
 ("lua.tmLanguage", "textmate/lua.tmbundle/master/Syntaxes/Lua.plist", ""),
 ("plantuml.tmLanguage.yaml", "qjebbs/vscode-plantuml/master/syntaxes/plantuml.yaml-tmLanguage", "qjebbs/vscode-plantuml/master/LICENSE.txt"),
 ("prisma.tmLanguage.json", "prisma/language-tools/main/packages/vscode/syntaxes/prisma.tmLanguage.json", "prisma/language-tools/main/LICENSE"),
 ("php.tmLanguage", "textmate/php.tmbundle/master/Syntaxes/PHP.plist", ""),
 ("sentinel.tmLanguage.json", "hashicorp/syntax/main/syntaxes/sentinel.tmGrammar.json", "hashicorp/syntax/main/LICENSE"),
 ("terraform.tmLanguage.json", "hashicorp/syntax/main/syntaxes/terraform.tmGrammar.json", "hashicorp/syntax/main/LICENSE"),
 ("toml.tmLanguage", "textmate/toml.tmbundle/master/Syntaxes/TOML.tmLanguage", ""),
 ("vue.tmLanguage", "vuejs/vue-syntax-highlight/master/vue.tmLanguage", "vuejs/vue-syntax-highlight/master/LICENSE")
)

print(f"Download directory: {DOWNLOAD_DIR}")

for (target_file, syntax_uri, licence_uri)  in syntaxes:
    print(f"Downloading [{target_file}]...")
    urllib.request.urlretrieve(URL_PREFIX + syntax_uri, os.path.join(DOWNLOAD_DIR, target_file))
    if licence_uri:
        print(f"Downloading [{target_file}] LICENSE...")
        urllib.request.urlretrieve(URL_PREFIX + licence_uri, os.path.join(DOWNLOAD_DIR, f"{target_file}.LICENSE.txt"))

print("**DONE**")
