# WSL2安装及配置

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

[linux 内核更新包]: https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
[微软的官方网页]: https://learn.microsoft.com/zh-cn/windows/wsl/install-manual
[microsoft store]: https://aka.ms/wslstore
[wsl高级设置]: https://learn.microsoft.com/zh-cn/windows/wsl/wsl-config



