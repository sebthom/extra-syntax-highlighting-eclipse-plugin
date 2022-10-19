#!/usr/bin/env python3
import json, os
import xml.etree.ElementTree as ET

THIS_FILE_DIR = os.path.dirname(os.path.abspath(__file__))

plugin_xml:ET = ET.parse(os.path.join(THIS_FILE_DIR, 'plugin.xml')).getroot()

ext:ET.Element = None
for ext in plugin_xml.findall("./extension[@point='org.eclipse.tm4e.registry.grammars']/grammar"):
    plugin_xml_grammar_path = ext.attrib["path"]
    plugin_xml_scope_name = ext.attrib["scopeName"]

    print(f"Validating [{plugin_xml_grammar_path}]...")
    if not os.path.exists(os.path.join(THIS_FILE_DIR, plugin_xml_grammar_path)):
        raise AssertionError(f"plugin.xml: Declared grammar path {plugin_xml_grammar_path} does not exist.")

    if plugin_xml_grammar_path.endswith(".json"):
        with open(os.path.join(THIS_FILE_DIR, plugin_xml_grammar_path), 'r') as fp:
            grammar_json:dict = json.load(fp)
            scope_name = grammar_json["scopeName"]
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
