# "Extra Syntax Highlighting" plugin for Eclipse

[![Build Status](https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin/actions/workflows/build.yml/badge.svg)](https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin/actions/workflows/build.yml)
[![License](https://img.shields.io/github/license/sebthom/extra-syntax-highlighting-eclipse-plugin.svg?color=blue)](LICENSE.txt)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)
[![Eclipse Marketplace](https://img.shields.io/eclipse-marketplace/dt/extra-syntax-highlighting-plugin?logo=eclipse&label=Downloads)](https://marketplace.eclipse.org/content/extra-syntax-highlighting-plugin)


**Feedback and high-quality pull requests are  highly welcome!**

1. [What is it?](#what-is-it)
1. [Installation](#installation)
1. [Supported File Formats/Languages](#supported-fileformats)
1. [Building from Sources](#building)
1. [License](#license)


## <a name="what-is-it"></a>What is it?

This [EclipseⓇ](https://eclipse.org) plug-in adds syntax highlighting support for the following languages/file formats utilizing [TM4E](https://github.com/eclipse/tm4e):
1. ANTRL4 - https://www.antlr.org/
1. Apache HTTP configuration files - https://httpd.apache.org/docs/current/configuring.html
1. Astro - https://astro.build/
1. Ballerina - https://ballerina.io/
1. Bazel - https://bazel.build/
1. BF - https://en.wikipedia.org/wiki/Brainfuck
1. Carbon - https://carbon-lang.dev
1. COBOL - https://en.wikipedia.org/wiki/COBOL
1. Crystal (`*.cr`) - https://crystal-lang.org/
1. Eclipse External null Annotations (`*.eea`) - https://wiki.eclipse.org/JDT_Core/Null_Analysis/External_Annotations#File_format
1. EditorConfig - https://editorconfig.org
1. Elm - https://elm-lang.org/
1. Entity-Relationship Diagram (`*.er`) - https://github.com/BurntSushi/erd
1. Erlang (`*.erl`) - https://www.erlang.org/
1. Fish (`*.fish`) - https://fishshell.com/docs/current/language.html
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
1. Kotlin - https://kotlinlang.org/
1. LDIF - https://en.wikipedia.org/wiki/LDAP_Data_Interchange_Format
1. Mako Templates (`*.mako`) - https://www.makotemplates.org/
1. Markdown (`*.md`) - https://daringfireball.net/projects/markdown/
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
| ANTLR <img src="plugin/syntaxes/antlr4/icon.png" width=16/> | file-extensions="g, g4" | [master@mike-lischke/vscode-antlr4](https://github.com/mike-lischke/vscode-antlr4/tree/c12fea624fed4ce6998e67d62537d88135a598a7/)
| Apache HTTP Config <img src="plugin/syntaxes/apache-http/icon.png" width=16/> | file-extensions="conf, htaccess, htgroups, htpasswd" | [master@mrmlnc/vscode-apache](https://github.com/mrmlnc/vscode-apache/tree/0585b0bb3d390fc541aa27cfcfb83b3204156be3/)
| Astro <img src="plugin/syntaxes/astro/icon.png" width=16/> | file-extensions="astro" | [main@withastro/language-tools](https://github.com/withastro/language-tools/tree/df90fe5f79978b567387cc1b0cedcc23a43bd156/packages/vscode)
| Ballerina | file-extensions="bal" | [master@ballerina-platform/ballerina-grammar](https://github.com/ballerina-platform/ballerina-grammar/tree/d9c8924600c45ad04e6d966cb0916373f00146d6/syntaxes)
| bazelrc <img src="plugin/syntaxes/bazel/icon.png" width=16/> | file-extensions="bazelrc"<br />file-names=".bazelrc, bazel.rc" | [master@bazelbuild/vscode-bazel](https://github.com/bazelbuild/vscode-bazel/tree/0bb1fe3da76fb522ffa130db374ecbbafd154a07/)
| Branflakes <img src="plugin/syntaxes/bf/icon.png" width=16/> | file-extensions="bf, bfsck, brainfuck" | [main@chrisvrose/bf-server](https://github.com/chrisvrose/bf-server/tree/e8ce9b73ae31ada02a4127891b4ba1c0bad8ee50/)
| Carbon | file-extensions="carbon" | [trunk@carbon-language/carbon-lang](https://github.com/carbon-language/carbon-lang/tree/5e293ad97f9779e8ff82cee143e6a6c40daef703/utils)
| COBOL <img src="plugin/syntaxes/cobol/icon.png" width=16/> | file-extensions="cbl, cob, cobol, copy, cpy"<br />file-patterns="\*\*/broadcommfd.cobol-language-support/\*/copybooks/\*\*" | [development@eclipse-che4z/che-che4z-lsp-for-cobol](https://github.com/eclipse-che4z/che-che4z-lsp-for-cobol/tree/09904583f977e076cd5c1e04c8a5a7dcfbfb2ee1/clients/cobol-lsp-vscode-extension)
| Crystal <img src="plugin/syntaxes/crystal/icon.png" width=16/> | file-extensions="cr" | [master@crystal-lang-tools/vscode-crystal-lang](https://github.com/crystal-lang-tools/vscode-crystal-lang/tree/aad5ae5077e9a326ef5c58c011311f48d0e76629/) [[upstream]](https://github.com/Microsoft/vscode/blob/3f1f36333d3453f67a36b6bfb1206e9159e9c4f0/extensions/ruby/syntaxes/ruby.tmLanguage.json)
| Crystal Slang <img src="plugin/syntaxes/crystal/icon.png" width=16/> | file-extensions="slang" | [master@crystal-lang-tools/vscode-crystal-lang](https://github.com/crystal-lang-tools/vscode-crystal-lang/tree/aad5ae5077e9a326ef5c58c011311f48d0e76629/)
| EditorConfig <img src="plugin/syntaxes/editorconfig/icon.png" width=16/> | file-extensions="editorconfig" | [main@editorconfig/editorconfig-vscode](https://github.com/editorconfig/editorconfig-vscode/tree/b86ebd4e9062c76e7145bcefc1a17cf2e6cc1acc/)
| Elm <img src="plugin/syntaxes/elm/icon.png" width=16/> | file-extensions="elm" | [main@elm-tooling/elm-language-client-vscode](https://github.com/elm-tooling/elm-language-client-vscode/tree/a32f6a908c113ea4710d18b612a7ecd70f0a2c8b/)
| Embedded Crystal <img src="plugin/syntaxes/crystal/icon.png" width=16/> | file-extensions="ecr" | [master@crystal-lang-tools/vscode-crystal-lang](https://github.com/crystal-lang-tools/vscode-crystal-lang/tree/aad5ae5077e9a326ef5c58c011311f48d0e76629/)
| Entity Relationship <img src="plugin/syntaxes/er/icon.png" width=16/> | file-extensions="er" | [master@mikkel-ol/vsc-er-syntax-highlighting](https://github.com/mikkel-ol/vsc-er-syntax-highlighting/tree/160f6061a525858e4a17df97a4e3b51d0ff9c1bd/)
| Erlang <img src="plugin/syntaxes/erlang/icon.png" width=16/> | file-extensions="config, erl, escript, hrl, src" | [main@erlang-ls/vscode](https://github.com/erlang-ls/vscode/tree/1e5bc08853523c6dcd563fa7de8af597710eaa8f/)
| Fish <img src="plugin/syntaxes/fish/icon.png" width=16/> | file-extensions="fish" | [master@bmalehorn/vscode-fish](https://github.com/bmalehorn/vscode-fish/tree/2bdcfbea62cadc2a977eace3189d25b31df71e72/)
| Fortran <img src="plugin/syntaxes/fortran/FortranFreeForm.png" width=16/> | file-extensions="F03, F08, F18, F90, F95, FPP, FYPP, PF, f03, f08, f18, f90, f95, fpp, fypp, pf" | [main@fortran-lang/vscode-fortran-support](https://github.com/fortran-lang/vscode-fortran-support/tree/82bac3ea3181be27af5124edd92b75ed43471f53/)
| Fortran77 <img src="plugin/syntaxes/fortran/FortranFixedForm.png" width=16/> | file-extensions="F, F77, FOR, f, f77, for" | [main@fortran-lang/vscode-fortran-support](https://github.com/fortran-lang/vscode-fortran-support/tree/82bac3ea3181be27af5124edd92b75ed43471f53/)
| Gleam <img src="plugin/syntaxes/gleam/gleam.png" width=16/> | file-extensions="gleam" | [main@gleam-lang/vscode-gleam](https://github.com/gleam-lang/vscode-gleam/tree/6ed1e8a5acb5c4dbe2d44fe7d01d835ddc09cc9e/)
| GraphQL <img src="plugin/syntaxes/graphql/icon.png" width=16/> | file-extensions="gql, graphql, graphqls" | [main@graphql/graphiql](https://github.com/graphql/graphiql/tree/cd5f72390578dd37e72c2b40f1c498efa61277ba/packages/vscode-graphql-syntax)
| GraphViz DOT File | file-extensions="dot" | [master@textmate/graphviz.tmbundle](https://github.com/textmate/graphviz.tmbundle/tree/d1d489f893a0e6ef5d9021bf7dc1ffd08b3f9b90/Syntaxes)
| HashiCorp Sentinel | file-extensions="sentinel" | [main@hashicorp/syntax](https://github.com/hashicorp/syntax/tree/45e5a027561433b79663416bcf29fc7e2171bf6e/)
| HashiCorp Terraform | file-extensions="tf, tfvars" | [main@hashicorp/syntax](https://github.com/hashicorp/syntax/tree/45e5a027561433b79663416bcf29fc7e2171bf6e/)
| Haxe | file-extensions="hx" | [master@vshaxe/haxe-TmLanguage](https://github.com/vshaxe/haxe-TmLanguage/tree/ddad8b4c6d0781ac20be0481174ec1be772c5da5/)
| HCL Config File | file-extensions="hcl" | [main@hashicorp/syntax](https://github.com/hashicorp/syntax/tree/45e5a027561433b79663416bcf29fc7e2171bf6e/)
| helm-template <img src="plugin/syntaxes/helm/icon.png" width=16/> | file-patterns="\*\*/templates/\*\*/\*.tpl, \*\*/templates/\*\*/\*.yaml, \*\*/templates/\*\*/\*.yml, \*\*/templates/\*.tpl, \*\*/templates/\*.yaml, \*\*/templates/\*.yml" | [master@vscode-kubernetes-tools/vscode-kubernetes-tools](https://github.com/vscode-kubernetes-tools/vscode-kubernetes-tools/tree/621261065641e42798a78ed0b3bd8413f46e37b1/)
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
| Jsonnet <img src="plugin/syntaxes/jsonnet/icon.png" width=16/> | file-extensions="jsonnet, libsonnet" | [main@grafana/vscode-jsonnet](https://github.com/grafana/vscode-jsonnet/tree/235f9f8e736874187a66f3219e9129059557ebcd/)
| Kotlin <img src="plugin/syntaxes/kotlin/icon.png" width=16/> | file-extensions="kt, kts" | [main@fwcd/vscode-kotlin](https://github.com/fwcd/vscode-kotlin/tree/a2b912de4fa9139eacd976bc0b22907105b83e4a/)
| LDIF File | file-extensions="ldif" | [master@FlashSystems/LDIF-Syntax](https://github.com/FlashSystems/LDIF-Syntax/tree/f00c21eb1cc5fe5966cf6ef158e854a65449a9fa/)
| Mako Template | file-extensions="mako" | [master@marconi/mako-tmbundle](https://github.com/marconi/mako-tmbundle/tree/45037e4e98f0c215b55b194d303811d43b85407c/Syntaxes)
| Markdown | file-extensions="livemd, markdown, md, mdown, mdwn, mkd, mkdn, mkdown, ronn, scd, workbook" | [main@wooorm/markdown-tm-language](https://github.com/wooorm/markdown-tm-language/tree/c78b1e5df644d24fa76716bbe26f4b48a6fc1610/)
| mermaid <img src="plugin/syntaxes/mermaid/icon.png" width=16/> | file-extensions="mermaid, mmd" | [master@bpruitt-goddard/vscode-mermaid-syntax-highlight](https://github.com/bpruitt-goddard/vscode-mermaid-syntax-highlight/tree/dff0421fb9e5d07d752f71181e7a154bd103994d/)
| NGINX Conf <img src="plugin/syntaxes/nginx/icon.png" width=16/> | file-extensions="conf, conf.default, conf.template, fastcgi_params, mime.types, nginx, nginx.conf, scgi_params, uwsgi_params" | [main@ahmadalli/vscode-nginx-conf](https://github.com/ahmadalli/vscode-nginx-conf/tree/10414d948cc5e52fbf2a8207629427d4ae3bc8c4/)
| Nunjucks HTML <img src="plugin/syntaxes/nunjucks/icon.png" width=16/> | file-extensions="njk, njk.html" | [main@edheltzel/better-nunjucks-for-visual-studio-code](https://github.com/edheltzel/better-nunjucks-for-visual-studio-code/tree/332160a51a5ce4742619aa9c39331de418eac9b7/)
| nushell <img src="plugin/syntaxes/nushell/nushell.png" width=16/> | file-extensions="nu" | [main@nushell/vscode-nushell-lang](https://github.com/nushell/vscode-nushell-lang/tree/63fcfaf32fe18db9f8bc75805117c2af3a896806/)
| OCaml <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="eliom, ml, ocamlinit" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/6df8e68d8c420e2f36ed5f693732841409652afa/)
| OCaml Interface <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="eliomi, mli" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/6df8e68d8c420e2f36ed5f693732841409652afa/)
| OCamlFormat <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="ocamlformat" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/6df8e68d8c420e2f36ed5f693732841409652afa/)
| odin <img src="plugin/syntaxes/odin/odin.png" width=16/> | file-extensions="odin" | [master@DanielGavin/ols](https://github.com/DanielGavin/ols/tree/212e52c273a1004ff2081f51f54b92058e47d62c/editors/vscode)
| opam <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="opam, opam.locked, opam.template"<br />file-names="opam" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/6df8e68d8c420e2f36ed5f693732841409652afa/)
| OpenGL Shading Language <img src="plugin/syntaxes/glsl/icon.png" width=16/> | file-extensions="comp, csh, frag, fs, fsh, fshader, geom, glsl, gs, gsh, gshader, mesh, rahit, rcall, rchit, rgen, rint, rmiss, task, tesc, tese, vert, vs, vsh, vshader" | [master@GeForceLegend/vscode-glsl](https://github.com/GeForceLegend/vscode-glsl/tree/fb5e3efcd55ae0ec98eb6eac0ceacb2e563ae6cd/)
| Pascal | file-extensions="dfm, dpk, dpr, fmx, lfm, lpr, p, pas" | [master@textmate/pascal.tmbundle](https://github.com/textmate/pascal.tmbundle/tree/3b11b782368065e55acce0423f385722771d28b0/Syntaxes)
| PlantUML <img src="plugin/syntaxes/plantuml/icon.png" width=16/> | file-extensions="iuml, plantuml, pu, puml, wsd" | [master@qjebbs/vscode-plantuml](https://github.com/qjebbs/vscode-plantuml/tree/7bc1758ed73dc269f5721d78c6c6c01f461d7cb0/)
| Pony | file-extensions="pony" | [main@chalcolith/eohippus](https://github.com/chalcolith/eohippus/tree/6bc8fc51dc2ff7be7f4b792c55155d59e38fc983/eohippus-vscode)
| Prisma <img src="plugin/syntaxes/prisma/prisma.png" width=16/> | file-extensions="prisma" | [main@prisma/language-tools](https://github.com/prisma/language-tools/tree/a38f4f1a50a8287c44cc3309ab2937f5243a316c/packages/vscode)
| Reason <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="re, rei" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/6df8e68d8c420e2f36ed5f693732841409652afa/)
| Ring <img src="plugin/syntaxes/ring/ring.png" width=16/> | file-extensions="rform, rh, ring" | [master@ring-lang/ring](https://github.com/ring-lang/ring/tree/bc6b9f173f8aac00abe4f54e8e9fb3ab6e574cd9/tools/editors/vscode/extension)
| Roc <img src="plugin/syntaxes/roc/roc.png" width=16/> | file-extensions="roc" | [main@ivan-demchenko/roc-vscode-unofficial](https://github.com/ivan-demchenko/roc-vscode-unofficial/tree/5580b983f3a1fc5d56f40a4bafd94b80dbcf93cb/)
| Starlark <img src="plugin/syntaxes/bazel/icon.png" width=16/> | file-extensions="BUILD, WORKSPACE, bazel, bzl, bzlmod, sky, star"<br />file-names="BUILD, WORKSPACE" | [master@bazelbuild/vscode-bazel](https://github.com/bazelbuild/vscode-bazel/tree/0bb1fe3da76fb522ffa130db374ecbbafd154a07/)
| Svelte <img src="plugin/syntaxes/svelte/icon.png" width=16/> | file-extensions="svelte" | [master@sveltejs/language-tools](https://github.com/sveltejs/language-tools/tree/77160ff7956744311ce3fc8c65b99eb7ae9e0dc7/packages/svelte-vscode)
| TOML Config File <img src="plugin/syntaxes/toml/icon.png" width=16/> | file-extensions="toml"<br />file-names="Cargo.lock, Pipfile, pdm.lock" | [master@juggernautjp/less-toml](https://github.com/juggernautjp/less-toml/tree/13eb891232e98c4a9c595bf8c657893c84edf3a9/) [[upstream]](https://github.com/textmate/toml.tmbundle/commit/e82b64c1e86396220786846201e9aa3f0a2d9ca2)
| Wing <img src="plugin/syntaxes/wing/wing.png" width=16/> | file-extensions="w, wsim" | [main@winglang/wing](https://github.com/winglang/wing/tree/c8aea628c1be9f753356f450ea189025c6a55797/packages/vscode-wing)
| Zig <img src="plugin/syntaxes/zig/icon.png" width=16/> | file-extensions="zig, zon" | [master@ziglang/vscode-zig](https://github.com/ziglang/vscode-zig/tree/133b167f83562dbafe7927707a200353d3c00996/)

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
