#!/bin/sh

PROJ=~/CProjects
ROOT=~/CProjects/root
FIRM=/media/QNAP/ESP_Firmware
[ -e $PROJ ] || mkdir -p $PROJ
cd $PROJ
[ ! -e ./supla-espressif-esp ] && git clone https://github.com/krissgpl/supla-espressif-esp

#if docker container ls -a | grep -q devel-esp8266
#then 
#    echo "Running - devel-esp8266!"
#	docker rm devel-esp8266
#fi

if docker inspect "/devel-esp8266" > /dev/null 2>&1; then
    echo "The container devel-8266 exists."
fi

if [ ! "$(docker ps -a -q -f name=devel/esp8266)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=devel/esp8266)" ]; then
        # cleanup
		echo "Running - devel-esp8266!"
        docker rm devel-esp8266
    fi
fi

docker run --name devel-esp8266 -v "$PROJ":/CProjects -v "$ROOT":/root -v "$FIRM":/ESP_Firmware -it devel/esp8266 /bin/bash
