#!/bin/bash
echo "################################################################################"
echo "# Universal-Ctags"
echo "################################################################################"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    apt install ripgrep

elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ripgrep
fi
