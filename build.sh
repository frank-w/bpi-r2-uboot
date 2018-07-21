#!/bin/bash

TARGET_PRODUCT="bpi-r2"
BOARD=BPI-R2-720P
board="bpi-r2"
BPISOC=mtk

#./configure $BOARD

#if [ -f env.sh ] ; then
#	. env.sh
#fi

#make u-boot

CROSS_COMPILE=arm-linux-gnueabihf-
U_CROSS_COMPILE=$CROSS_COMPILE
J=$(grep ^processor /proc/cpuinfo  | wc -l )

U_O_PATH=
U_CONFIG_H=include/config.h
UBOOT_CONFIG=mt7623_evb_config

logfile="$(dirname $0)/build.log"
exec 3> >(tee $logfile)
ret=1

make $UBOOT_CONFIG CROSS_COMPILE=$U_CROSS_COMPILE -j$J 2>&3 &&
make CROSS_COMPILE=$U_CROSS_COMPILE -j$J 2>&3 && ret=0
exec 3>&-
if [ "$ret" -eq "0" ];
then
  echo -e "\033[32m Build success!\033[0m"
else
  echo -e "\033[31m Build failed!\033[0m"
fi
