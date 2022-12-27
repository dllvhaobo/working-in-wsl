# Working In WSL(Windows Subsystem For Linux)

受到多方面原因的制约，在公司中Windows系统仍然是不可被抛弃的，而日常开发又需要Linux环境，除了使用虚拟机，WSL也是一个非常不错的选择，本项目主要记录个人的系统配置及常用软件配置。

- 系统，软件安装及配置
  - WSL2 安装+配置
  - NEOVIM 安装&插件配置
  - Ubuntu系统软件包安装列表
  - Clang 的相关配置和使用手册
  - COC相关配置及使用手册
  - 其他
    - 键位重映射
    - WindowsTerminal 配置
    - 字体配置
    - 源配置
- 由于 Github 访问不稳定，所有安装包都已经打包到 gitlink 的[package 仓库][]
- 相关文档说明可跳转到https://workinginwsl.readthedocs.io查看；或者参考如下方式在本地查看。

  ```
  git clone https://github.com/dllvhaobo/working-in-wsl.git
  cd working-in-wsl
  pip install -r requirements.txt
  mkdocs serve
  ```


##### Ctags

```bash
sudo apt install universal-ctags
```



## FAQ

### Coc Language Server not found

`CocCommand clang.install`

### LanguageClient not found

PlugInstall 的步骤没有完全执行完就退出了，可能导致安装脚本没有执行。可以手动执行安装 `cd ~/.config/nvim/plugged/LanguageClient-neovim;./install.sh`

[githubissue]: https://github.com/neovim/neovim/issues/19711#issuecomment-1214241593
[docker-install]: https://docs.docker.com/engine/install/ubuntu/
[use-docker-non-root]: https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user
[website]: https://workinginwsl.readthedocs.io
[package 仓库]: https://www.gitlink.org.cn/dllvhaobo/working-in-wsl-package
