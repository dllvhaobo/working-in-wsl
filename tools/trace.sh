#!/bin/bash 
set -x
MODE=$1
echo $MODE

if [ "$MODE"x == "hci"x ];then
    nc 192.168.1.4 13337 2>&1 > ~/logs/$(date "+%F_%H_%M").cfa &
fi

# nc 192.168.1.4 15361 | tee -a  ~/logs/$(date "+%F_%H_%M").log
#
# nc 192.168.1.4 15361 |grep "media"  | tee -a  ~/logs/$(date "+%F_%H_%M").log

# Phone
nc 192.168.1.4 15361 |grep -E "\[phone"  | tee -a  ~/logs/$(date "+%F_%H_%M").log

# Phone&Media
# nc 192.168.1.4 15361 |grep -E "\[(phone|media|audio)"  | tee -a  ~/logs/$(date "+%F_%H_%M").log

# ALL
# nc 192.168.1.4 15361   | tee -a  ~/logs/$(date "+%F_%H_%M").log
