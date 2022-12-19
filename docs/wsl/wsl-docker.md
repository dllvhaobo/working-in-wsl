# DockerEngine In WSL2

## Docker安装

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

## WSL2启动Docker服务

将如下脚添加到`~/.zshrc`或者`~/bashrc`文件的末尾，在WSL2中启动原生Docker服务(而不是DockerDesktop For Windows).

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

## Use IPTALBES-LEGACY

ubuntu 22.04系统使用了 iptables-nft，WSL2不支持iptables-nft，导致docker-engine无法启动。。可以通过以下命令进行修改.

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
[package_repo]: https://www.gitlink.org.cn/dllvhaobo/working-in-wsl-package
