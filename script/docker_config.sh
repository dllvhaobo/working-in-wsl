#!/bin/bash

sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

apt update
apt install -y vim
apt install sudo 

useradd lvhaobo -u 1000 -g sudo -m -d /home/lvhaobo 

echo "chmod u+w" 
echo "vim /etc/sudoer"
echo "%sudo	ALL=(ALL:ALL) NOPASSWD: ALL"
echo "chmod u-w" 
