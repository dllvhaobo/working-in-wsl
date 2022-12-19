# 字体

安装对应字体，并且在Terminal中选中安装的字体，可以在Terminal中现实DevIcons，连体字,中文等等。

* Windows环境下直双击字体进行安装
* Ubuntu中参照如下步骤安装字体
   ```bash
   mkdir ~/.fonts
   cp fonts ~/.fonts -rf
   fc-cache -f -v
   ```

__NOTE__: 推荐两种字体二选一，只有这两种字体支持中文。

- `Caskaydia Cove ExtraLight Nerd Font Complete Windows Compatible.otf`
- `Droid Sans Mono Nerd Font Complete Mono Windows Compatible.otf`


_希望安装其他字体的可以到 https://github.com/ryanoasis/nerd-fonts 去寻找自己喜欢的字体，并参照上述步骤进行安装_
