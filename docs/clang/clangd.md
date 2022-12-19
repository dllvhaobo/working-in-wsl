# CLANGD

## General

- coc-clangd 和 Language-Server 中的 Clang 的的配置二选一。

- coc 需要借助`compile_commands.json`来检索 symbol。详情参考[Json Compilation Database Specification].

- `compile_commands.json`的生成方式。

  - cmake 通过 `-DCMAKE_EXPORT_COMPILE_COMMANDS=1`来生成。
  - makefile 通过 bear 来生成

- neovim 中通过`:CocConfig`查看 clang 的配置:
  **NOTE**: coc-clang 和 languageserver 只能选择一个，可以参考`configs/nvim/coc-settings.json`

### languageserver

`:CocConfig`查看 coc 的配置，查找如下内容。

```json
"languageserver": {
     "clangd": {
          "command": "clangd",
          "rootPatterns": ["compile_flags.txt", "compile_commands.json"],
          "filetypes": ["c", "cc", "cpp", "c++", "objc", "objcpp"]
      },
```

### coc-clang 配置

`:CocConfig`查看 coc 的配置，查找如下内容。

```json
"clangd.enabled": true,
"clangd.path": "~/.config/coc/extensions/coc-clangd-data/install/15.0.3/clangd_15.0.3/bin/clangd"
```

coc-clang 会读取 clang 的配置文件，可以通过命令`CocCommand clangd.userconfig` 查看 CLangd 的用户配置。

## 配置

clangd 的配置文件可以为不同的代码路径指定不同的 compile_commands.json 文件。

### 用户配置:

- $(HOME)/.config/clangd/config.yaml
- 在 Neovim 中打开 C 文件后, 执行`CocCommand clangd.userconfig`可以打开用户配置

### 项目配置:

- 工程根目录/.clang/config.yaml
- 在 Neovim 中打开 C 文件后, 执行`CocCommand clangd.projectConfig`可以打开工程配置

  在 neovim 中可以通过`CocCommand clangd.userconfig`查看.

  **NOTE**: 针对目前项目的工程配置，可以拷贝`configs/copy-compile-command.py`到工程根目录，执行生成用户 clang 的用户配置。

  通过 Clangd 的用户配置，根据目录匹配不同的工程，使用不同的 compile_commands.json

  ```yaml
    if:
      PathMatch: .*/tsd.bt.phone.mib3/.*
    CompileFlags:
      CompilationDatabase: /srv/data/Joynext/lv_h1/works/cns3.0/dev/build/phone/phonemanager/tsd-phonemanager-target/1/workspace
    ---
    if:
      PathMatch: .*/bt-phone/tsd-bt-phone-mib3/1/workspace/tsd.bt.phone.mib3/.*
    CompileFlags:
      CompilationDatabase: /srv/data/Joynext/lv_h1/works/cns3.0/dev/build/phone/bt-phone/tsd-bt-phone-mib3-target/1/workspace
    ---
    if:
      PathMatch: .*/bt-organizer/tsd-organizer-mib3/1/workspace/tsd.organizer.mib3/.*
    CompileFlags:
      CompilationDatabase: /srv/data/Joynext/lv_h1/works/cns3.0/dev/build/phone/bt-organizer/tsd-organizer-mib3-dev/1/workspace
    ---
    if:
      PathMatch: .*/bt-organizer/tsd-organizer/1/workspace/tsd.organizer/.*
    CompileFlags:
      CompilationDatabase: /srv/data/Joynext/lv_h1/works/cns3.0/dev/build/phone/bt-organizer/tsd-organizer-dev/1/workspace

  ```

- 非 GP 项目 clangd 追加工程配置`~/YourRecipeProj/.clangd`;在 neovim 中可以通过`CocCommand clangd.projectConfig`查看&编辑.

  **NOTE**：针对非 GP 项目工程配置，可以拷贝`configs/.clangd`到工程根目录。

[1]: https://clangd.llvm.org/extensions.html
[2]: https://github.com/clangd/coc-clangd
[3]: https://github.com/clangd/clangd/issues/987
[clang-compilation-database-config]: https://clangd.llvm.org/config.html#compilationdatabase
[json compilation database specification]: https://clang.llvm.org/docs/JSONCompilationDatabase.html
[coc-clangd官方文档]: https://gitee.com/dllvhaobo/coc-clangd/blob/master/README.md
