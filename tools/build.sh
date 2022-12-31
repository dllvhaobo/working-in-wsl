#!/bin/bash
set -x
# CONFIG_JNN=1 bob dev  -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
# CONFIG_JNN=1 bob dev  -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target
# CONFIG_JNN=1 bob dev -v -b -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::bt-phone::tsd-bt-phone-mib3-target
CONFIG_JNN=1 bob dev -v -b -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/phone::phonemanager::tsd-phonemanager-target
# CONFIG_JNN=1 bob dev -b  -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/media::mediaapplication::tsd-media-mib3-target
# CONFIG_JNN=1 bob dev  -b -DCONFIG_JNN=1 -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ei/ei-variant-37W-GP-VW_CHN/sal::tsd-sal-app-target
#
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
