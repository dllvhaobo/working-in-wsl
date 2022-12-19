# Clang-format

- 跳转到[clang-format官方说明]，查看最新的关于Clang-format所有配置说明。
- [clang-format](./clang-format/Clang-Format.html)

### 使用配置

`cp ./config/.clang-format ~/`

### 看所有的clang-format样式

```bash
STYLES="microsoft google llvm webkit gnu chronium mozilla"

for i in ${STYLES}
do
clang-format --style=${i} --dump-config > ${i}
done

```

clang-format-cn是之前收集的说明文件。

style文件的配置项的说明见Clang官网。

[clang-format官方说明]:https://clang.llvm.org/docs/ClangFormatStyleOptions.html
