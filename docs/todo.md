# 系统配置

## 键盘映射

各个系统（windows，ubuntu，manjaro，MacBook）的方案各有不同。具体方案请参考[remap-caps-lock-to-escape-and-control][]

Features:

- Switch `backspace` and `backslash`
- CapsLock only as `escape`
- CapsLock + `X` as `Ctrl+X`

### Windows

### AutoHotKey

[AutoHotkey] 是一个自由、开源的宏生成器和自动化软件工具，它让用户能够自动执行重复性任务。AutoHotkey 可以修改任何应用程序的用户界面（例如，把默认的 Windows 按键控制命令替换为 Emacs 风格）。它是由定制的脚本语言驱动，旨在提供键盘快捷键或热键。

这里使用 AutoHotkey 将`Caps`映射成为`Ctrl`和`ESC`按键。只需要将`config/caps2escape.ahk`拷贝到`%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`

- 单独按压`Caps`映射成为`ESC`
- `Caps`+`其他按键`，`Caps`映射成为`Ctrl`

关于 AutoHotkey 的其他使用方法可以参考

- [AutoHotkey:常用技巧分享][]
- [AutoHotkey 官网][autohotkey]

#### SharpKey

WINDOWS 下修改键位映射的开源小工具[SharpKey][]

图形化的操作基本没有学习成本

一旦修改完成就再也不需要软件了，删除即可

软件也是不需要安装，下载打开即用

![img](../img/sharpkeys.png)

#### Ubuntu

执行`apt install -y xcape gnome-tweaks`安装"xcape"和"gnome-tweaks"。然后参考如下步骤完成设置，详情请参考[Remapping Caps Lock to Control and Escape][]

- Select checkbox `CapsLock as Ctrl` in `Gnome-tweaks->Keyboard & Mouse->Addtional Layout Options-> Control Position`.
- Append `xcape -e '#66=Escape'` to ~/.profile

### Mackbook

- https://karabiner-elements.pqrs.org下载"Karabiner-Elements"
- 安装"Karabiner-Elements"
- 启动"Karabiner-Elements"
- "Complex Modifications"->"Add rule",网页中搜索 "change caps_lock to dual keys, escape and left_control" 点击"import"

### Manjaro

拷贝 xmodemaprc 到根目录`cp config/xmodmap ~/xmodmaprc`,并且将如下内容拷贝到`~/.profile`文件的最后。详情可以参照[setxkbmap][]

```bash
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
xmodmap ~/xmodmaprc
```

## WindowsTerminal

## VsCode

## WSL2 安装

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
