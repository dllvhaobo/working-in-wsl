#!/bin/bash

set -x
echo $folder
ROOT_DIR='/home/lv/works/recipes-svw-cns3.0'
BT_PHONE_DIR="dev/dist/phone/bt-phone/tsd-bt-phone-mib3-target/1/workspace/usr/bin/tsd.bt.phone.mib3"
PHONE_MGR_DIR="dev/dist/phone/phonemanager/tsd-phonemanager-target/1/workspace/usr/bin/tsd.phonemanager" 
# UPDATE_SCRIPT="/home/lv/works/system_config/tools/hu-update.sh"
UPDATE_SCRIPT="/home/lv/works/working-in-wsl/tools/hu-update.sh"
BT_PHONE="${ROOT_DIR}/${BT_PHONE_DIR}"
PHONE_MGR="${ROOT_DIR}/${PHONE_MGR_DIR}"

################################################################################
#  Transfer binary to Head-Unit
################################################################################
sshpass -p root scp $UPDATE_SCRIPT $BT_PHONE $PHONE_MGR  root@192.168.1.4:/home/root

################################################################################
#  Update On HU side
################################################################################
sshpass -p root ssh root@192.168.1.4 'sh /home/root/hu-update.sh'


################################################################################
#  HU reboot
################################################################################
sshpass -p root ssh root@192.168.1.4 /sbin/reboot

#
# Copy From Compile-Server
#
# folder=$(mktemp -d)
# echo $folder
# scp lv_h1@10.70.9.60:/srv/data/Joynext/lv_h1/works/cns3.0/dev/dist/phone/bt-phone/tsd-bt-phone-mib3-target/3/workspace/usr/bin/tsd.bt.phone.mib3 $folder
# scp lv_h1@10.70.9.60:/srv/data/Joynext/lv_h1/works/cns3.0/dev/dist/phone/phonemanager/tsd-phonemanager-target/3/workspace/usr/bin/tsd.phonemanager $folder
# scp $folder/tsd.phonemanager $folder/tsd.bt.phone.mib3 root@192.168.1.4:/home/root
# ssh root@192.168.1.4 '/home/root/update.sh'
