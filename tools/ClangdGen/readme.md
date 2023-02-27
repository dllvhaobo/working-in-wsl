# Configuration genenerator for Project JCD 

- 查找Package对应的JCD（Json compilation DataBase），并生成Clangd的Project Configuration（.clangd)文件。
- 递归查找Package所依赖的sub-package对应的JCD文件，并添加到.clangd文件中。 

## 举例应用

```
# 下载编译ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
CONFIG_JNN=1 bob dev -v $BOB_OPT -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
# 生成package对应的工程配置文件（.clangd)
jcdgen.py --packages ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
```

## 参数参考

```bash
usage: jcdgen.py [-h] [--packages  [...]] [--cachefile] [--use-cache]
                 [--not-use-cache] [--save-cache] [--no-save-cache]
                 [--recursive-level] [--build-depends] [--clangfile]

在工程根目录下执行，查找指定目录内的所有的compile_commands.json文件，并生成".clang"文件到指定目录

optional arguments:
  -h, --help          show this help message and exit
  --packages  [ ...]  指定一个或者多个bob编译的package
  --cachefile         cache文件的路径,默认为当前目录的.clangchage
  --use-cache         用之前生成的cache文件解析
  --not-use-cache     不使用之前生成的cache文件解析
  --save-cache        保存所有过程信息，减少下次生成的时间
  --no-save-cache     不保存所有过程信息，不覆盖当前cache文件
  --recursive-level   递归查找sub-package的层次
  --build-depends     下载并编译sub-package
  --clangfile         默认保存在当前文件夹下.clangd
```
## 参考


- [JSON Compilation Database](https://clang.llvm.org/docs/JSONCompilationDatabase.html)
- [Clangd Project Configuration](https://clangd.llvm.org/config)
