# WSL2 安装及配置

## 安装服务

关于 WSL 的安装的详细说明请参考[微软的官方网页]或者以管理员账户启动 PowerShell 执行如下步骤.

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
wsl --set-default-version 2
```

安装并下载[Linux 内核更新包][]; 在[Microsoft Store][]中选择偏好的 Linux 发行版选择安装

## 高级配置

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


## Docker 服务

此处在 WSL2 中启动 Docker 服务（不借助 docker-Desktop)

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

## 其它

### WSL1 高级配置

WSL2的磁盘效率据说要比WSL1提升20%以上，比价推荐使用WSL2。但是如果坚持使用WSL1的话，请参考如下WSL1的高级配置。在 Ubuntu 文件系统中创建`/etc/wsl.conf`.

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

### 基于 WSL2, UBUNTU 22.04 的环境下，Docker 无法启动

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
