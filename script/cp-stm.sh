#!/bin/bash

WORKSPACE=$(pwd)
DST_PATH=$1

echo $DST_PATH
# cp ${WORKSPACE}/dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/reconnect/stm/projection/export.xml
# cp ${WORKSPACE}/dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/reconnect/stm/main/export.xml
# cp ${WORKSPACE}/dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/connection/stm/disconnect/export.xml
# cp ${WORKSPACE}/dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/connection/stm/command/export.xml
# cp ${WORKSPACE}/dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/connection/stm/connect/export.xml
# cp ${WORKSPACE}/dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/discovery/stm/export.xml
# cp ${WORKSPACE}/dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/state/stm/export.xml
# cp ${WORKSPACE}/dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/remote/pairing/stm/export.xml
# cp ${WORKSPACE}/dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/remote/discovery/stm/export.xml
# cp ${WORKSPACE}/dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/remote/connect/stm/export.xml
# cp ${WORKSPACE}/dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/local/settings/configurationstm/export.xml



# ./dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/reconnect/stm/projection/export.xml
# ./dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/reconnect/stm/main/export.xml
# ./dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/connection/stm/disconnect/export.xml
# ./dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/connection/stm/command/export.xml
# ./dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/connection/stm/connect/export.xml
# ./dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/discovery/stm/export.xml
# ./dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/state/stm/export.xml
# ./dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/remote/pairing/stm/export.xml
# ./dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/remote/discovery/stm/export.xml
# ./dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/remote/connect/stm/export.xml
# ./dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/local/settings/configurationstm/export.xml
# ./dev/src/phone/bt-handsfree/tsd-bt-handsfree/1/workspace/tsd.bt.handsfree/src/tsd/bt/handsfree/status/call/stm/export.xml
# ./dev/src/phone/bt-handsfree/tsd-bt-handsfree/1/workspace/tsd.bt.handsfree/src/tsd/bt/handsfree/status/phone/stm/export.xml
# ./dev/src/phone/bt-mediacontroller/tsd-bt-media/1/workspace/tsd.bt.media/src/tsd/bt/media/player/playmode/stm/export.xml
# ./dev/src/phone/bt-mediacontroller/tsd-bt-media/1/workspace/tsd.bt.media/src/tsd/bt/media/player/status/stm/export.xml
# ./dev/src/phone/bt-mediacontroller/tsd-bt-media/1/workspace/tsd.bt.media/src/tsd/bt/media/player/playback/stm/export.xml
# ./dev/src/phone/bt-mediacontroller/tsd-bt-media/1/workspace/tsd.bt.media/src/tsd/bt/media/browser/stm/export.xml

cp ${WORKSPACE}/dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/reconnect/stm/projection/export.xml                  ${DST_PATH}/phonemanager-reconnect-stm-projection-export.xml
cp ${WORKSPACE}/dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/reconnect/stm/main/export.xml                        ${DST_PATH}/phonemanager-reconnect-stm-main-export.xml
cp ${WORKSPACE}/dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/connection/stm/disconnect/export.xml                 ${DST_PATH}/phonemanager-connection-stm-disconnect-export.xml
cp ${WORKSPACE}/dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/connection/stm/command/export.xml                    ${DST_PATH}/phonemanager-connection-stm-command-export.xml
cp ${WORKSPACE}/dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/connection/stm/connect/export.xml                    ${DST_PATH}/phonemanager-connection-stm-connect-export.xml
cp ${WORKSPACE}/dev/src/phone/phonemanager/tsd-phonemanager/1/workspace/tsd.phonemanager/src/tsd/phonemanager/discovery/stm/export.xml                             ${DST_PATH}/phonemanager-discovery-stm-export.xml
cp ${WORKSPACE}/dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/state/stm/export.xml                       ${DST_PATH}/bt-management-state-stm-export.xml
cp ${WORKSPACE}/dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/remote/pairing/stm/export.xml              ${DST_PATH}/bt-management-remote-pairing-stm-export.xml
cp ${WORKSPACE}/dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/remote/discovery/stm/export.xml            ${DST_PATH}/bt-management-remote-discovery-stm-export.xml
cp ${WORKSPACE}/dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/remote/connect/stm/export.xml              ${DST_PATH}/bt-management-remote-connect-stm-export.xml
cp ${WORKSPACE}/dev/src/phone/bt-devicemanagement/tsd-bt-management/1/workspace/tsd.bt.management/src/tsd/bt/management/local/settings/configurationstm/export.xml ${DST_PATH}/bt-management-local-settings-configuration-stm-export.xml
