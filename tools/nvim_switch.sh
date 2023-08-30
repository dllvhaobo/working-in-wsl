#!/bin/bash

DEST=$1

if [ -e "${HOME}/.config/nvim/init.vim" ]; then
    echo "Current is Neovim"
    echo "Bake Neovim Configuration"
    mv ~/.config/nvim{,.bak}
    mv ~/.local/share/nvim{,.bak}
    mv ~/.local/state/nvim{,.bak}
    mv ~/.cache/nvim{,.bak} 
    echo "Copy LazyVim Configuration"
    mv ~/.config/nvim{.lua,}
    mv ~/.local/share/nvim{.lua,}
    mv ~/.local/state/nvim{.lua,}
    mv ~/.cache/nvim{.lua,}
else
    echo "Current is LazyVim"
    echo "Bake LazyVim Configuration"
    mv ~/.config/nvim{,.lua}
    mv ~/.local/share/nvim{,.lua}
    mv ~/.local/state/nvim{,.lua}
    mv ~/.cache/nvim{,.lua}

    echo "Copy Neovim Configuration"
    mv ~/.config/nvim{.bak,}
    mv ~/.local/share/nvim{.bak,}
    mv ~/.local/state/nvim{.bak,}
    mv ~/.cache/nvim{.bak,} 
fi
