#!/bin/bash
echo "################################################################################"
echo "# Universal-Ctags"
echo "################################################################################"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then

    curl -O https://github.com/universal-ctags/ctags-nightly-build/releases/download/2023.05.23%2Bbf1ba55deffaf686d16dab4c6b30178324a7036a/uctags-2023.05.23-linux-x86_64.tar.xz

    tar xf  uctags-2023.05.23-linux-x86_64.tar.xz
    
    echo "TO be continue"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install universal-ctags
fi
