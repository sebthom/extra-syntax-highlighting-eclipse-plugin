#!/usr/bin/env python3
# SPDX-FileCopyrightText: © Sebastian Thomschke and contributors.
# SPDX-FileContributor: Sebastian Thomschke
# SPDX-License-Identifier: EPL-2.0
# SPDX-ArtifactOfProjectHomePage: https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin

# USAGE: python update-syntaxes.py [REPO-ID]
# if [REPO-ID] is not specified, updates from all repos defined in syntaxes.sources.yaml are downloaded

import sys
MIN_PYTHON_VERSION = (3, 10)
if sys.version_info < MIN_PYTHON_VERSION:
    print(f'ERROR: This script requires at least Python {".".join(map(str, MIN_PYTHON_VERSION))} but found Python {".".join(map(str, sys.version_info[0:2]))}.')
    sys.exit(1)

import json, os, subprocess, urllib.request, urllib.parse, glob, re
from typing import Any

##############################
# initialize YAML support
##############################
try:
    from ruamel.yaml import YAML
except ImportError:
    subprocess.run((sys.executable, "-m", "pip", "install", "ruamel.yaml"), check = True)
    from ruamel.yaml import YAML
yaml = YAML(typ = 'safe', pure = True)


##############################
# utility functions
##############################
class ANSI:
    RESET = '\033[0m'
    BOLD = '\033[1m'
    RED = '\033[31m'
    GREEN = '\033[32m'
    YELLOW = '\033[33m'
    BLUE = '\033[34m'
    MAGENTA = '\033[35m'
    CYAN = '\033[36m'
    WHITE = '\033[37m'
    GRAY = '\033[90m'


def log_header(msg:str) -> None:
    color = ANSI.BOLD + ANSI.CYAN
    msg = msg.replace("[", "[" + ANSI.BOLD + ANSI.MAGENTA)
    msg = msg.replace("]", color + "]")
    print(color + "========================================================")
    print(msg)
    print("========================================================" + ANSI.RESET)


def log_info(msg:str, end:str = "\n") -> None:
    color = ANSI.RESET + ANSI.WHITE
    msg = msg.replace("[", "[" + ANSI.BOLD + ANSI.MAGENTA)
    msg = msg.replace("]", color + "]")
    print(color + msg + ANSI.RESET, end = end, flush = True)


def log_debug(msg:str, end:str = "\n") -> None:
    color = ANSI.RESET + ANSI.GRAY
    msg = msg.replace("[", "[" + ANSI.BOLD + ANSI.BLUE)
    msg = msg.replace("]", color + "]")
    print(color + " " + msg + ANSI.RESET, end = end, flush = True)


def is_url(url:str) -> bool:
    try:
        parts = urllib.parse.urlparse(url)
        return all([parts.scheme, parts.netloc])
    except:
        return False


def normalize_url(url:str) -> str:
    scheme, netloc, path, query, fragment = urllib.parse.urlsplit(url)
    normalized_path = os.path.normpath(path).replace(os.path.sep, "/")
    return urllib.parse.urlunsplit((scheme, netloc, normalized_path, query, fragment))


def http_get(url:str, bearer_token:str = None) -> str:
    url = normalize_url(url)
    log_debug(f"Getting [{url}]...", end = "")
    request = urllib.request.Request(url)
    if bearer_token:
        request.add_header("Authorization", "Bearer " + bearer_token)
    with urllib.request.urlopen(request) as response:
        data = response.read().decode("utf-8")
        log_debug(f"{len(data)} bytes.")
        return data


def http_get_json(url:str, bearer_token:str = None) -> dict[str, Any] | list:
    return json.loads(http_get(url, bearer_token))


def gh_api_get(resource_path:str) -> dict[str, Any] | list:
    return http_get_json(f"https://api.github.com/{resource_path}", GITHUB_TOKEN)


def gh_contents_api_get(repo_name:str, *repo_path:str) -> dict[str, Any] | list:
    path = tuple(["repos", repo_name, "contents"]) + repo_path
    return gh_api_get(re.sub("/+", "/", "/".join(path)))


def get_at(obj:dict[str, Any], property_path:str, default:Any = None) -> Any:
    for key in property_path.split("/"):
        if isinstance(obj, dict):
            if key.isdigit() and int(key) in obj:
                obj = obj[int(key)]
            else:
                obj = obj.get(key, default)
        elif isinstance(obj, (list, tuple)) and key.isdigit() and int(key) < len(obj):
            obj = obj[int(key)]
        elif hasattr(obj, key):
            obj = getattr(obj, key)
        else:
            return default
    if obj is None:
        return default
    return obj


def set_at(obj:dict[str, Any], property_path:str, value:Any) -> Any:
    path = property_path.split("/")
    for key in path[:-1]:
        if isinstance(obj, dict):
            if key.isdigit() and int(key) in obj:
                obj = obj[int(key)]
            else:
                if key not in obj:
                    obj[key] = {}
                obj = obj[key]
        elif isinstance(obj, (list, tuple)):
            if int(key) == len(obj):
                obj.append({})
            obj = obj[int(key)]
        else:
            if not hasattr(obj, key):
                setattr(obj, key, {})
            obj = getattr(obj, key)
    obj[path[-1]] = value
    return value


def read_text(file_path:str) -> str:
    file_path = os.path.normpath(file_path)
    log_debug(f"Loading [{os.path.relpath(file_path, os.getcwd())}]...")
    with open(file_path, "rt", encoding = 'utf-8') as fh:
        return fh.read()


def write_text(file_path:str, content:str) -> None:
    file_path = os.path.normpath(file_path)
    log_debug(f"Writing [{os.path.relpath(file_path, os.getcwd())}] with {len(content)} bytes...")
    os.makedirs(os.path.dirname(file_path), exist_ok = True)
    with open(file_path, "wt", encoding = 'utf-8') as fh:
        fh.write(content)


def replace_between(searchIn:str, start_tag:str, end_tag:str, replace_with:str) -> str:
    return re.sub(
        re.compile(f'{re.escape(start_tag)}(.*?){re.escape(end_tag)}', re.DOTALL),
        f'{start_tag}{replace_with}{end_tag}',
        searchIn
    )

##############################
# main
##############################


THIS_FILE_DIR = os.path.dirname(os.path.abspath(__file__))

GITHUB_TOKEN = os.environ["GITHUB_TOKEN"]

log_info("Loading [syntaxes.sources.yaml]...")
with open(f"{THIS_FILE_DIR}/syntaxes.sources.yaml") as fh:
    syntaxes_sources:dict[str, Any] = yaml.load(fh)["sources"]

log_info("Loading [syntaxes.meta.yaml]...")
with open(f"{THIS_FILE_DIR}/syntaxes.meta.yaml") as fh:
    syntaxes_meta_root = yaml.load(fh) or {}
    syntaxes_meta_root["meta"] = get_at(syntaxes_meta_root, "meta", {})
    syntaxes_meta:dict[str, Any] = syntaxes_meta_root["meta"]

DOWNLOAD_DIR = os.path.join(THIS_FILE_DIR, "syntaxes")
log_info(f"Download directory: [{DOWNLOAD_DIR}]")

#
# downloading meta info and syntax files
#
index:int = 0
repo_id:str = None
repo_cfg:dict[str, Any] = None
for index, (repo_id, repo_cfg) in enumerate(syntaxes_sources.items()):
    if len(sys.argv) > 1:
        if sys.argv[1] == repo_id:
            log_header(f"[1/1] Updating [{repo_id}]...")
        else:
            continue  # skip this source
    else:
        log_header(f"[{index+1}/{len(syntaxes_sources)}] Updating [{repo_id}]...")

    gh_repo_name:str = get_at(repo_cfg, 'github/repo')
    gh_repo_path:str = get_at(repo_cfg, 'github/path', '')

    log_info("Downloading meta info...")
    collected_repo_meta = set_at(syntaxes_meta, f"{repo_id}", {})

    #
    # locate package.json and LICENSE file
    #
    package_json_url:str = None
    for gh_file_meta in gh_contents_api_get(gh_repo_name, gh_repo_path):
        if get_at(gh_file_meta, "type") == "file":
            match get_at(gh_file_meta, "name", "").casefold():
                case "license" | "license.md" | "license.txt":
                    collected_repo_meta["license_url"] = gh_file_meta["download_url"]
                case "package.json":
                    package_json_url = gh_file_meta["download_url"]

    if get_at(repo_cfg, "license-download", True):
        if not get_at(collected_repo_meta, "license_url"):
            if gh_repo_path:
                # look for license file in repo root
                for gh_file_meta in gh_contents_api_get(gh_repo_name):
                    if get_at(gh_file_meta, "type") == "file":
                        match get_at(gh_file_meta, "name").casefold():
                            case "license" | "license.md" | "license.txt":
                                collected_repo_meta["license_url"] = gh_file_meta["download_url"]
            assert get_at(collected_repo_meta, "license_url"), f"ERROR: License file not found for [{repo_id}]"

    #
    # collect meta info
    #
    if package_json_url:
        package_json = http_get_json(package_json_url)
        download_base_url = package_json_url.replace("package.json", "")
        log_info(f"Collecting language meta...")
        for lang_info in get_at(package_json, "contributes/languages", {}):
            lang_id = lang_info["id"]
            if get_at(repo_cfg, f"languages/{lang_id}/ignore", False):
                log_debug(f"Ignoring language [{lang_id}]")
                continue
            collected_lang_meta = set_at(collected_repo_meta, f"languages/{lang_id}", {})
            collected_lang_meta["label"] = get_at(lang_info, "aliases/0", f"{lang_id} File")
            collected_lang_meta["file_extensions"] = get_at(lang_info, "extensions", [])
            collected_lang_meta["file_names"] = get_at(lang_info, "filenames", [])
            if get_at(lang_info, "configuration") and not get_at(repo_cfg, f"languages/{lang_id}/langcfg"):
                collected_lang_meta["langcfg_url"] = gh_contents_api_get(gh_repo_name, gh_repo_path, lang_info['configuration'])["download_url"]

        log_info(f"Collecting grammar meta...")
        for grammar_info in get_at(package_json, "contributes/grammars", {}):
            lang_id = get_at(grammar_info, "language")
            if get_at(repo_cfg, f"languages/{lang_id}/ignore", False):
                log_debug(f"Ignoring grammar [{lang_id}]")
                continue
            if lang_id:
                collected_lang_meta = collected_repo_meta["languages"][lang_id]
                collected_lang_meta["scope_name"] = grammar_info["scopeName"]
                if not get_at(repo_cfg, f"languages/{lang_id}/grammar"):
                    collected_lang_meta["grammar_url"] = gh_contents_api_get(gh_repo_name, gh_repo_path, grammar_info['path'])["download_url"]
    elif not get_at(repo_cfg, "languages"):
        raise "package.json not found!"

    if get_at(repo_cfg, "languages"):
        log_info(f"Collecting language meta...")
        for lang_id, lang_info in get_at(repo_cfg, "languages").items():
            if get_at(lang_info, "ignore", False):
                continue

            collected_lang_meta = get_at(collected_repo_meta, f"languages/{lang_id}")

            # if package.json is present we use the "languages:" section to augment the content from package.json
            if package_json_url and collected_lang_meta:
                collected_lang_meta["label"] = get_at(lang_info, "label", collected_lang_meta["label"])
                collected_lang_meta["scope_name"] = get_at(lang_info, "scope_name", collected_lang_meta["scope_name"])
                if get_at(lang_info, 'grammar'):
                    collected_lang_meta["grammar_url"] = gh_contents_api_get(gh_repo_name, gh_repo_path, lang_info['grammar'])["download_url"]
                collected_lang_meta["file_extensions"] = get_at(lang_info, "file_extensions", collected_lang_meta["file_extensions"])
                collected_lang_meta["file_names"] = get_at(lang_info, "file_names", collected_lang_meta["file_names"])
                collected_lang_meta["file_patterns"] = get_at(lang_info, "file_patterns", [])
            else:
                collected_lang_meta = set_at(collected_repo_meta, f"languages/{lang_id}", {})
                collected_lang_meta["label"] = lang_info["label"]
                collected_lang_meta["scope_name"] = lang_info["scope_name"]
                collected_lang_meta["grammar_url"] = gh_contents_api_get(gh_repo_name, gh_repo_path, lang_info['grammar'])["download_url"]
                collected_lang_meta["file_extensions"] = get_at(lang_info, "file_extensions")
                collected_lang_meta["file_names"] = get_at(lang_info, "file_names")
                collected_lang_meta["file_patterns"] = get_at(lang_info, "file_patterns", [])

            lang_cfg_file:str = get_at(lang_info, "langcfg")
            if lang_cfg_file:
                if is_url(lang_cfg_file):
                    collected_lang_meta["langcfg_url"] = lang_cfg_file
                else:
                    collected_lang_meta["langcfg_url"] = gh_contents_api_get(gh_repo_name, gh_repo_path, lang_info['langcfg'])["download_url"]

            example_file:str = get_at(lang_info, "example")
            if example_file:
                if is_url(example_file):
                    collected_lang_meta["example_url"] = example_file
                else:
                    collected_lang_meta["example_url"] = gh_contents_api_get(gh_repo_name, gh_repo_path, lang_info['example'])["download_url"]

    #
    # download files
    #
    syntax_dir = os.path.join(DOWNLOAD_DIR, repo_id)

    # download LICENSE file
    license_url = get_at(collected_repo_meta, "license_url")
    if license_url:
        log_info("Downloading LCICENSE file...")
        write_text(f"{syntax_dir}/LICENSE.txt", http_get(license_url))

    for (lang_id, lang_meta) in collected_repo_meta["languages"].items():
        log_info(f"Downloading [{lang_id}] syntax files...")

        # download TextMate grammar file
        grammar_url = lang_meta["grammar_url"]
        match os.path.splitext(grammar_url)[1].casefold():
            case ".json" | ".json-tmlanguage":
                write_text(f"{syntax_dir}/{lang_id}.tmLanguage.json", http_get(grammar_url))
            case ".yml" | ".yaml" | ".yaml-tmlanguage":
                # yaml_content = yaml.load(http_get(grammar_url))
                # with open(f"{syntax_dir}/{lang_id}.tmLanguage.json", 'w') as fh:
                #    json.dump(yaml_content, fh, indent = 4)
                write_text(f"{syntax_dir}/{lang_id}.tmLanguage.yaml", http_get(grammar_url))
            case ".plist" | ".xml" | ".tmlanguage":
                write_text(f"{syntax_dir}/{lang_id}.tmLanguage.plist", http_get(grammar_url))
            case _:
                raise f"Unknown grammar file extension: {os.path.splitext(grammar_url)[1]}"

        # download language configuration
        langcfg_url = get_at(lang_meta, "langcfg_url")
        if langcfg_url:
            write_text(f"{syntax_dir}/{lang_id}.langcfg.json", http_get(langcfg_url))

        # download example
        example_url = get_at(lang_meta, "example_url")
        if example_url:
            example_file_ext = os.path.splitext(example_url)[1]
            write_text(f"{syntax_dir}/{lang_id}.example{example_file_ext}", http_get(example_url))

    log_info("Updating [syntaxes.meta.yaml]...")
    with open(f"{THIS_FILE_DIR}/syntaxes.meta.yaml", 'w') as fh:
        fh.write("# AUTO-GENERATED FILE - Do not edit manually; changes will be lost.\n")
        yaml.dump(syntaxes_meta_root, fh)

#
# updating plugin.xml
#
log_header("Updating [plugin.xml]...")

plugin_lines:list[str] = []
for (repo_id, repo_meta) in sorted(syntaxes_meta.items()):
    for (lang_id, lang_meta) in sorted(repo_meta["languages"].items()):
        file_associations = []
        if get_at(lang_meta, "file_extensions"):
            file_associations.append('file-extensions="' + (",".join(sorted(set([ ext.lstrip('.') for ext in get_at(lang_meta, "file_extensions", [])]))) + '"'))
        if get_at(lang_meta, "filen_ames"):
            file_associations.append('file-names="' + (",".join(sorted(set(get_at(lang_meta, "filen_ames", []))))) + '"')
        if get_at(lang_meta, "file_patterns"):
            file_associations.append('file-patterns="' + (",".join(sorted(set(get_at(lang_meta, "file_patterns", []))))) + '"')
        syntax_dir = os.path.join(DOWNLOAD_DIR, repo_id)
        grammar_files = glob.glob(f"{lang_id}.tmLanguage.*", root_dir = syntax_dir)
        comment_title = f"{repo_id}/{lang_id}: {lang_meta['label']}"
        comment_title = comment_title + ((30 - len(comment_title)) * " ")
        plugin_lines.append(f"""
   <!-- ============================== -->
   <!-- {comment_title} -->
   <!-- ============================== -->
   <extension point="org.eclipse.core.contenttype.contentTypes">
      <content-type base-type="exta-syntax-highlighting.base" priority="normal" id="exta-syntax-highlighting.{lang_id}" name="{lang_meta['label']}"
                    {" ".join(file_associations)} />
      <file-association content-type="exta-syntax-highlighting.{lang_id}" {" ".join(file_associations)} />
   </extension>
   <extension point="org.eclipse.ui.editors">
      <editorContentTypeBinding editorId="org.eclipse.ui.genericeditor.GenericEditor" contentTypeId="exta-syntax-highlighting.{lang_id}" />
   </extension>
   <extension point="org.eclipse.tm4e.registry.grammars">
      <grammar path="syntaxes/{repo_id}/{grammar_files[0]}" scopeName="{lang_meta['scope_name']}" />
      <scopeNameContentTypeBinding contentTypeId="exta-syntax-highlighting.{lang_id}" scopeName="{lang_meta['scope_name']}" />
   </extension>""")

        if os.path.exists(os.path.join(syntax_dir, f"{lang_id}.langcfg.json")):
           plugin_lines.append(f"""
   <extension point="org.eclipse.tm4e.languageconfiguration.languageConfigurations">
      <languageConfiguration contentTypeId="exta-syntax-highlighting.{lang_id}" path="syntaxes/{repo_id}/{lang_id}.langcfg.json" />
   </extension>""")

        example_files = glob.glob(f"{lang_id}.example.*", root_dir = syntax_dir)
        if example_files:
           plugin_lines.append(f"""
   <extension point="org.eclipse.tm4e.ui.snippets">
      <snippet name="{lang_meta['label']} Example" path="syntaxes/{repo_id}/{example_files[0]}" scopeName="{lang_meta['scope_name']}" />
   </extension>""")

write_text(f"{THIS_FILE_DIR}/plugin.xml", replace_between(
    read_text(f"{THIS_FILE_DIR}/plugin.xml"),
    "<!-- START-GENERATED -->",
    "<!-- END-GENERATED -->",
    "\n".join(plugin_lines) + "\n   "
))
log_header("**DONE**")
