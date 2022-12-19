# KEYMAP

各个系统（windows，ubuntu，manjaro，MacBook）的方案各有不同，请根据需要自行跳转

Features:

- Switch `backspace` and `backslash`
- CapsLock only as `escape`
- CapsLock + `X` as `Ctrl+X`

## Windows

Windows 上需要安装`AutoHotkey` 软件，通过 AutoAutoKey 加载配置文件。可以跳转到参考页查看详情。[参考 1][ref1],[参考 2][ref2]

- 安装 AutoHotKey
- 拷贝`config/caps2escape.ahk` 到`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`

## Ubuntu

Install app as follwoing. CapsLock changed to Escape if it tapped, while it change to Control if compose with other key pressed. [参考页面][ref4]

- Select checkbox `CapsLock as Ctrl` in `Gnome-tweaks->Keyboard & Mouse->Addtional Layout Options-> Control Position`.
- Append `xcape -e '#66=Escape'` to ~/.profile

```bash
apt install -y xcape gnome-tweaks
```

## Mackbook

I use Karabiner with a configuration taken from this GitHub issue comment. After installing Karabiner, copy `karabiner/karabiner.json` to `~/.config/karabiner/karabiner.json,` and modify the rules array.

## Manjaro

拷贝 xmodemaprc 到根目录`cp config/xmodmap ~/xmodmaprc`,并且将如下内容拷贝到`~/.profile`文件的最后。详情可以参照[参考 3][ref3]

```bash
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
xmodmap ~/xmodmaprc
```

[ref1]: https://gist.github.com/tanyuan/55bca522bf50363ae4573d4bdcf06e2e
[ref2]: https://www.dannyguo.com/blog/remap-caps-lock-to-escape-and-control
[ref3]: https://my.oschina.net/swanf/blog/1549976
[ref4]: https://askubuntu.com/questions/177824/remapping-caps-lock-to-control-and-escape-not-the-usual-way/228379#228379
