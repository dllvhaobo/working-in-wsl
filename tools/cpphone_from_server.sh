#!/bin/bash

set -x
echo $folder

# SEVER INFO
SEVER_IP="10.70.9.129"
USER_NAME="lv_h1"
PASSWD="Love@613511"

ROOT_DIR="/srv/data/Joynext/${USER_NAME}/works/recipes-svw-cns3.0"

UPDATE_SCRIPT="/home/lv/works/working-in-wsl/tools/hu-update.sh"


BT_PHONE_APP="tsd.bt.phone.mib3"
BT_PHONE_DIR="dev/dist/phone/bt-phone/tsd-bt-phone-mib3-target/1/workspace/usr/bin"
BT_PHONE="${ROOT_DIR}/${BT_PHONE_DIR}/${BT_PHONE_APP}"

PHONE_MGR_APP="tsd.phonemanager"
PHONE_MGR_DIR="dev/dist/phone/phonemanager/tsd-phonemanager-target/1/workspace/usr/bin"
PHONE_MGR="${ROOT_DIR}/${PHONE_MGR_DIR}/${PHONE_MGR_APP}"


################################################################################
# 从编译Server拷贝到本地
################################################################################
TEMP_FOLDER=$(mktemp -d)
echo $TEMP_FOLDER
sshpass -p ${PASSWD} scp -P ${PORT} ${USER_NAME}@${SEVER_IP}:${ROOT_DIR}/${BT_PHONE} $TEMP_FOLDER
sshpass -p ${PASSWD} scp -P ${PORT} ${USER_NAME}@${SEVER_IP}:${ROOT_DIR}/${PHONE_MGR} $TEMP_FOLDER
#
################################################################################
# 发送到HU
################################################################################
sshpass -p root scp ${UPDATE_SCRIPT} ${TEMP_FOLDER}/${BT_PHONE_APP} ${TEMP_FOLDER}/${PHONE_MGR_APP} root@192.168.1.4:/home/root

################################################################################
#  HU上执行替换
################################################################################
sshpass -p root ssh root@192.168.1.4 'sh /home/root/hu-update.sh'

################################################################################
#  车机重启
################################################################################
sshpass -p root ssh root@192.168.1.4 /sbin/reboot

