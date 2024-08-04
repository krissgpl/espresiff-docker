#!/bin/sh

PROJ=~/CProjects
ROOT=~/CProjects/root
FIRM=/media/QNAP/ESP_Firmware
[ -e $PROJ ] || mkdir -p $PROJ
cd $PROJ
[ ! -e ./supla-espressif-esp ] && git clone https://github.com/krissgpl/supla-espressif-esp
docker rm devel-esp8266
docker run --name devel-esp8266 -v "$PROJ":/CProjects -v "$ROOT":/root "$FIRM":/ESP_Firmware -it devel/esp8266 /bin/bash
