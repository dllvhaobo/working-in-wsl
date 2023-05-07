#!/bin/bash
echo "################################################################################"
echo "# pynvim"
echo "################################################################################"
pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install --upgrade pip
pip3 install pynvim
