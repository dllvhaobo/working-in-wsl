# 键位修改

各个系统（windows，ubuntu，manjaro，MacBook）的方案各有不同。具体方案请参考[remap-caps-lock-to-escape-and-control][]

Features:

- Switch `backspace` and `backslash`
- CapsLock to Escape on tapped
- CapsLock to Left_Control on hold

## Windows

[AutoHotkey] 是一个自由、开源的宏生成器和自动化软件工具，它让用户能够自动执行重复性任务。AutoHotkey 可以修改任何应用程序的用户界面（例如，把默认的 Windows 按键控制命令替换为 Emacs 风格）。它是由定制的脚本语言驱动，旨在提供键盘快捷键或热键。

这里使用 AutoHotkey 将`Caps`映射成为`Ctrl`和`ESC`按键。只需要将`config/caps2escape.ahk`拷贝到`%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup`

- 单独按压`Caps`映射成为`ESC`
- `Caps`+`其他按键`，`Caps`映射成为`Ctrl`

关于 AutoHotkey 的其他使用方法可以参考

- [AutoHotkey:常用技巧分享][]
- [AutoHotkey 官网][autohotkey]

## Ubuntu

执行`apt install -y xcape gnome-tweaks`安装"xcape"和"gnome-tweaks"。然后参考如下步骤完成设置，详情请参考[Remapping Caps Lock to Control and Escape][]

- Select checkbox `CapsLock as Ctrl` in `Gnome-tweaks->Keyboard & Mouse->Addtional Layout Options-> Control Position`.
- Append `xcape -e '#66=Escape'` to ~/.profile

## Mackbook

- 下载[karabiner](https://karabiner-elements.pqrs.org/)
- karabiner 的配置文件位于`~/.config/karabiner/karabiner.json`
- 参考如下`./config/karabiner.json`, 拷贝`Profile`下`rules`到 karabiner 的配置文件中相应位置

## Manjaro

拷贝 xmodemaprc 到根目录`cp config/xmodmap ~/xmodmaprc`,并且将如下内容拷贝到`~/.profile`文件的最后。详情可以参照[setxkbmap][]

```bash
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
xmodmap ~/xmodmaprc
```

[remap-caps-lock-to-escape-and-control]: https://www.dannyguo.com/blog/remap-caps-lock-to-escape-and-control
[setxkbmap]: https://my.oschina.net/swanf/blog/1549976
[remapping caps lock to control and escape]: https://askubuntu.com/questions/177824/remapping-caps-lock-to-control-and-escape-not-the-usual-way/228379#228379
[autohotkey:常用技巧分享]: https://zhuanlan.zhihu.com/p/103357456
[autohotkey]: https://github.com/AutoHotkey/AutoHotkey
