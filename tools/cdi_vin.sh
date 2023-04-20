#!/bin/bash
adb shell getprop persist.vehicle.hardware.vin.code
adb remount
adb shell setprop persist.vehicle.hardware.vin.code LFV2B20L3M4999999
adb shell getprop persist.vehicle.hardware.vin.code
