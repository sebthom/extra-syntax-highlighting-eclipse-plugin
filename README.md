# "Extra Syntax Highlighting" plugin for Eclipse

[![Build Status](https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin/actions/workflows/build.yml/badge.svg)](https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin/actions/workflows/build.yml)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.1%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)
[![License](https://img.shields.io/github/license/sebthom/extra-syntax-highlighting-eclipse-plugin.svg?color=blue)](LICENSE.txt)
[![Eclipse Marketplace](https://img.shields.io/eclipse-marketplace/dt/extra-syntax-highlighting-plugin?logo=eclipse&label=Downloads)](https://marketplace.eclipse.org/content/extra-syntax-highlighting-plugin)


**Feedback and high-quality pull requests are highly welcome!**

1. [What is it?](#what-is-it)
1. [Installation](#installation)
1. [Supported File Formats/Languages](#supported-fileformats)
1. [Building from Sources](#building)
1. [License](#license)


## <a name="what-is-it"></a>What is it?

This [EclipseⓇ](https://eclipse.org) plug-in adds syntax highlighting support for the following languages/file formats utilizing [TM4E](https://github.com/eclipse/tm4e):
1. Amber - https://amber-lang.com/
1. ANTRL4 - https://www.antlr.org/
1. Apache HTTP configuration files - https://httpd.apache.org/docs/current/configuring.html
1. Astro - https://astro.build/
1. Ballerina - https://ballerina.io/
1. Bazel - https://bazel.build/
1. BF - https://en.wikipedia.org/wiki/Brainfuck
1. Carbon - https://carbon-lang.dev
1. COBOL - https://en.wikipedia.org/wiki/COBOL
1. CodeQL - https://codeql.github.com/
1. Crystal (`*.cr`) - https://crystal-lang.org/
1. CSV (`*.cvs`) / TSV (`*.tab*`, `*.tsv*`)
1. D2 - https://d2lang.com/
1. Eclipse External null Annotations (`*.eea`) - https://github.com/eclipse-jdt/eclipse.jdt.core/wiki/Null-Analysis-External-Annotations#file-format
1. EditorConfig - https://editorconfig.org
1. Elm - https://elm-lang.org/
1. Entity-Relationship Diagram (`*.er`) - https://github.com/BurntSushi/erd
1. Erlang (`*.erl`) - https://www.erlang.org/
1. Fish (`*.fish`) - https://fishshell.com/docs/current/language.html
1. Fluent (`*.flt`) - https://projectfluent.org/
1. Fortran - https://fortran-lang.org/
1. gitattributes - https://git-scm.com/docs/gitattributes
1. Gleam (`*.gleam`) - https://gleam.run/
1. GLSL (OpenGL Shading Language) - https://registry.khronos.org/OpenGL/index_gl.php#apispecs
1. GraphQL - https://graphql.org/
1. Graphviz Dot (`*.dot`) - https://graphviz.org/doc/info/lang.html
1. HashiCorp HCL (`*.hcl`) - https://github.com/hashicorp/hcl (e.g. used by HasiCorp Packer)
1. HashiCorp Sentinel (`*.sentinel`) - https://www.hashicorp.com/sentinel
1. HashiCorp Terraform (`*.tf`) - https://www.terraform.io/
1. Haxe - https://haxe.org
1. Helm (`*.tpl`) - https://helm.sh/
1. Janet - https://janet-lang.org/
1. Jinja Templates - https://jinja.palletsprojects.com/
1. JSON5 (`*.json5`) - https://json5.org/
1. Jsonnet (`*.jsonnet`) - https://jsonnet.org/
1. jte: Java Template Engine (`*.jte`) - https://jte.gg/
1. Kotlin - https://kotlinlang.org/
1. LDIF - https://en.wikipedia.org/wiki/LDAP_Data_Interchange_Format
1. Mako Templates (`*.mako`) - https://www.makotemplates.org/
1. Markdoc (`*.markdoc`) - https://markdoc.dev/
1. Markdown (`*.md`) - https://daringfireball.net/projects/markdown/
1. MDX (`*.mdx`) - https://mdxjs.com/
1. Mermaid (`*.mmd, *.mermaid`) - https://github.com/mermaid-js/mermaid/
1. NginX (`nginx.conf`) - https://www.nginx.com/
1. Nunjucks (`*.njk`) - https://mozilla.github.io/nunjucks/
1. Nushell (`*.nu`) - https://github.com/nushell/nushell
1. OCaml (`*.ml`) - https://ocaml.org/
1. Odin - https://odin-lang.org/
1. Pascal (`*.pas`) - https://en.wikipedia.org/wiki/Pascal_(programming_language)
1. PlantUML (`*.pu`) - https://plantuml.com/
1. Pony (`*.pony`) - https://www.ponylang.io/
1. Prisma - https://www.prisma.io/
1. Reason (`*.re`) - https://reasonml.github.io/
1. Roc (`*.roc`) - https://www.roc-lang.org/
1. Svelte - https://svelte.dev/
1. TOML - https://toml.io/en/
1. Twig Templates (`*.twig`) - https://twig.symfony.com/
1. Wing - https://www.winglang.io/
1. Zig - https://ziglang.org/

For a lot more formats install the TM4E **Language Pack** from the TM4E update site https://download.eclipse.org/tm4e/releases/latest/

For the following languages/file formats you can also install specialised Eclipse plug-ins with additional features:
- HTML, CSS, SCSS, SASS, LESS, JavaScript, TypeScript, JSON, YAML (incl. Kubernetes schema validation), XML, XSL, XSD, DTD, ESLint, Angular React (JSX, TSX), Vue.js: [Wild Web Developer](https://marketplace.eclipse.org/content/wild-web-developer-html-css-javascript-typescript-nodejs-angular-json-yaml-kubernetes-xml)
- AsciiDoc: [Asciidoctor Editor](https://marketplace.eclipse.org/content/asciidoctor-editor)
- Bash Scripts: [ShellWax](https://marketplace.eclipse.org/content/shellwax) or [Bash Editor](https://marketplace.eclipse.org/content/bash-editor)
- Dockerfile: [Eclipse Docker Tooling](https://marketplace.eclipse.org/content/eclipse-docker-tooling)
- Groovy: [Groovy Development Tools](https://marketplace.eclipse.org/content/groovy-development-tools)
- Jenkins Pipelines (`Jenkinsfile`): [Jenkins Editor](https://marketplace.eclipse.org/content/jenkins-editor)
- Python: [PyDev - Python IDE for Eclipse](https://marketplace.eclipse.org/content/pydev-python-ide-eclipse)
- SQL: [SQL Editor](https://marketplace.eclipse.org/content/sql-editor) or [DBeaver](https://marketplace.eclipse.org/content/dbeaver) or [PL/SQL Workbench](https://marketplace.eclipse.org/content/plsql-enterprise-workbench)
- Windows Batch Files (`*.bat`, `*.cmd`): [Batch Editor](https://marketplace.eclipse.org/content/batch-editor)
- JSON: [JSON Editor Plugin](https://marketplace.eclipse.org/content/json-editor-plugin) or [Hi(speed)JSON Editor](https://marketplace.eclipse.org/content/hijson-editor) or [Wild Web Developer](https://marketplace.eclipse.org/content/wild-web-developer-html-css-javascript-typescript-nodejs-angular-json-yaml-kubernetes-xml)
- YAML: [YAML Editor](https://marketplace.eclipse.org/content/yaml-editor) or [Wild Web Developer](https://marketplace.eclipse.org/content/wild-web-developer-html-css-javascript-typescript-nodejs-angular-json-yaml-kubernetes-xml)


## <a name="installation"></a>Installation

To install the plugin into an existing Eclipse installation do:
1. Within Eclipse go to: Help -> Install New Software...
1. Enter the following update site URL: https://raw.githubusercontent.com/sebthom/extra-syntax-highlighting-eclipse-plugin/updatesite
1. Select the `Extra Syntax Highlighting` feature to install.
1. Ensure that the option `Contact all update sites during install to find required software` is enabled.
1. Click `Next` twice.
1. Read/accept the license terms and click `Finish`.
1. Eclipse will now download the necessary files in the background.
1. When the download has finished, Eclipse will ask about installing unsigned content. You need to accept if you want to
1. After installation you will be prompted for a restart of Eclipse, which is recommended.


## <a name="supported-fileformats"></a>Supported File Formats/Languages

<!-- START-GENERATED -->

| Language/Format | File Associations | Source
|:--------------- |:----------------- |:------ |
| Amber <img src="plugin/syntaxes/amber/amber.icon.png" width=16/> | file-extensions="ab, amber" | [main@amber-lang/amber-vsc](https://github.com/amber-lang/amber-vsc/tree/c0ebd53e075698fa62efffd492a41b27bff1c227/)
| ANTLR <img src="plugin/syntaxes/antlr4/icon.png" width=16/> | file-extensions="g, g4" | [master@mike-lischke/vscode-antlr4](https://github.com/mike-lischke/vscode-antlr4/tree/8408f1d50c59bc81f52795525ad41a6b50787316/)
| Apache HTTP Config <img src="plugin/syntaxes/apache-http/icon.png" width=16/> | file-extensions="conf, htaccess, htgroups, htpasswd" | [master@mrmlnc/vscode-apache](https://github.com/mrmlnc/vscode-apache/tree/0585b0bb3d390fc541aa27cfcfb83b3204156be3/)
| Astro <img src="plugin/syntaxes/astro/astro.icon.png" width=16/> | file-extensions="astro" | [main@withastro/language-tools](https://github.com/withastro/language-tools/tree/b4bcb4fc02cd960936a5faee6c9cc0ad94fc4c05/packages/vscode)
| Ballerina | file-extensions="bal" | [master@ballerina-platform/ballerina-grammar](https://github.com/ballerina-platform/ballerina-grammar/tree/10325fc5436a87606407ba68bf668bcd59dc180d/syntaxes)
| bazelrc <img src="plugin/syntaxes/bazel/icon.png" width=16/> | file-extensions="bazelrc"<br />file-names=".bazelrc, bazel.rc" | [master@bazelbuild/vscode-bazel](https://github.com/bazelbuild/vscode-bazel/tree/7aa2304cc12907be76d80716c21815ace5f591c6/)
| Branflakes <img src="plugin/syntaxes/bf/icon.png" width=16/> | file-extensions="bf, bfsck, brainfuck" | [main@chrisvrose/bf-server](https://github.com/chrisvrose/bf-server/tree/5945c04ccea21cd13e133547276d27d6540375f2/)
| Carbon | file-extensions="carbon" | [trunk@carbon-language/carbon-lang](https://github.com/carbon-language/carbon-lang/tree/5d0d443c985d2c7ada939e1c8bf3f1023689cd88/utils)
| COBOL <img src="plugin/syntaxes/cobol/icon.png" width=16/> | file-extensions="cbl, cob, cobol, copy, cpy"<br />file-patterns="\*\*/broadcommfd.cobol-language-support/\*/copybooks/\*\*" | [development@eclipse-che4z/che-che4z-lsp-for-cobol](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/tree/364a44e1f096609106c3ad2ae554ce42c54856a4/clients/cobol-lsp-vscode-extension)
| CodeQL <img src="plugin/syntaxes/codeql/icon.png" width=16/> | file-extensions="ql, qll" | [main@github/vscode-codeql](https://github.com/github/vscode-codeql/tree/455e1098455e4e9a76612eec3166726bcecb7fdb/)
| Crystal <img src="plugin/syntaxes/crystal/icon.png" width=16/> | file-extensions="cr" | [master@crystal-lang-tools/vscode-crystal-lang](https://github.com/crystal-lang-tools/vscode-crystal-lang/tree/5f14b919a52e4149587d1b72dc34fe2afa371a1e/) [[upstream]](https://github.com/Microsoft/vscode/blob/3f1f36333d3453f67a36b6bfb1206e9159e9c4f0/extensions/ruby/syntaxes/ruby.tmLanguage.json)
| Crystal Slang <img src="plugin/syntaxes/crystal/icon.png" width=16/> | file-extensions="slang" | [master@crystal-lang-tools/vscode-crystal-lang](https://github.com/crystal-lang-tools/vscode-crystal-lang/tree/5f14b919a52e4149587d1b72dc34fe2afa371a1e/)
| CSV <img src="plugin/syntaxes/csv/icon.png" width=16/> | file-extensions="csv" | [master@mechatroner/vscode_rainbow_csv](https://github.com/mechatroner/vscode_rainbow_csv/tree/0166b04d884ae71600221fe3d934fbec3469638a/)
| d2 <img src="plugin/syntaxes/d2/d2.icon.png" width=16/> | file-extensions="d2" | [master@terrastruct/d2-vscode](https://github.com/terrastruct/d2-vscode/tree/88d9716009f9b8d65bfd6dea96064c94a5cf275f/)
| EditorConfig <img src="plugin/syntaxes/editorconfig/icon.png" width=16/> | file-extensions="editorconfig" | [main@editorconfig/editorconfig-vscode](https://github.com/editorconfig/editorconfig-vscode/tree/d8387a92d96ef046dea0b7494f65375f9a78bc60/)
| Elm <img src="plugin/syntaxes/elm/icon.png" width=16/> | file-extensions="elm" | [main@elm-tooling/elm-language-client-vscode](https://github.com/elm-tooling/elm-language-client-vscode/tree/cc3a7c463a7af57639ee91d4717be1723a936156/)
| Embedded Crystal <img src="plugin/syntaxes/crystal/icon.png" width=16/> | file-extensions="ecr" | [master@crystal-lang-tools/vscode-crystal-lang](https://github.com/crystal-lang-tools/vscode-crystal-lang/tree/5f14b919a52e4149587d1b72dc34fe2afa371a1e/)
| Entity Relationship <img src="plugin/syntaxes/er/icon.png" width=16/> | file-extensions="er" | [master@mikkel-ol/vsc-er-syntax-highlighting](https://github.com/mikkel-ol/vsc-er-syntax-highlighting/tree/ffc822eb4edf4448f7ad375806e255b3e6370054/)
| Erlang <img src="plugin/syntaxes/erlang/icon.png" width=16/> | file-extensions="config, erl, escript, hrl, src" | [main@erlang-ls/vscode](https://github.com/erlang-ls/vscode/tree/1e5bc08853523c6dcd563fa7de8af597710eaa8f/)
| Fish <img src="plugin/syntaxes/fish/icon.png" width=16/> | file-extensions="fish" | [main@bmalehorn/vscode-fish](https://github.com/bmalehorn/vscode-fish/tree/0741d59ecf3d2aa018543747874eb8f34c655612/)
| fluent <img src="plugin/syntaxes/fluent/fluent.icon.png" width=16/> | file-extensions="ftl" | [master@macabeus/vscode-fluent](https://github.com/macabeus/vscode-fluent/tree/9f2a1c1f39175c1d4da46e5a14f1b11c6d466b63/)
| Fortran <img src="plugin/syntaxes/fortran/FortranFreeForm.icon.png" width=16/> | file-extensions="F03, F08, F18, F90, F95, FPP, FYPP, PF, f03, f08, f18, f90, f95, fpp, fypp, pf" | [main@fortran-lang/vscode-fortran-support](https://github.com/fortran-lang/vscode-fortran-support/tree/81c5707cb5400f46f3d862449e319a6c317d9472/)
| Fortran77 <img src="plugin/syntaxes/fortran/FortranFixedForm.icon.png" width=16/> | file-extensions="F, F77, FOR, f, f77, for" | [main@fortran-lang/vscode-fortran-support](https://github.com/fortran-lang/vscode-fortran-support/tree/81c5707cb5400f46f3d862449e319a6c317d9472/)
| Gleam <img src="plugin/syntaxes/gleam/gleam.icon.png" width=16/> | file-extensions="gleam" | [main@gleam-lang/vscode-gleam](https://github.com/gleam-lang/vscode-gleam/tree/9f28a4a0bffaccadf74f56ab72310187cd3ff6e2/)
| GraphQL <img src="plugin/syntaxes/graphql/icon.png" width=16/> | file-extensions="gql, graphql, graphqls" | [main@graphql/graphiql](https://github.com/graphql/graphiql/tree/aacdc8586fa4346a4681e73e29af7afda4718617/packages/vscode-graphql-syntax)
| GraphViz DOT File | file-extensions="dot" | [master@textmate/graphviz.tmbundle](https://github.com/textmate/graphviz.tmbundle/tree/d1d489f893a0e6ef5d9021bf7dc1ffd08b3f9b90/Syntaxes)
| HashiCorp Sentinel | file-extensions="sentinel" | [main@hashicorp/syntax](https://github.com/hashicorp/syntax/tree/f1c438932384c2d249a3a0d7a336cb9089865f42/)
| HashiCorp Terraform | file-extensions="tf, tfvars" | [main@hashicorp/syntax](https://github.com/hashicorp/syntax/tree/f1c438932384c2d249a3a0d7a336cb9089865f42/)
| Haxe | file-extensions="hx" | [master@vshaxe/haxe-TmLanguage](https://github.com/vshaxe/haxe-TmLanguage/tree/6fbbbf958448f877a8d524a589e3280514c950e6/)
| HCL Config File | file-extensions="hcl" | [main@hashicorp/syntax](https://github.com/hashicorp/syntax/tree/f1c438932384c2d249a3a0d7a336cb9089865f42/)
| helm-template <img src="plugin/syntaxes/helm/icon.png" width=16/> | file-patterns="\*\*/templates/\*\*/\*.tpl, \*\*/templates/\*\*/\*.yaml, \*\*/templates/\*\*/\*.yml, \*\*/templates/\*.tpl, \*\*/templates/\*.yaml, \*\*/templates/\*.yml" | [master@vscode-kubernetes-tools/vscode-kubernetes-tools](https://github.com/vscode-kubernetes-tools/vscode-kubernetes-tools/tree/26e5214fa89071b48677186385db84725f6e45ba/)
| Janet <img src="plugin/syntaxes/janet/icon.png" width=16/> | file-extensions="janet" | [master@janet-lang/vscode-janet](https://github.com/janet-lang/vscode-janet/tree/0225a87fb8c75d9dec024d592f2bdcf74f366e5e/)
| Jinja C++ <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="c.j2, c.jinja, c.jinja2, cpp.j2, cpp.jinja, cpp.jinja2, h.j2, h.jinja, h.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Cisco Config <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="cisco.j2, cisco.jinja, cisco.jinja2, ios.j2, ios.jinja, ios.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja CSS <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="css.j2, css.jinja, css.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Cython <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="pxd.j2, pxd.jinja, pxd.jinja2, pxi.j2, pxi.jinja, pxi.jinja2, pyx.j2, pyx.jinja, pyx.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Dockerfile <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="dockerfile.j2, dockerfile.jinja, dockerfile.jinja2"<br />file-names="Dockerfile.j2, Dockerfile.jinja, Dockerfile.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Groovy <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="groovy.j2, groovy.jinja, groovy.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja HTML <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="htm.j2, htm.jinja, htm.jinja2"<br />file-patterns="\*html.j2, \*html.jinja, \*html.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Java <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="java.j2, java.jinja, java.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja JavaScript <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="js.j2, js.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja JSON <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="code-workspace.j2, code-workspace.jinja, code-workspace.jinja2, json.j2, json.jinja, json.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja LaTeX <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="latex.j2, latex.jinja2, tex.j2, tex.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Lua <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="lua.j2, lua.jinja, lua.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Markdown <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="md.j2, md.jinja, md.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Nginx <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="conf.j2, conf.jinja, conf.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja PHP <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="php.j2, php.jinja, php.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Properties/ini/Conf <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="cfg.j2, conf.j2, desktop.j2, directory.j2, ini.j2, properties.j2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Python <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="py.j2, py.jinja, py.jinja2, pyi.j2, pyi.jinja, pyi.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Ruby <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="rb.j2, rb.jinja2, rbw.j2, rbw.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Rust <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="rs.j2, rs.jinja, rs.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Shell Script <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="bash.j2, bash_aliases.j2, bash_login.j2, bash_logout.j2, bash_profile.j2, bashrc.j2, ebuild.j2, env.j2, env.jinja, env.jinja2, install.j2, ksh.j2, profile.j2, sh.j2, zlogin.j2, zlogout.j2, zprofile.j2, zsh-theme.j2, zsh.j2, zshenv.j2, zshrc.j2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja SQL <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="sql.j2, sql.jinja, sql.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Systemd Unit File <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="automount.j2, automount.jinja, automount.jinja2, device.j2, device.jinja, device.jinja2, link.j2, link.jinja, link.jinja2, mount.j2, mount.jinja, mount.jinja2, netdev.j2, netdev.jinja, netdev.jinja2, network.j2, network.jinja, network.jinja2, path.j2, path.jinja, path.jinja2, scope.j2, scope.jinja, scope.jinja2, service.j2, service.jinja, service.jinja2, slice.j2, slice.jinja, slice.jinja2, snapshot.j2, snapshot.jinja, snapshot.jinja2, socket.j2, socket.jinja, socket.jinja2, swap.j2, swap.jinja, swap.jinja2, target.j2, target.jinja, target.jinja2, timer.j2, timer.jinja, timer.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja Terraform <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="hcl.j2, hcl.jinja, hcl.jinja2, tf.j2, tf.jinja, tf.jinja2, tfvars.j2, tfvars.jinja, tfvars.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja TOML <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="toml.j2, toml.jinja, toml.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja TypeScript <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="ts.j2, ts.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja XML <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="xml.j2, xml.jinja, xml.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| Jinja YAML <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="sls, yaml.j2, yaml.jinja, yaml.jinja2, yml.j2, yml.jinja, yml.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/d8daf5fd43941deec8803be2335b35922e3e1eeb/)
| JSON5 | file-extensions="json5" | [master@katjanakosic/vscode-json5](https://github.com/katjanakosic/vscode-json5/tree/4bf68072f00ee0cc3cd0e82c4b27364c888fcb12/)
| Jsonnet <img src="plugin/syntaxes/jsonnet/icon.png" width=16/> | file-extensions="jsonnet, libsonnet" | [main@grafana/vscode-jsonnet](https://github.com/grafana/vscode-jsonnet/tree/bfb5ac332d620a6f66d61d6b9c8125bacaba7cd4/)
| JTE Templates <img src="plugin/syntaxes/jte/icon.png" width=16/> | file-extensions="jte, kte" | [main@maj2c/jte-template-syntax-highlight](https://github.com/maj2c/jte-template-syntax-highlight/tree/0b1242fdccb25bc9f72fccef48c51b01d9ac354d/)
| Kotlin <img src="plugin/syntaxes/kotlin/icon.png" width=16/> | file-extensions="kt, kts" | [main@fwcd/vscode-kotlin](https://github.com/fwcd/vscode-kotlin/tree/4a7c1538754828c1d22a8bee8ff3400045b4352a/)
| LDIF File | file-extensions="ldif" | [master@FlashSystems/LDIF-Syntax](https://github.com/FlashSystems/LDIF-Syntax/tree/f00c21eb1cc5fe5966cf6ef158e854a65449a9fa/)
| Mako Template | file-extensions="mako" | [master@marconi/mako-tmbundle](https://github.com/marconi/mako-tmbundle/tree/45037e4e98f0c215b55b194d303811d43b85407c/Syntaxes)
| Markdoc <img src="plugin/syntaxes/markdoc/icon.png" width=16/> | file-extensions="markdoc, markdoc.md, mdoc" | [main@markdoc/language-server](https://github.com/markdoc/language-server/tree/a6b8babf602735dc31bae1d10fad903dc40c9761/)
| Markdown | file-extensions="livemd, markdown, md, mdown, mdwn, mkd, mkdn, mkdown, ronn, scd, workbook" | [main@wooorm/markdown-tm-language](https://github.com/wooorm/markdown-tm-language/tree/c78b1e5df644d24fa76716bbe26f4b48a6fc1610/)
| MDX <img src="plugin/syntaxes/mdx/mdx.icon.png" width=16/> | file-extensions="mdx" | [main@mdx-js/mdx-analyzer](https://github.com/mdx-js/mdx-analyzer/tree/4851c2df02cd9c25a3cebc34cf9c4c1841c1feab/packages/vscode-mdx)
| mermaid <img src="plugin/syntaxes/mermaid/icon.png" width=16/> | file-extensions="mermaid, mmd" | [master@bpruitt-goddard/vscode-mermaid-syntax-highlight](https://github.com/bpruitt-goddard/vscode-mermaid-syntax-highlight/tree/dad1cad24565f4004d871f4b27f7443130655de4/)
| NDVR-COBOL <img src="plugin/syntaxes/cobol/icon.png" width=16/> | file-extensions="cbl.prnt, cob.prnt, cobol.prnt, copy.prnt, cpy.prnt" | [development@eclipse-che4z/che-che4z-lsp-for-cobol](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/tree/364a44e1f096609106c3ad2ae554ce42c54856a4/clients/cobol-lsp-vscode-extension)
| NGINX Conf <img src="plugin/syntaxes/nginx/icon.png" width=16/> | file-extensions="conf, fastcgi_params, nginx, scgi_params, uwsgi_params"<br />file-patterns="\*.conf.default, \*.conf.template, \*.mime.types, \*.nginx.conf" | [main@almir/nginx-syntax-highlighter](https://github.com/almir/nginx-syntax-highlighter/tree/03fa6617212032f1d538891730bb15feb4df2ef8/)
| Nunjucks HTML <img src="plugin/syntaxes/nunjucks/icon.png" width=16/> | file-extensions="njk, njk.html" | [main@edheltzel/better-nunjucks-for-visual-studio-code](https://github.com/edheltzel/better-nunjucks-for-visual-studio-code/tree/83bfc919563c30f8eeb1548f983e143adad29781/)
| nushell <img src="plugin/syntaxes/nushell/nushell.icon.png" width=16/> | file-extensions="nu" | [main@nushell/vscode-nushell-lang](https://github.com/nushell/vscode-nushell-lang/tree/544de244f118d57d78f0971c1797d427e90d2cb6/)
| OCaml <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="eliom, ml, ocamlinit" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/2ccb002979ca59c589b5095a67e51c6304701470/)
| OCaml Interface <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="eliomi, mli" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/2ccb002979ca59c589b5095a67e51c6304701470/)
| OCaml.mlx <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="mlx" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/2ccb002979ca59c589b5095a67e51c6304701470/)
| OCamlFormat <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="ocamlformat" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/2ccb002979ca59c589b5095a67e51c6304701470/)
| odin <img src="plugin/syntaxes/odin/odin.icon.png" width=16/> | file-extensions="odin" | [master@DanielGavin/ols](https://github.com/DanielGavin/ols/tree/787544c10e5842efc9990a12de680b471333ba4a/editors/vscode)
| opam <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="opam, opam.locked, opam.template"<br />file-names="opam" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/2ccb002979ca59c589b5095a67e51c6304701470/)
| OpenGL Shading Language <img src="plugin/syntaxes/glsl/icon.png" width=16/> | file-extensions="comp, csh, frag, fs, fsh, fshader, geom, glsl, gs, gsh, gshader, mesh, rahit, rcall, rchit, rgen, rint, rmiss, task, tesc, tese, vert, vs, vsh, vshader" | [master@GeForceLegend/vscode-glsl](https://github.com/GeForceLegend/vscode-glsl/tree/da57fa1415d5b77191ee8566f2b4b6cd9dbb3572/)
| Pascal | file-extensions="dfm, dpk, dpr, fmx, lfm, lpr, p, pas" | [master@textmate/pascal.tmbundle](https://github.com/textmate/pascal.tmbundle/tree/3b11b782368065e55acce0423f385722771d28b0/Syntaxes)
| PlantUML <img src="plugin/syntaxes/plantuml/icon.png" width=16/> | file-extensions="iuml, plantuml, pu, puml, wsd" | [master@qjebbs/vscode-plantuml](https://github.com/qjebbs/vscode-plantuml/tree/7bc1758ed73dc269f5721d78c6c6c01f461d7cb0/)
| Pony | file-extensions="pony" | [main@chalcolith/eohippus](https://github.com/chalcolith/eohippus/tree/de8031c34fbde4b124e4f0f34fa3fd84c4795bac/eohippus-vscode)
| Prisma <img src="plugin/syntaxes/prisma/prisma.icon.png" width=16/> | file-extensions="prisma" | [main@prisma/language-tools](https://github.com/prisma/language-tools/tree/e24a4a5990adaca484624a414cdea1642e9df211/packages/vscode)
| Reason <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="re, rei" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/2ccb002979ca59c589b5095a67e51c6304701470/)
| Ring <img src="plugin/syntaxes/ring/ring.icon.png" width=16/> | file-extensions="rform, rh, ring" | [master@ring-lang/ring](https://github.com/ring-lang/ring/tree/b85b08b6e5bc25e5b3c7978dae3c2d3e57e2614e/tools/editors/vscode/extension)
| Roc <img src="plugin/syntaxes/roc/roc.icon.png" width=16/> | file-extensions="roc" | [main@ivan-demchenko/roc-vscode-unofficial](https://github.com/ivan-demchenko/roc-vscode-unofficial/tree/f60596f4b8d65937e7a8df2c0b454a3a309aa91e/)
| Starlark <img src="plugin/syntaxes/bazel/icon.png" width=16/> | file-extensions="BUILD, WORKSPACE, bazel, bzl, bzlmod, sky, star"<br />file-names="BUILD, WORKSPACE" | [master@bazelbuild/vscode-bazel](https://github.com/bazelbuild/vscode-bazel/tree/7aa2304cc12907be76d80716c21815ace5f591c6/)
| Svelte <img src="plugin/syntaxes/svelte/icon.png" width=16/> | file-extensions="svelte" | [master@sveltejs/language-tools](https://github.com/sveltejs/language-tools/tree/229b9d4dd83116560c1611b25ec74b7112cf2d5d/packages/svelte-vscode)
| TOML Config File <img src="plugin/syntaxes/toml/icon.png" width=16/> | file-extensions="toml"<br />file-names="Cargo.lock, Pipfile, pdm.lock" | [master@juggernautjp/less-toml](https://github.com/juggernautjp/less-toml/tree/13eb891232e98c4a9c595bf8c657893c84edf3a9/) [[upstream]](https://github.com/textmate/toml.tmbundle/commit/e82b64c1e86396220786846201e9aa3f0a2d9ca2)
| TSV <img src="plugin/syntaxes/csv/icon.png" width=16/> | file-extensions="tab, tsv" | [master@mechatroner/vscode_rainbow_csv](https://github.com/mechatroner/vscode_rainbow_csv/tree/0166b04d884ae71600221fe3d934fbec3469638a/)
| Twig <img src="plugin/syntaxes/twig/icon.png" width=16/> | file-extensions="peb, twig" | [main@rholdos/vscode-twig-language-support](https://github.com/rholdos/vscode-twig-language-support/tree/f1e9a1722c91d3f3b3c548386861fd01bfdbeb3b/)
| Wing <img src="plugin/syntaxes/wing/wing.icon.png" width=16/> | file-extensions="w, wsim" | [main@winglang/wing](https://github.com/winglang/wing/tree/8fb4c792ce202afb08b3aec9fc61f902d8c7efc6/packages/vscode-wing)
| Zig <img src="plugin/syntaxes/zig/icon.png" width=16/> | file-extensions="zig, zon" | [master@ziglang/vscode-zig](https://github.com/ziglang/vscode-zig/tree/38309f0b1dc0c1bdc4b23e78594302bf28ef43d1/)

<!-- END-GENERATED -->


## <a id="building"></a>Building from Sources

To ensure reproducible builds this Maven project inherits from the [vegardit-maven-parent](https://github.com/vegardit/vegardit-maven-parent)
project which declares fixed versions and sensible default settings for all official Maven plug-ins.

The project also uses the [maven-toolchains-plugin](http://maven.apache.org/plugins/maven-toolchains-plugin/) which decouples the JDK that is
used to execute Maven and it's plug-ins from the target JDK that is used for compilation and/or unit testing. This ensures full binary
compatibility of the compiled artifacts with the runtime library of the required target JDK.

To build the project follow these steps:

1. Download and install a Java 17 SDK, e.g. from:
   - https://adoptium.net/releases.html?variant=openjdk17
   - https://www.azul.com/downloads/?version=java-17-lts&architecture=x86-64-bit&package=jdk

1. Download and install the latest [Maven distribution](https://maven.apache.org/download.cgi).

1. In your user home directory create the file `.m2/toolchains.xml` with the following content:

   ```xml
   <?xml version="1.0" encoding="UTF8"?>
   <toolchains>
     <toolchain>
       <type>jdk</type>
       <provides>
          <version>17</version>
          <vendor>default</vendor>
       </provides>
       <configuration>
          <jdkHome>[PATH_TO_YOUR_JDK_17]</jdkHome>
       </configuration>
     </toolchain>
   </toolchains>
   ```

   Set the `[PATH_TO_YOUR_JDK_17]` parameter accordingly.

1. Checkout the code using one of the following methods:

    - `git clone https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin`
    - `svn co https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin extra-syntax-highlighting-eclipse-plugin

1. Run `mvn clean verify` in the project root directory. This will execute compilation, unit-testing, integration-testing and
   packaging of all artifacts.


## <a name="license"></a>License

If not otherwise specified (see below), files in this repository fall under the [Eclipse Public License 2.0](LICENSE.txt).

Individual files contain the following tag instead of the full license text:
```
SPDX-License-Identifier: EPL-2.0
```

This enables machine processing of license information based on the SPDX License Identifiers that are available here: https://spdx.org/licenses/.

An exception is made for:
1. files in readable text which contain their own license information, or
2. files in a directory containing a separate `LICENSE.txt` file, or
3. files where an accompanying file exists in the same directory with a `.LICENSE.txt` suffix added to the base-name of the original file.
   For example `foobar.js` is may be accompanied by a `foobar.LICENSE.txt` license file.
