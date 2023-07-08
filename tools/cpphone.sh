#!/bin/bash

set -x
echo $folder

ROOT_DIR='/home/lv/works/recipes-svw-cns3.0'
UPDATE_SCRIPT="/home/lv/works/working-in-wsl/tools/hu-update.sh"

################################################################################
# 拷贝程序列表
################################################################################
# BT Phone
BT_PHONE_DIR="dev/dist/phone/bt-phone/tsd-bt-phone-mib3-target/1/workspace/usr/bin/tsd.bt.phone.mib3"
BT_PHONE="${ROOT_DIR}/${BT_PHONE_DIR}"

# Phonemananger
PHONE_MGR_DIR="dev/dist/phone/phonemanager/tsd-phonemanager-target/1/workspace/usr/bin/tsd.phonemanager" 
PHONE_MGR="${ROOT_DIR}/${PHONE_MGR_DIR}"

# Media
# MEDIA_APP_DIR="dev/dist/media/mediaapplication/tsd-media-mib3-target/1/workspace/usr/bin/tsd.media.mib3.app.target"
# MEDIA_APP="${ROOT_DIR}/${MEDIA_APP_DIR}"

################################################################################
# 拷贝到车机
################################################################################
sshpass -p root scp  $BT_PHONE $PHONE_MGR root@192.168.1.4:/home/root
# sshpass -p root scp $UPDATE_SCRIPT $BT_PHONE $PHONE_MGR $MEDIA_APP root@192.168.1.4:/home/root


################################################################################
#  Update On HU side
################################################################################
# sshpass -p root ssh root@192.168.1.4 'sh /home/root/hu-update.sh'
sshpass -p root ssh root@192.168.1.4 << EOF
/sbin/mount-read-write.sh
systemctl mask watchdog-reboot.service
[ ! -f /usr/bin/tsd.bt.phone.mib3.org ] && cp /usr/bin/tsd.bt.phone.mib3 /usr/bin/tsd.bt.phone.mib3.org
[ ! -f /usr/bin/tsd.phonemanager.org ] && cp /usr/bin/tsd.phonemanager /usr/bin/tsd.phonemanager.org

systemctl mask watchdog-reboot.service
cp /home/root/tsd.bt.phone.mib3  /usr/bin/
cp /home/root/tsd.phonemanager  /usr/bin/
attr -S -s SMACK64 -V "ro" /usr/bin/tsd.bt.phone.mib3
attr -S -s SMACK64 -V "ro" /usr/bin/tsd.phonemanager
sync
exit

EOF

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
#
#
#
