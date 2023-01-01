## Coc Language Server not found

`CocCommand clang.install`

## LanguageClient not found

PlugInstall 的步骤没有完全执行完就退出了，可能导致安装脚本没有执行。可以手动执行安装 `cd ~/.config/nvim/plugged/LanguageClient-neovim;./install.sh`

## Docker for WSL2

今天在更新了 WSL2 上的 Ubuntu22.04 版本，在安装 Docker 后无法启动，查看 Docker 的日志显示如下的错误.

```bash
INFO[2022-04-22T16:14:55.718999500+08:00] stopping event stream following graceful shutdown error="<nil>" module=libcontainerd namespace=moby
INFO[2022-04-22T16:14:55.719787400+08:00] stopping event stream following graceful shutdown error="context canceled" module=libcontainerd namespace=plugins.moby
INFO[2022-04-22T16:14:55.719906400+08:00] stopping healthcheck following graceful shutdown module=libcontainerd
failed to start daemon: Error initializing network controller: error obtaining controller instance: unable to add return rule in DOCKER-ISOLATION-STAGE-1 chain: (iptables failed: iptables --wait -A DOCKER-ISOLATION-STAGE-1 -j RETURN:       iptables v1.8.7 (nf_tables): RULE_APPEND failed (No such file or directory): rule in chain DOCKER-ISOLATION-STAGE-1
(exit status 4))
```

原因是由于新的 ubuntu 系统使用了 iptables-nft，而 WSL2 不支持导致的。可以通过以下命令进行修改.

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
