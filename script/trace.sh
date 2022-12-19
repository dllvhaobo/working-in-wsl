#!/bin/bash 
set -x
MODE=$1
echo $MODE

if [ "$MODE"x == "hci"x ];then
    nc 192.168.1.4 13337 2>&1 > ~/logs/$(date "+%F_%H_%M").cfa &
fi

nc 192.168.1.4 15361 |grep "\[phone"  | tee -a  ~/logs/$(date "+%F_%H_%M").log
