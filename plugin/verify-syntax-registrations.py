#!/usr/bin/env python3
# SPDX-FileCopyrightText: © Sebastian Thomschke and contributors.
# SPDX-FileContributor: Sebastian Thomschke
# SPDX-License-Identifier: EPL-2.0
# SPDX-ArtifactOfProjectHomePage: https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin

import sys
MIN_PYTHON_VERSION = (3, 10)
if sys.version_info < MIN_PYTHON_VERSION:
    print(f'ERROR: This script requires at least Python {".".join(map(str, MIN_PYTHON_VERSION))} but found Python {".".join(map(str, sys.version_info[0:2]))}.')
    sys.exit(1)

import json, os, subprocess
import xml.etree.ElementTree as ET

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

##############################
# main
##############################


THIS_FILE_DIR = os.path.dirname(os.path.abspath(__file__))

log_header("Verifying syntax registrations in [plugin.xml]...")

plugin_xml:ET = ET.parse(os.path.join(THIS_FILE_DIR, 'plugin.xml')).getroot()

ext:ET.Element = None
for ext in plugin_xml.findall("./extension[@point='org.eclipse.tm4e.registry.grammars']/grammar"):
    plugin_xml_grammar_path = ext.attrib["path"]
    plugin_xml_scope_name = ext.attrib["scopeName"]

    log_info(f"Validating [{plugin_xml_grammar_path}]... ", end = "")
    if not os.path.exists(os.path.join(THIS_FILE_DIR, plugin_xml_grammar_path)):
        raise AssertionError(f"plugin.xml: Declared grammar path {plugin_xml_grammar_path} does not exist.")

    if plugin_xml_grammar_path.endswith(".json"):
        with open(os.path.join(THIS_FILE_DIR, plugin_xml_grammar_path), 'rt') as fh:
            grammar_json:dict = json.load(fh)
            scope_name = grammar_json["scopeName"]
    elif plugin_xml_grammar_path.endswith(".yaml"):
        with open(os.path.join(THIS_FILE_DIR, plugin_xml_grammar_path), 'rt') as fh:
            grammar_yaml:dict = yaml.load(fh)
            scope_name = grammar_yaml["scopeName"]
    else:
        grammar_xml:ET = ET.parse(os.path.join(THIS_FILE_DIR, plugin_xml_grammar_path)).getroot()

        elem:ET.Element = None
        next_elem_is_scope = False
        for elem in grammar_xml.findall("./dict/*"):
            if elem.tag == "key" and elem.text == "scopeName":
                next_elem_is_scope = True
            elif next_elem_is_scope:
                scope_name = elem.text
                break

    if scope_name != plugin_xml_scope_name:
        raise AssertionError(f"plugin.xml: Scope name '{plugin_xml_scope_name}' does not match scope name '{scope_name}' defined in {plugin_xml_grammar_path}.")

    log_info("OK")

log_header("**DONE**")
