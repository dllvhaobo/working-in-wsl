# 系统配置

## 键盘映射

各个系统（windows，ubuntu，manjaro，MacBook）的方案各有不同。具体方案请参考[remap-caps-lock-to-escape-and-control][]

Features:

  - Switch `backspace` and `backslash`
  - CapsLock only as `escape`
  - CapsLock + `X` as `Ctrl+X`

### Windows

- AutoHotKey

  [AutoHotkey][] 是一个自由、开源的宏生成器和自动化软件工具，它让用户能够自动执行重复性任务。AutoHotkey 可以修改任何应用程序的用户界面（例如，把默认的 Windows 按键控制命令替换为 Emacs 风格）。它是由定制的脚本语言驱动，旨在提供键盘快捷键或热键。

  这里使用 AutoHotkey 将`Caps`映射成为`Ctrl`和`ESC`按键。只需要将`config/caps2escape.ahk`拷贝到`%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`

  - 单独按压`Caps`映射成为`ESC`
  - `Caps`+`其他按键`，`Caps`映射成为`Ctrl`

  关于 AutoHotkey 的其他使用方法可以参考

  - [AutoHotkey:常用技巧分享][]
  - [AutoHotkey 官网][autohotkey]

- SharpKey

  WINDOWS 下修改键位映射的开源小工具[SharpKey][]

  图形化的操作基本没有学习成本

  一旦修改完成就再也不需要软件了，删除即可

  软件也是不需要安装，下载打开即用

  ![img](../img/sharpkeys.png)

### Ubuntu

执行`apt install -y xcape gnome-tweaks`安装"xcape"和"gnome-tweaks"。然后参考如下步骤完成设置，详情请参考[Remapping Caps Lock to Control and Escape][]

- Select checkbox `CapsLock as Ctrl` in `Gnome-tweaks->Keyboard & Mouse->Addtional Layout Options-> Control Position`.
- Append `xcape -e '#66=Escape'` to ~/.profile

### Mackbook

- https://karabiner-elements.pqrs.org下载"Karabiner-Elements"
- 安装"Karabiner-Elements"
- 启动"Karabiner-Elements"
- `Complex Modifications`->`Add rule`,网页中搜索 `change caps_lock to dual keys, escape and left_control` 点击"import"

### Manjaro

拷贝 xmodemaprc 到根目录`cp config/xmodmap ~/xmodmaprc`,并且将如下内容拷贝到`~/.profile`文件的最后。详情可以参照[setxkbmap][]

```bash
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
xmodmap ~/xmodmaprc
```

## WindowsTerminal

参考 `config/windowsTerminal.json` 中`actions`和`Gruvbox`配色的配置。修改 WindowsTerminal 的配合文件（.json)

## VsCode

在 VSCODE 使用 VIM 的快捷键配置。 拷贝`config/code-settings.json` 到目录 `%APPDATA%\Code\User\settings.json`

Vscode 的 VIM 输入插件，参考：https://github.com/VSCodeVim/Vim#input-method

输入法自动切换参考：https://github.com/daipeihust/im-select#to-get-current-keyboard-locale和https://www.science.co.il/language/Locale-codes.php

## WSL2

### INSTALLATION

关于 WSL 的安装的详细说明请参考[微软的官方网页]或者以管理员账户启动 PowerShell 执行如下步骤.

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```

安装并下载[Linux 内核更新包][]; 在[Microsoft Store][]中选择偏好的 Linux 发行版选择安装

### ADVANCE CONFIGURATION FOR WSL2

如果需要限制 WSL 使用的内存，处理器，交换分区等相关设置，请参考[WSL 高级设置][]

`.wslconfig`下面的示例文件演示了一些可用的配置选项。 在此示例中，文件路径为 `%USERPROFILE%\.wslconfig`.

```bash
# Settings apply across all Linux distros running on WSL 2
[wsl2]

# Limits VM memory to use no more than 4 GB, this can be set as whole numbers using GB or MB
memory=4GB

# Sets the VM to use two virtual processors
processors=2

# Specify a custom Linux kernel to use with your installed distros. The default kernel used can be found at https://github.com/microsoft/WSL2-Linux-Kernel
kernel=C:\\temp\\myCustomKernel

# Sets additional kernel parameters, in this case enabling older Linux base images such as Centos 6
kernelCommandLine = vsyscall=emulate

# Sets amount of swap storage space to 8GB, default is 25% of available RAM
swap=8GB

# Sets swapfile path location, default is %USERPROFILE%\AppData\Local\Temp\swap.vhdx
swapfile=C:\\temp\\wsl-swap.vhdx

# Disable page reporting so WSL retains all allocated memory claimed from Windows and releases none back when free
pageReporting=false

# Turn off default connection to bind WSL 2 localhost to Windows localhost
localhostforwarding=true

# Disables nested virtualization
nestedVirtualization=false

# Turns on output console showing contents of dmesg when opening a WSL 2 distro for debugging
debugConsole=true
```

### DOCKER

此处只介绍在 WSL2 中启动原生 Docker 的操作。另外也可以参考 Docker 官网的介绍，使用 Docker Desktop for Windows.

- 在 Ubuntu 中安装 Docker

  ```bash
  sudo apt remove docker docker-engine docker.io containerd runc
  sudo apt install ca-certificates curl  gnupg  lsb-release
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update
  sudo apt-get install docker-ce docker-ce-cli containerd.io
  sudo groupadd docker
  sudo usermod -aG docker $USER
  ```

- 在 Ubuntu 中启动 Docker 服务。

  将如下脚添加到`~/.zshrc`或者`~/bashrc`文件的末尾，在 WSL2 中启动原生 Docker 服务(而不是 DockerDesktop For Windows).

  ```bash
  # 不使用Docker-Desktop，默认启动Docker服务
  set -x
  DOCKER_DISTRO="Ubuntu" # Powershell中通过wsl -l查看当前正在使用的WSL DISTRO版本
  DOCKER_DIR=/mnt/wsl/shared-docker
  DOCKER_SOCK="$DOCKER_DIR/docker.sock"
  export DOCKER_HOST="unix://$DOCKER_SOCK"
  if [ ! -S "$DOCKER_SOCK" ]; then
     mkdir -pm o=,ug=rwx "$DOCKER_DIR"
     sudo chgrp docker "$DOCKER_DIR"
     /mnt/c/Windows/System32/wsl.exe -d $DOCKER_DISTRO sh -c "nohup sudo -b dockerd < /dev/null > $DOCKER_DIR/dockerd.log 2>&1"
  fi
  ```

### 其它

- Advance Configuration for WSL1

  WSL2 的磁盘效率据说要比 WSL1 提升 20%以上，比价推荐使用 WSL2。但是如果坚持使用 WSL1 的话，请参考如下 WSL1 的高级配置。在 Ubuntu 文件系统中创建`/etc/wsl.conf`.

  ```bash
  # Automatically mount Windows drive when the distribution is launched
  [automount]

  # Set to true will automount fixed drives (C:/ or D:/) with DrvFs under the root directory set above. Set to false means drives won't be mounted automatically, but need to be mounted manually or with fstab.
  enabled = true

  # Sets the directory where fixed drives will be automatically mounted. This example changes the mount location, so your C-drive would be /c, rather than the default /mnt/c.
  root = /

  # DrvFs-specific options can be specified.
  options = "metadata,uid=1003,gid=1003,umask=077,fmask=11,case=off"

  # Sets the `/etc/fstab` file to be processed when a WSL distribution is launched.
  mountFsTab = true

  # Network host settings that enable the DNS server used by WSL 2. This example changes the hostname, sets generateHosts to false, preventing WSL from the default behavior of auto-generating /etc/hosts, and sets generateResolvConf to false, preventing WSL from auto-generating /etc/resolv.conf, so that you can create your own (ie. nameserver 1.1.1.1).
  [network]
  hostname = DemoHost
  generateHosts = false
  generateResolvConf = false

  # Set whether WSL supports interop process like launching Windows apps and adding path variables. Setting these to false will block the launch of Windows processes and block adding $PATH environment variables.
  [interop]
  enabled = false
  appendWindowsPath = false

  # Set the user when launching a distribution with WSL.
  [user]
  default = DemoUser

  # Set a command to run when a new WSL instance launches. This example starts the Docker container service.
  [boot]
  command = service docker start
  ```

- 基于 WSL2, UBUNTU 22.04 的环境下，Docker 无法启动

  ubuntu 22.04 系统使用了 iptables-nft，WSL2 不支持 iptables-nft，导致 docker-engine 无法启动。。可以通过以下命令进行修改.

  ```bash
  sudo update-alternatives --config iptables
  There are 2 choices for the alternative iptables (providing /usr/sbin/iptables).

  Selection Path Priority Status
  ------------------------------------------------------------
  * 0 /usr/sbin/iptables-nft 20 auto mode
  1 /usr/sbin/iptables-legacy 10 manual mode
  2 /usr/sbin/iptables-nft 20 manual mode
  Press <enter> to keep the current choice[*], or type selection number: 1

  Press <enter> to keep the current choice[*], or type selection number: 1
  update-alternatives: using /usr/sbin/iptables-legacy to provide /usr/sbin/iptables (iptables) in manual mode
  ```

[githubissue]: https://github.com/neovim/neovim/issues/19711#issuecomment-1214241593
[docker-install]: https://docs.docker.com/engine/install/ubuntu/
[use-docker-non-root]: https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user
[wsl 高级设置]: https://learn.microsoft.com/zh-cn/windows/wsl/wsl-config
[linux 内核更新包]: https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
[微软的官方网页]: https://learn.microsoft.com/zh-cn/windows/wsl/install-manual
[microsoft store]: https://aka.ms/wslstore

## ubuntu

### mirrors

#### apt

#### npm

#### yarn

#### pip

#### vim-plug

#### hosts

#### coc

## ranger

## tig

## neovim

## NEOVIM

neovim 是 vim 的一个分支，其特性是 vim 的超集，操作与 VIM 几乎完全兼容。快速安装请参考如下步骤。详细信息请参考[neovim][]和[neovim.io][]

### INSTALLATION

- 稳定版

  ```bash
  sudo apt-get install software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/stable
  sudo apt install neovim
  ```

- 最新版

  ```bash
  sudo apt-get install software-properties-common
  sudo add-apt-repository ppa:neovim-ppa/unstable
  sudo apt install neovim
  ```

- 拷贝配置

  ```
  mkdir -p "${XDG_DATA_HOME:-$HOME/.config/nvim}"
  ln -s $(pwd)/config/init.vim ~/.config/nvim/init.vim
  ln -s $(pwd)/config/coc-settings.json ~/.config/nvim/coc-settings.json

  ```

### - installation

#### - install from source code

#### - install via pre-build package

#### - install from ppa

### vim-plug

### coc-extension

## clang

## git

### difftool

### mergetool

## svn

## zsh

### theme

### autojump

### autocomplete

## VIM-PLUG Operation

### vim-fugitive

### coc-explorer

### coc-clang

### vim-inspector

[remap-caps-lock-to-escape-and-control]: https://www.dannyguo.com/blog/remap-caps-lock-to-escape-and-control
[setxkbmap]: https://my.oschina.net/swanf/blog/1549976
[remapping caps lock to control and escape]: https://askubuntu.com/questions/177824/remapping-caps-lock-to-control-and-escape-not-the-usual-way/228379#228379
[sharpkey]: https://github.com/randyrants/sharpkeys
[autohotkey:常用技巧分享]: https://zhuanlan.zhihu.com/p/103357456
[autohotkey]: https://github.com/AutoHotkey/AutoHotkey

```

```
