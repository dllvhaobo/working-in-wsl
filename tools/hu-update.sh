#!/bin/sh
set -x
/sbin/mount-read-write.sh
SUFFIX=$(date +"%Y%m%d_%H%M")

mv /usr/bin/tsd.bt.phone.mib3 /usr/bin/tsd.bt.phone.mib3.${SUFFIX}
mv /usr/bin/tsd.phonemanager /usr/bin/tsd.phonemanager.${SUFFIX}

mv /home/root/tsd.bt.phone.mib3  /usr/bin
mv /home/root/tsd.phonemanager  /usr/bin

sync
