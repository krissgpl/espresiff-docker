FROM debian:bullseye

RUN apt-get update 
RUN apt-get -y install git nano wget build-essential python mc dialog
RUN wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
RUN python get-pip.py
RUN pip install esptool
RUN mkdir /hdd2
RUN if uname -m | grep x86_64; then \
      cd /hdd2 && \ 
      wget https://www.acsoftware.pl/files/Espressif_x64-docker.tgz && \
      tar zxvf Espressif_x64-docker.tgz && \
      rm Espressif_x64-docker.tgz && \
      cd / && \ 
      wget https://www.acsoftware.pl/files/supla-esp-signtool.tgz && \
      tar zxvf supla-esp-signtool.tgz && \
      cp -r supla-esp-signtool/* / && \
      rm -r supla-esp-signtool*; \
    else \
      cd /hdd2 && \
      wget https://www.acsoftware.pl/files/Espressif_x86-docker.tgz && \
      tar zxvf Espressif_x86-docker.tgz && \
      rm Espressif_x86-docker.tgz; \
    fi

COPY clone.sh /usr/sbin/
RUN chmod +x /usr/sbin/clone.sh
RUN git config --global --add safe.directory /CProjects/supla-espressif-esp

WORKDIR /CProjects/supla-espressif-esp/src
