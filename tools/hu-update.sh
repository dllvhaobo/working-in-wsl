#!/bin/sh
set -x
/sbin/mount-read-write.sh
SUFFIX=$(date +"%Y%m%d_%H%M")

# mv /usr/bin/tsd.bt.phone.mib3 /usr/bin/tsd.bt.phone.mib3.${SUFFIX}
# mv /usr/bin/tsd.phonemanager /usr/bin/tsd.phonemanager.${SUFFIX}

[ ! -f /usr/bin/tsd.bt.phone.mib3.org ] && cp /usr/bin/tsd.bt.phone.mib3 /usr/bin/tsd.bt.phone.mib3.org
[ ! -f /usr/bin/tsd.phonemanager.org ] && cp /usr/bin/tsd.phonemanager /usr/bin/tsd.phonemanager.org

systemctl mask watchdog-reboot.service
cp /home/root/tsd.bt.phone.mib3  /usr/bin/
cp /home/root/tsd.phonemanager  /usr/bin/
# cp /home/root/tsd.media.mib3.app.target /usr/bin/

sync
