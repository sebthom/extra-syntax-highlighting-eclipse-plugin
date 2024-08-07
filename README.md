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
- Apache HTTP configuration files - https://httpd.apache.org/docs/current/configuring.html
- Astro - https://astro.build/
- Bazel - https://bazel.build/
- Eclipse External null Annotations (`*.eea`) - https://wiki.eclipse.org/JDT_Core/Null_Analysis/External_Annotations#File_format
- Entity-Relationship Diagram (`*.er`) - https://github.com/BurntSushi/erd
- GLSL (OpenGL Shading Language) - https://registry.khronos.org/OpenGL/index_gl.php#apispecs
- GraphQL - https://graphql.org/
- Graphviz Dot (`*.dot`) - https://graphviz.org/doc/info/lang.html
- HashiCorp HCL (`*.hcl`) - https://github.com/hashicorp/hcl (e.g. used by HasiCorp Packer)
- HashiCorp Sentinel (`*.sentinel`) - https://www.hashicorp.com/sentinel
- HashiCorp Terraform (`*.tf`) - https://www.terraform.io/
- Haxe - https://haxe.org
- Helm (`*.tpl`) - https://helm.sh/
- Jinja Templates - https://jinja.palletsprojects.com/
- JSON5 (`*.json5`) - https://json5.org/
- Kotlin - https://kotlinlang.org/
- LDIF - https://en.wikipedia.org/wiki/LDAP_Data_Interchange_Format
- Mako Templates (`*.mako`) - https://www.makotemplates.org/
- Markdown (`*.md`) - https://daringfireball.net/projects/markdown/
- Mermaid (`*.mmd, *.mermaid`) - https://github.com/mermaid-js/mermaid/
- NginX (`nginx.conf`) - https://www.nginx.com/
- Nushell (`*.nu`) - https://github.com/nushell/nushell
- OCaml (`*.ml`) - https://ocaml.org/
- PlantUML (`*.pu`) - https://plantuml.com/
- Pascal (`*.pas`) - https://en.wikipedia.org/wiki/Pascal_(programming_language)
- Prisma - https://www.prisma.io/
- Reason (`*.re`) - https://reasonml.github.io/
- Svelte - https://svelte.dev/
- TOML - https://toml.io/en/
- Zig - https://ziglang.org/

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
| Apache HTTP Config <img src="plugin/syntaxes/apache-http/icon.png" width=16/> | file-extensions="conf, htaccess, htgroups, htpasswd" | [master@mrmlnc/vscode-apache](https://github.com/mrmlnc/vscode-apache/tree/0585b0bb3d390fc541aa27cfcfb83b3204156be3/)
| Astro <img src="plugin/syntaxes/astro/icon.png" width=16/> | file-extensions="astro" | [main@withastro/language-tools](https://github.com/withastro/language-tools/tree/f2de94820052ef6697c0dbabbf007dd24e1d1319/packages/vscode)
| bazelrc <img src="plugin/syntaxes/bazel/icon.png" width=16/> | file-extensions="bazelrc"<br />file-names=".bazelrc, bazel.rc" | [master@bazelbuild/vscode-bazel](https://github.com/bazelbuild/vscode-bazel/tree/4f02dc5a86d5293800b44b67000b14cbd4edce38/)
| Entity Relationship <img src="plugin/syntaxes/er/icon.png" width=16/> | file-extensions="er" | [master@mikkel-ol/vsc-er-syntax-highlighting](https://github.com/mikkel-ol/vsc-er-syntax-highlighting/tree/160f6061a525858e4a17df97a4e3b51d0ff9c1bd/)
| GraphQL <img src="plugin/syntaxes/graphql/icon.png" width=16/> | file-extensions="gql, graphql, graphqls" | [main@graphql/graphiql](https://github.com/graphql/graphiql/tree/32ea9f1a3bf801c0bcccabd5567e28b8c150fdd2/packages/vscode-graphql-syntax)
| GraphViz DOT File | file-extensions="dot" | [master@textmate/graphviz.tmbundle](https://github.com/textmate/graphviz.tmbundle/tree/d1d489f893a0e6ef5d9021bf7dc1ffd08b3f9b90/Syntaxes)
| HashiCorp Sentinel | file-extensions="sentinel" | [main@hashicorp/syntax](https://github.com/hashicorp/syntax/tree/ab30f27a046eb0fbb7274513916fb21d98189835/)
| HashiCorp Terraform | file-extensions="tf, tfvars" | [main@hashicorp/syntax](https://github.com/hashicorp/syntax/tree/ab30f27a046eb0fbb7274513916fb21d98189835/)
| Haxe | file-extensions="hx" | [master@vshaxe/haxe-TmLanguage](https://github.com/vshaxe/haxe-TmLanguage/tree/ddad8b4c6d0781ac20be0481174ec1be772c5da5/)
| HCL Config File | file-extensions="hcl" | [main@hashicorp/syntax](https://github.com/hashicorp/syntax/tree/ab30f27a046eb0fbb7274513916fb21d98189835/)
| helm-template <img src="plugin/syntaxes/helm/icon.png" width=16/> | file-patterns="\*\*/templates/\*\*/\*.tpl, \*\*/templates/\*\*/\*.yaml, \*\*/templates/\*\*/\*.yml, \*\*/templates/\*.tpl, \*\*/templates/\*.yaml, \*\*/templates/\*.yml" | [master@vscode-kubernetes-tools/vscode-kubernetes-tools](https://github.com/vscode-kubernetes-tools/vscode-kubernetes-tools/tree/6bfa905f5906e1ccf4a33ffdb84a0e2a0f943465/)
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
| Kotlin <img src="plugin/syntaxes/kotlin/icon.png" width=16/> | file-extensions="kt, kts" | [main@fwcd/vscode-kotlin](https://github.com/fwcd/vscode-kotlin/tree/531f35e458ac74b84c1ca7b0c3a790cf1c5d9e5b/)
| LDIF File | file-extensions="ldif" | [master@FlashSystems/LDIF-Syntax](https://github.com/FlashSystems/LDIF-Syntax/tree/f00c21eb1cc5fe5966cf6ef158e854a65449a9fa/)
| Mako Template | file-extensions="mako" | [master@marconi/mako-tmbundle](https://github.com/marconi/mako-tmbundle/tree/45037e4e98f0c215b55b194d303811d43b85407c/Syntaxes)
| Markdown | file-extensions="livemd, markdown, md, mdown, mdwn, mkd, mkdn, mkdown, ronn, scd, workbook" | [main@wooorm/markdown-tm-language](https://github.com/wooorm/markdown-tm-language/tree/3f11836d11ca5ed41431ecd53dca7710c2c823ce/)
| mermaid <img src="plugin/syntaxes/mermaid/icon.png" width=16/> | file-extensions="mermaid, mmd" | [master@bpruitt-goddard/vscode-mermaid-syntax-highlight](https://github.com/bpruitt-goddard/vscode-mermaid-syntax-highlight/tree/a45668c7967c52f436a5e268e681c46b9dc9b85a/)
| NGINX Conf <img src="plugin/syntaxes/nginx/icon.png" width=16/> | file-extensions="conf, conf.default, conf.template, fastcgi_params, mime.types, nginx, nginx.conf, scgi_params, uwsgi_params" | [main@ahmadalli/vscode-nginx-conf](https://github.com/ahmadalli/vscode-nginx-conf/tree/10414d948cc5e52fbf2a8207629427d4ae3bc8c4/)
| nushell <img src="plugin/syntaxes/nushell/nushell.png" width=16/> | file-extensions="nu" | [main@nushell/vscode-nushell-lang](https://github.com/nushell/vscode-nushell-lang/tree/c854eb1403a4a4ef9788a57fe042bec0a397c02d/)
| OCaml <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="eliom, ml, ocamlinit" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/9d72206db17bda50696606dc56ae3eef0260f9dd/)
| OCaml Interface <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="eliomi, mli" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/9d72206db17bda50696606dc56ae3eef0260f9dd/)
| OCamlFormat <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="ocamlformat" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/9d72206db17bda50696606dc56ae3eef0260f9dd/)
| opam <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="opam, opam.locked, opam.template"<br />file-names="opam" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/9d72206db17bda50696606dc56ae3eef0260f9dd/)
| OpenGL Shading Language <img src="plugin/syntaxes/glsl/icon.png" width=16/> | file-extensions="comp, csh, frag, fs, fsh, fshader, geom, glsl, gs, gsh, gshader, mesh, rahit, rcall, rchit, rgen, rint, rmiss, task, tesc, tese, vert, vs, vsh, vshader" | [master@GeForceLegend/vscode-glsl](https://github.com/GeForceLegend/vscode-glsl/tree/717034785b6128d7a8ca85f507bddf33eba4c3e7/)
| Pascal | file-extensions="dfm, dpk, dpr, fmx, lfm, lpr, p, pas" | [master@textmate/pascal.tmbundle](https://github.com/textmate/pascal.tmbundle/tree/3b11b782368065e55acce0423f385722771d28b0/Syntaxes)
| PlantUML <img src="plugin/syntaxes/plantuml/icon.png" width=16/> | file-extensions="iuml, plantuml, pu, puml, wsd" | [master@qjebbs/vscode-plantuml](https://github.com/qjebbs/vscode-plantuml/tree/7bc1758ed73dc269f5721d78c6c6c01f461d7cb0/)
| Prisma <img src="plugin/syntaxes/prisma/prisma.png" width=16/> | file-extensions="prisma" | [main@prisma/language-tools](https://github.com/prisma/language-tools/tree/e8ba48edb71c5567ccd32ec666f130161780e201/packages/vscode)
| Reason <img src="plugin/syntaxes/ocaml/icon.png" width=16/> | file-extensions="re, rei" | [master@ocamllabs/vscode-ocaml-platform](https://github.com/ocamllabs/vscode-ocaml-platform/tree/9d72206db17bda50696606dc56ae3eef0260f9dd/)
| Starlark <img src="plugin/syntaxes/bazel/icon.png" width=16/> | file-extensions="BUILD, WORKSPACE, bazel, bzl, bzlmod, sky, star"<br />file-names="BUILD, WORKSPACE" | [master@bazelbuild/vscode-bazel](https://github.com/bazelbuild/vscode-bazel/tree/4f02dc5a86d5293800b44b67000b14cbd4edce38/)
| Svelte <img src="plugin/syntaxes/svelte/icon.png" width=16/> | file-extensions="svelte" | [master@sveltejs/language-tools](https://github.com/sveltejs/language-tools/tree/027ab23e3e59939ad1f018a34ca5e0386cbaf829/packages/svelte-vscode)
| TOML Config File <img src="plugin/syntaxes/toml/icon.png" width=16/> | file-extensions="toml"<br />file-names="Cargo.lock, Pipfile, pdm.lock" | [master@juggernautjp/less-toml](https://github.com/juggernautjp/less-toml/tree/13eb891232e98c4a9c595bf8c657893c84edf3a9/) [[upstream]](https://github.com/textmate/toml.tmbundle/commit/e82b64c1e86396220786846201e9aa3f0a2d9ca2)
| Zig <img src="plugin/syntaxes/zig/icon.png" width=16/> | file-extensions="zig, zon" | [master@ziglang/vscode-zig](https://github.com/ziglang/vscode-zig/tree/c6a604b958f6479ab2f70ec04552643a7f9cf66d/)

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
