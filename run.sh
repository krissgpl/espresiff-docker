#!/bin/sh

PROJ=~/CProjects
ROOT=~/CProjects/root
[ -e $PROJ ] || mkdir -p $PROJ
cd $PROJ
[ ! -e ./supla-espressif-esp ] && git clone https://github.com/krissgpl/supla-espressif-esp
docker rm devel-esp8266
docker run --name devel-esp8266 -v "$PROJ":/CProjects -v "$ROOT":/root -it devel/esp8266 /bin/bash
