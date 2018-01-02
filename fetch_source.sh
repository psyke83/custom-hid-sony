#!/bin/bash
rpi_ver="raspberrypi-kernel_$(dpkg -s raspberrypi-kernel | grep '^Version:' | awk '{print $2}')"

# fetch latest driver blobs
wget https://raw.githubusercontent.com/raspberrypi/linux/"$rpi_ver"/drivers/hid/hid-sony.c -O hid-sony.c
wget https://raw.githubusercontent.com/raspberrypi/linux/"$rpi_ver"/drivers/hid/hid-ids.h -O hid-ids.h

# apply Shanwan patch
wget https://github.com/raspberrypi/linux/commit/492ca83c3d19fba1622164f07cd7b775596a7db2.patch -O 0001-sony-shanwan.diff
patch -p3 <0001-sony-shanwan.diff
