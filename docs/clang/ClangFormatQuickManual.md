# Clang-format

- 跳转到[clang-format 官方说明]，查看最新的关于 Clang-format 所有配置说明。
- [clang-format 本地][]

### 使用配置

`cp ./config/.clang-format ~/`

### 看所有的 clang-format 样式

```bash
STYLES="microsoft google llvm webkit gnu chronium mozilla"

for i in ${STYLES}
do
clang-format --style=${i} --dump-config > ${i}
done

```

clang-format-cn 是之前收集的说明文件。

style 文件的配置项的说明见 Clang 官网。

[clang-format官方说明]: https://clang.llvm.org/docs/ClangFormatStyleOptions.html
[clang-format本地]: ./clang-format-style-options.md
[clang-format安装]: https://apt.llvm.org/
 `sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-14 1`
