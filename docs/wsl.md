# WSL2安装及相关配置

关于 WSL 的安装的详细说明请参考[微软的官方网页]或者以管理员账户启动 PowerShell 执行如下步骤.

## 安装 Windows SubSystem For Linux

```powershell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

## 安装 Virtual Machine Platform

```powershell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

## 下载 Linux 内核更新包

安装并下载[Linux 内核更新包]

## 设置 WSL2 为默认版本

```powershell
wsl --set-default-version 2
```

## 安装 Linux 的发行版本

在[Microsoft Store]中选择偏好的 Linux 发行版选择安装；或者执行如下命令安装默认的 Ubuntu 发行版。

```powershell
wsl --install
```

## WSL 高级配置

如果需要限制 WSL 使用的内存，处理器，交换分区等相关设置，请参考[WSL 高级设置]

`.wslconfig`下面的示例文件演示了一些可用的配置选项。 在此示例中，文件路径为 `C:\Users\<UserName>\.wslconfig`.

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

[linux 内核更新包]: https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
[微软的官方网页]: https://learn.microsoft.com/zh-cn/windows/wsl/install-manual
[microsoft store]: https://aka.ms/wslstore
[wsl高级设置]: https://learn.microsoft.com/zh-cn/windows/wsl/wsl-config
