
# 字体安装

安装对应字体，并且在 Terminal 中选中安装的字体，可以在 Terminal 中现实 DevIcons，连体字,中文等等。

- Windows 环境下直双击字体进行安装

  - 如果使用 WindowsTerminal 作为终端应用，需要在`[外观->字体]`中选择对应的字体。

- Ubuntu 中参照如下步骤安装字体

  ```bash
  mkdir ~/.fonts
  cp fonts ~/.fonts -rf
  fc-cache -f -v
  ```

  **NOTE**: 推荐两种字体二选一，只有这两种字体支持中文。

- `Caskaydia Cove ExtraLight Nerd Font Complete Windows Compatible.otf`
- `DejaVu Sans Mono Nerd Font Complete.ttf`

_希望安装其他字体的可以到 [nerd-fonts][] 去寻找自己喜欢的字体，并参照上述步骤进行安装_

