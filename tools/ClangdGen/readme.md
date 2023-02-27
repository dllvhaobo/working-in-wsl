# Configuration genenerator for Project JCD 

- 查找Package对应的JCD（Json compilation DataBase），并生成Clangd的Project Configuration（.clangd)文件。
- 递归查找Package所依赖的sub-package对应的JCD文件，并添加到.clangd文件中。 

## 举例应用

```
# 下载编译ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
CONFIG_JNN=1 bob dev -v $BOB_OPT -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
# 生成package对应的工程配置文件（.clangd)
cpjson2.py --packages ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
```
## 参考

- [JSON Compilation Database](https://clang.llvm.org/docs/JSONCompilationDatabase.html)
- [Clangd Project Configuration](https://clangd.llvm.org/config)
