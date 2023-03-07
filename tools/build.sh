#!/bin/bash
set -x
#################################################################################
# Bluetooth & Phone
#################################################################################
# ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
# ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target
# ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target/basic-services::rsi-library::tsd-vw-rsi-viwi-server-dev/basic-services::rsi-library::tsd-rsi-server-dev/basic-services::systeminfo::tsd-systeminformation-features-dev
# ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target/basic-services::rsi-library::tsd-vw-rsi-viwi-server-dev/basic-services::rsi-library::tsd-rsi-server-dev/vehicle-connectivity::automotive-ethernet::tsd-aeth-data-api-mib3-dev/vehicle-connectivity::automotive-ethernet::tsd-aeth-data-api-dev
#
# ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
# ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target
modules="
ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target/phone::bt-middleware::tsd-blueware-mib3-bluego-dev/phone::bt-middleware::tsd-blueware-bluego-dev/phone::bt-middleware::ext-bluego-dev
"

OPT=$1
BOB_OPT=""
if [ -z $OPT ];then 
    echo "Option: checkout and build "
elif [ "$OPT"x == "checkoutx" ];then
    echo "Option: checkout only"
    BOB_OPT="-B"
elif [ "$OPT"x == "buildx" ];then
    echo "Option: build only"
    BOB_OPT="-b"
else
    echo "unkown option"
fi

for i in $modules
do
    CONFIG_JNN=1
    # Checkout and build
    CONFIG_JNN=1 bob dev -v $BOB_OPT -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 $i
done

# # Checkout and build
# CONFIG_JNN=1 bob dev  -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
# CONFIG_JNN=1 bob dev  -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target

# # Checkout Only
# CONFIG_JNN=1 bob dev -v -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
# CONFIG_JNN=1 bob dev -v -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target

# # Build Only
# CONFIG_JNN=1 bob dev -v -b -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
# CONFIG_JNN=1 bob dev -v -b -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target


#
#
#################################################################################
# Media
#################################################################################
# Checkout and build
# CONFIG_JNN=1 bob dev -vv -DCONFIG_JNN=1 ei/ei-variant-37W-GP-VW_CHN/media::mediaapplication::tsd-media-mib3-target
# Checkout Only
# CONFIG_JNN=1 bob dev -vv -B -DCONFIG_JNN=1 ei/ei-variant-37W-GP-VW_CHN/media::mediaapplication::tsd-media-mib3-target
# Build Only
# CONFIG_JNN=1 bob dev -vv -b -DCONFIG_JNN=1 ei/ei-variant-37W-GP-VW_CHN/media::mediaapplication::tsd-media-mib3-target




# CONFIG_JNN=1 bob dev -b -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/media::mediaapplication::tsd-media-mib3-target
# CONFIG_JNN=1 bob dev -b -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/sal::tsd-sal-app-target
# CONFIG_JNN=1 bob dev -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-devicemanagement::tsd-bt-management-mib3-target
# CONFIG_JNN=1 bob dev -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-devicemanagement::tsd-bt-management-mib3-target
# CONFIG_JNN=1 bob dev -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-handsfree::tsd-bt-handsfree-mib3-target
# CONFIG_JNN=1 bob dev -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-handsfree::tsd-bt-handsfree-target
# CONFIG_JNN=1 bob dev -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-mediacontroller::tsd-bt-media-mib3-target
# CONFIG_JNN=1 bob dev -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-messaging::tsd-bt-messaging-mib3-target
# CONFIG_JNN=1 bob dev -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-middleware::ext-bluego-target
# CONFIG_JNN=1 bob dev -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-middleware::tsd-blueware-bluego-target
# CONFIG_JNN=1 bob dev -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-middleware::tsd-blueware-mib3-bluego-target
# CONFIG_JNN=1 bob dev -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-organizer::tsd-organizer-mib3-target
# CONFIG_JNN=1 bob dev -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
# CONFIG_JNN=1 bob dev -B -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/toolchain::aarch64-linux-gnu

# CONFIG_JNN=1 bob dev  ls -v -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target
