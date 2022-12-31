# Working In WSL(Windows Subsystem For Linux)

在 Windows 系统环境中，使用 WSL2 替代虚拟机；使用 WindowsTerminal 作为终端模拟器；使用 Neovim，vim-plug 构建开发环境。

- Windows 环境配置
  - WSL2 安装及配置
  - DevIcon 字体安装
  - 修改键盘布局
  - WindowsTerminal 配置
  - VsCode 配置
- Ubuntu 环境配置
  - apt 国内源
  - pip 国内源
  - npm 国内源
  - yarn 国内源
  - neovim 安装及配置
  - vim-plug 插件管理器
  - clang 安装及配置
  - clang-format 安装及配置
- 国内访问
  - 安装包打包（tar.gz）到[gitlink][]进行维护。
  - 位于 Github 上的项目已在[gitee][]上创建镜像。
- 说明文档

  - [QuickStart][./docs/quickstart.md]
  - [在线文档][readthedocs.io]
  - 也可以参照如下命令在本地生成文档查看。

    ```bash
    git clone https://github.com/dllvhaobo/working-in-wsl.git
    cd working-in-wsl
    pip install -r requirements.txt
    mkdocs serve
    ```

[gitee]: https://gitee.com/dllvhaobo/dashboard/projects
[gitlink]: https://www.gitlink.org.cn/dllvhaobo/working-in-wsl-package
[readthedocs.io]: https://workinginwsl.readthedocs.io
