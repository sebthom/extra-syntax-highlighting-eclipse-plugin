# "Extra Syntax Highlighting" plugin for Eclipse

[![Build Status](https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin/actions/workflows/build.yml/badge.svg)](https://github.com/sebthom/extra-syntax-highlighting-eclipse-plugin/actions/workflows/build.yml)
[![License](https://img.shields.io/github/license/sebthom/extra-syntax-highlighting-eclipse-plugin.svg?color=blue)](LICENSE.txt)
[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)


**Feedback and high-quality pull requests are  highly welcome!**

1. [About](#about)
1. [What is it?](#what-is-it)
1. [Installation](#installation)
1. [Supported File Formats/Languages](#supported-fileformats)
1. [Building from Sources](#building)
1. [License](#license)


## <a name="what-is-it"></a>What is it?

This [EclipseⓇ](https://eclipse.org) plug-in adds syntax highlighting support for the following languages/file formats utilizing [TM4E](https://github.com/eclipse/tm4e):
- Apache HTTP configuration files - https://httpd.apache.org/docs/current/configuring.html
- Astro - https://astro.build/
- C / C++
- C# (`*.cs`) - https://docs.microsoft.com/en-us/dotnet/csharp/
- Dart - https://dart.dev
- Eclipse External null Annotations (`*.eea`) - https://wiki.eclipse.org/JDT_Core/Null_Analysis/External_Annotations#File_format
- Entity-Relationship Diagram (`*.er`) - https://github.com/BurntSushi/erd
- GLSL (OpenGL Shading Language) - https://registry.khronos.org/OpenGL/index_gl.php#apispecs
- GraphQL - https://graphql.org/
- Graphviz Dot (`*.dot`) - https://graphviz.org/doc/info/lang.html
- HashiCorp HCL (`*.hcl`) - https://github.com/hashicorp/hcl (e.g. used by HasiCorp Packer)
- HashiCorp Sentinel (`*.sentinel`) - https://www.hashicorp.com/sentinel
- HashiCorp Terraform (`*.tf`) - https://www.terraform.io/
- Haxe - https://haxe.org
- INI Files - https://en.wikipedia.org/wiki/INI_file
- Jinja Templates - https://jinja.palletsprojects.com/
- Kotlin - https://kotlinlang.org/
- LDIF - https://en.wikipedia.org/wiki/LDAP_Data_Interchange_Format
- Lua - https://www.lua.org/
- Make - https://www.gnu.org/software/make/
- Mako Templates (`*.mako`) - https://www.makotemplates.org/
- Markdown (`*.md`) - https://daringfireball.net/projects/markdown/
- Nushell (`*.nu`) - https://github.com/nushell/nushell
- PHP - https://www.php.net/
- PlantUML (`*.pu`) - https://plantuml.com/
- PowerShell - https://github.com/PowerShell/PowerShell
- Prisma - https://www.prisma.io/
- Svelte - https://svelte.dev/
- Swift - https://developer.apple.com/swift/
- TOML - https://toml.io/en/
- Visual Basic- https://docs.microsoft.com/en-us/dotnet/visual-basic/

For the following languages/file formats you can install one of the listed Eclipse plug-ins:
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
| Apache HTTP Config <img src="plugin/syntaxes/apache-http/icon.png" width=16/> | file-extensions="conf, htaccess, htgroups, htpasswd" | [master@mrmlnc/vscode-apache](https://github.com/mrmlnc/vscode-apache/tree/0585b0bb3d390fc541aa27cfcfb83b3204156be3/)
| Astro <img src="plugin/syntaxes/astro/icon.png" width=16/> | file-extensions="astro" | [main@withastro/language-tools](https://github.com/withastro/language-tools/tree/7de75d39e7a03368bf0e1429dbbd98b9ab6d0c36/packages/vscode)
| C | file-extensions="c, i" | [main@microsoft/vscode](https://github.com/microsoft/vscode/tree/86d1a94cca007f64e442c1aa0b6af60a40c1ceea/extensions/cpp) [[upstream]](https://github.com/jeff-hykin/better-c-syntax/commit/34712a6106a4ffb0a04d2fa836fd28ff6c5849a4)
| C++ | file-extensions="c++, cc, cpp, cxx, h, h++, h.in, hh, hpp, hpp.in, hxx, ii, inl, ino, ipp, ixx, tpp, txx" | [main@microsoft/vscode](https://github.com/microsoft/vscode/tree/86d1a94cca007f64e442c1aa0b6af60a40c1ceea/extensions/cpp) [[upstream]](https://github.com/jeff-hykin/better-cpp-syntax/commit/f1d127a8af2b184db570345f0bb179503c47fdf6)
| CUDA C++ | file-extensions="cu, cuh" | [main@microsoft/vscode](https://github.com/microsoft/vscode/tree/86d1a94cca007f64e442c1aa0b6af60a40c1ceea/extensions/cpp) [[upstream]](https://github.com/NVIDIA/cuda-cpp-grammar/commit/81e88eaec5170aa8585736c63627c73e3589998c)
| C# | file-extensions="cake, cs, csx" | [main@microsoft/vscode](https://github.com/microsoft/vscode/tree/86d1a94cca007f64e442c1aa0b6af60a40c1ceea/extensions/csharp) [[upstream]](https://github.com/dotnet/csharp-tmLanguage/commit/7bf5709ac1a713e340a618d1b41f44a043e393c6)
| Dart | file-extensions="dart" | [main@microsoft/vscode](https://github.com/microsoft/vscode/tree/86d1a94cca007f64e442c1aa0b6af60a40c1ceea/extensions/dart) [[upstream]](https://github.com/dart-lang/dart-syntax-highlight/commit/0a6648177bdbb91a4e1a38c16e57ede0ccba4f18)
| GraphViz DOT File | file-extensions="dot" | [master@textmate/graphviz.tmbundle](https://github.com/textmate/graphviz.tmbundle/tree/d1d489f893a0e6ef5d9021bf7dc1ffd08b3f9b90/Syntaxes)
| Entity Relationship <img src="plugin/syntaxes/er/icon.png" width=16/> | file-extensions="er" | [master@mikkel-ol/vsc-er-syntax-highlighting](https://github.com/mikkel-ol/vsc-er-syntax-highlighting/tree/160f6061a525858e4a17df97a4e3b51d0ff9c1bd/)
| OpenGL Shading Language <img src="plugin/syntaxes/glsl/icon.png" width=16/> | file-extensions="comp, csh, frag, fs, fsh, fshader, geom, glsl, gs, gsh, gshader, mesh, rahit, rcall, rchit, rgen, rint, rmiss, task, tesc, tese, vert, vs, vsh, vshader" | [master@GeForceLegend/vscode-glsl](https://github.com/GeForceLegend/vscode-glsl/tree/717034785b6128d7a8ca85f507bddf33eba4c3e7/)
| GraphQL <img src="plugin/syntaxes/graphql/icon.png" width=16/> | file-extensions="gql, graphql, graphqls" | [main@graphql/graphiql](https://github.com/graphql/graphiql/tree/a80801970e095e493eb0fda7687766f103bf701e/packages/vscode-graphql-syntax)
| Haxe Source File | file-extensions="hx" | [master@vshaxe/haxe-TmLanguage](https://github.com/vshaxe/haxe-TmLanguage/tree/b3cb0d3a6835938603d006fce402205fa16c11dd/)
| HCL Config File | file-extensions="hcl" | [main@hashicorp/syntax](https://github.com/hashicorp/syntax/tree/c98e6521755f840c5171f43682518465b691f392/)
| HashiCorp Sentinel | file-extensions="sentinel" | [main@hashicorp/syntax](https://github.com/hashicorp/syntax/tree/c98e6521755f840c5171f43682518465b691f392/)
| HashiCorp Terraform | file-extensions="tf, tfvars" | [main@hashicorp/syntax](https://github.com/hashicorp/syntax/tree/c98e6521755f840c5171f43682518465b691f392/)
| INI Config File | file-extensions="ini" | [main@microsoft/vscode](https://github.com/microsoft/vscode/tree/86d1a94cca007f64e442c1aa0b6af60a40c1ceea/extensions/ini) [[upstream]](https://github.com/textmate/ini.tmbundle/commit/2af0cbb0704940f967152616f2f1ff0aae6287a6)
| Jinja Cisco Config <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="cisco.j2, cisco.jinja, cisco.jinja2, ios.j2, ios.jinja, ios.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja C++ <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="c.j2, c.jinja, c.jinja2, cpp.j2, cpp.jinja, cpp.jinja2, h.j2, h.jinja, h.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja CSS <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="css.j2, css.jinja, css.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Cython <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="pxd.j2, pxd.jinja, pxd.jinja2, pxi.j2, pxi.jinja, pxi.jinja2, pyx.j2, pyx.jinja, pyx.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Dockerfile <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="dockerfile.j2, dockerfile.jinja, dockerfile.jinja2"<br />file-names="Dockerfile.j2, Dockerfile.jinja, Dockerfile.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Groovy <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="groovy.j2, groovy.jinja, groovy.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja HTML <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="html.j2, j2, jinja, jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Java <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="java.j2, java.jinja, java.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja JavaScript <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="js.j2, js.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja JSON <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="code-workspace.j2, code-workspace.jinja, code-workspace.jinja2, json.j2, json.jinja, json.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja LaTeX <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="latex.j2, latex.jinja2, tex.j2, tex.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Lua <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="lua.j2, lua.jinja, lua.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Markdown <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="md.j2, md.jinja, md.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Nginx <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="conf.j2, conf.jinja, conf.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja PHP <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="php.j2, php.jinja, php.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Properties/ini/Conf <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="cfg.j2, conf.j2, desktop.j2, directory.j2, ini.j2, properties.j2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Python <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="py.j2, py.jinja, py.jinja2, pyi.j2, pyi.jinja, pyi.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Ruby <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="rb.j2, rb.jinja2, rbw.j2, rbw.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Rust <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="rs.j2, rs.jinja, rs.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Shell Script <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="bash.j2, bash_aliases.j2, bash_login.j2, bash_logout.j2, bash_profile.j2, bashrc.j2, ebuild.j2, env.j2, env.jinja, env.jinja2, install.j2, ksh.j2, profile.j2, sh.j2, zlogin.j2, zlogout.j2, zprofile.j2, zsh-theme.j2, zsh.j2, zshenv.j2, zshrc.j2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja SQL <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="sql.j2, sql.jinja, sql.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Systemd Unit File <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="automount.j2, automount.jinja, automount.jinja2, device.j2, device.jinja, device.jinja2, link.j2, link.jinja, link.jinja2, mount.j2, mount.jinja, mount.jinja2, netdev.j2, netdev.jinja, netdev.jinja2, network.j2, network.jinja, network.jinja2, path.j2, path.jinja, path.jinja2, scope.j2, scope.jinja, scope.jinja2, service.j2, service.jinja, service.jinja2, slice.j2, slice.jinja, slice.jinja2, snapshot.j2, snapshot.jinja, snapshot.jinja2, socket.j2, socket.jinja, socket.jinja2, swap.j2, swap.jinja, swap.jinja2, target.j2, target.jinja, target.jinja2, timer.j2, timer.jinja, timer.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja Terraform <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="hcl.j2, hcl.jinja, hcl.jinja2, tf.j2, tf.jinja, tf.jinja2, tfvars.j2, tfvars.jinja, tfvars.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja TOML <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="toml.j2, toml.jinja, toml.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja XML <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="xml.j2, xml.jinja, xml.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Jinja YAML <img src="plugin/syntaxes/jinja/icon.png" width=16/> | file-extensions="sls, yaml.j2, yaml.jinja, yaml.jinja2, yml.j2, yml.jinja, yml.jinja2" | [main@samuelcolvin/jinjahtml-vscode](https://github.com/samuelcolvin/jinjahtml-vscode/tree/28e422433581d92f72252f1af1f67eeaab07c812/)
| Kotlin <img src="plugin/syntaxes/kotlin/icon.png" width=16/> | file-extensions="kt, kts" | [main@fwcd/vscode-kotlin](https://github.com/fwcd/vscode-kotlin/tree/c1371a435aedf8690d3c9cbbe4c42a215915630d/)
| LDIF File | file-extensions="ldif" | [master@FlashSystems/LDIF-Syntax](https://github.com/FlashSystems/LDIF-Syntax/tree/f00c21eb1cc5fe5966cf6ef158e854a65449a9fa/)
| Lua | file-extensions="lua, rockspec" | [main@microsoft/vscode](https://github.com/microsoft/vscode/tree/86d1a94cca007f64e442c1aa0b6af60a40c1ceea/extensions/lua) [[upstream]](https://github.com/sumneko/lua.tmbundle/commit/94ce82cc4d45f82641a5252d7a7fd9e28c875adc)
| Makefile | file-extensions="mak, mk"<br />file-names="GNUmakefile, Makefile, OCamlMakefile, makefile"<br />file-patterns="*Makefile" | [main@microsoft/vscode](https://github.com/microsoft/vscode/tree/86d1a94cca007f64e442c1aa0b6af60a40c1ceea/extensions/make) [[upstream]](https://github.com/fadeevab/make.tmbundle/commit/1d4c0b541959995db098df751ffc129da39a294b)
| Mako Template | file-extensions="mako" | [master@marconi/mako-tmbundle](https://github.com/marconi/mako-tmbundle/tree/45037e4e98f0c215b55b194d303811d43b85407c/Syntaxes)
| Markdown | file-extensions="livemd, markdown, md, mdown, mdwn, mkd, mkdn, mkdown, ronn, scd, workbook" | [main@wooorm/markdown-tm-language](https://github.com/wooorm/markdown-tm-language/tree/11eeefed6b5b13f0bfda019972ab96405a10a8fd/)
| nushell <img src="plugin/syntaxes/nushell/nushell.png" width=16/> | file-extensions="nu" | [main@nushell/vscode-nushell-lang](https://github.com/nushell/vscode-nushell-lang/tree/25e39a9b01e12aff0fac319fce05ba1d1a60edcc/)
| PHP | file-extensions="ctp, php, php4, php5, phtml" | [main@microsoft/vscode](https://github.com/microsoft/vscode/tree/86d1a94cca007f64e442c1aa0b6af60a40c1ceea/extensions/php) [[upstream]](https://github.com/KapitanOczywisty/language-php/commit/ff64523c94c014d68f5dec189b05557649c5872a)
| PlantUML <img src="plugin/syntaxes/plantuml/icon.png" width=16/> | file-extensions="iuml, plantuml, pu, puml, wsd" | [master@qjebbs/vscode-plantuml](https://github.com/qjebbs/vscode-plantuml/tree/107e4fa397a6f06c8debad3be41b4c6117e49c6b/)
| PowerShell | file-extensions="ps1, psd1, psm1, psrc, pssc" | [main@microsoft/vscode](https://github.com/microsoft/vscode/tree/86d1a94cca007f64e442c1aa0b6af60a40c1ceea/extensions/powershell) [[upstream]](https://github.com/PowerShell/EditorSyntax/commit/742f0b5d4b60f5930c0b47fcc1f646860521296e)
| Prisma <img src="plugin/syntaxes/prisma/prisma.png" width=16/> | file-extensions="prisma" | [main@prisma/language-tools](https://github.com/prisma/language-tools/tree/6d1684c2b78b7d03d102d08767466c21f70ef1f0/packages/vscode)
| Svelte <img src="plugin/syntaxes/svelte/icon.png" width=16/> | file-extensions="svelte" | [master@sveltejs/language-tools](https://github.com/sveltejs/language-tools/tree/bc820642a151975f19090cfc5f0c2bd0cd928f1a/packages/svelte-vscode)
| Swift | file-extensions="swift" | [main@microsoft/vscode](https://github.com/microsoft/vscode/tree/86d1a94cca007f64e442c1aa0b6af60a40c1ceea/extensions/swift) [[upstream]](https://github.com/jtbandes/swift-tmlanguage/commit/ab893c684dd7eeb7c249139e29e931334316fda7)
| TOML Config File <img src="plugin/syntaxes/toml/icon.png" width=16/> | file-extensions="toml"<br />file-names="Cargo.lock" | [master@tamasfe/taplo](https://github.com/tamasfe/taplo/tree/079d7a91fea64ff9da7abfda5f0ca7bbf9dfb1c0/editors/vscode)
| Visual Basic | file-extensions="bas, brs, vb, vba, vbs" | [main@microsoft/vscode](https://github.com/microsoft/vscode/tree/86d1a94cca007f64e442c1aa0b6af60a40c1ceea/extensions/vb) [[upstream]](https://github.com/textmate/asp.vb.net.tmbundle/commit/72d44550b3286d0382d7be0624140cf97857ff69)

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
