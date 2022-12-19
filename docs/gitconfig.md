## Git 配置


`拷贝配置文件` 或者 `命令行配置`二选一

## 拷贝配置文件

`cp configs/gitconfig ~/.gitconfig`

## 命令行配置

参考如下脚本配置，git配置，注意更换你的git账户和邮件。

```bash
git config --global user.email dl_lvhaobo@163.com
git config --global user.name dllvhaobo
git config --global diff.tool vimdiff

# 启动比较前不需要确认
git config --global difftool.prompt false
git config --global alias.d difftool

# 配置使用neovim作为git difftool比较工具
git config --global diff.tool vimdiff
git config --global difftool.vimdiff.path /usr/local/bin/nvim

#git config --global diff.tool meld #使用meld作为比价工具,需要图形化支持
#git config --global diff.tool bc3 #使用beyondcompare作为比价工具，需要图形化支持
```
