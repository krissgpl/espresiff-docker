#!/bin/sh

PROJ=~/CProjects
[ -e $PROJ ] || mkdir -p $PROJ
cd $PROJ
[ ! -e ./supla-espressif-esp ] && git clone https://github.com/krissgpl/supla-espressif-esp
docker run --name devel/esp8266 -v "$PROJ":/CProjects -it devel/esp8266 /bin/bash
