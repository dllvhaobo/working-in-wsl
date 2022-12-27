# NEOVIM

neovim 的安装方法详细说明可以参考[neovim-install-from-package][]的说明。快速安装可以参考以下任意一种方法。

- UBUNTU 环境下可以通过`apt install neovim`完成安装。Ubuntu 软件包管理策略比较保守，通常不会使用最新的版本，如果希望使用最新的版本，还是需要通过从源代码编译的方式进行安装。

- 下载源码自行编译安装，通过源码安装可以随时更新代码，安装最新的版本，获取更新的特性支持。

  ```bash
  git clone https://github.com/neovim/neovim.git
  cd neovim
  make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/full/path/
  make install
  ```

- 安装预先编译好的二进制文件。在服务器端受到权限的限制，不能使用 APT 的方式进行安装，也无法安装编译时需要使用的依赖 library。因此需要使用预先编译好的文件进行安装。

  ```bash
  INSTALL_DIR=$(pwd)
  export PATH="${XDG_DATA_HOME:-$HOME/.local/bin}":$PATH

  git clone https://gitlink.org.cn/dllvhaobo/working-in-wsl-package.git
  cd working-in-wsl-package

  # For Ubuntu 18.04 or earlier verison:
  tar zxf nvim-linux64-glibc-earlier.tar.gz

  # For Ubuntu 22.04 or later version:
  # tar zxf nvim-linux64.tar.gz

  cp -rf nvim-linux64/*  "${XDG_DATA_HOME:-$HOME/.local/share}/"
  ```

  **NOTE**: Neovim 8.0 需要 GLIBC_2.29 或者更新的 lib 库支持。在低版本的 Ubuntu 系统中 Glibc 的版本与 Neovim 依赖版本不一致。
  请使用 https://github.com/antoineco/neovim-neovim/releases发布的预编译版本。详见[GitHub Issue][githubissue]

[githubissue]: https://github.com/neovim/neovim/issues/19711#issuecomment-1214241593
[neovim用户手册]: https://neovim.io/doc/user/
[neovim-install-from-package]: https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-package
[package-for-ubuntu-18.04]: https://www.gitlink.org.cn/dllvhaobo/working-in-wsl-package/tree/main/nvim-linux64-glibc-earlier.tar.gz
[working-in-wsl-package]: https://gitlink.org.cn/dllvhaobo/working-in-wsl-package.git
