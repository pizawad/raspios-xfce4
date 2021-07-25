ARG BASE_CONTAINER=pzawad/raspios-lite
FROM $BASE_CONTAINER

ARG DISPLAY=${DISPLAY:-":0.0"}
ENV DISPLAY=${DISPLAY}

ENV USER=${USER:-pi}

ENV USER_NAME=${USER}
ENV HOME=/home/${USER}
ENV WORKDIR=/home/${USER}

ENV DEBIAN_FRONTEND noninteractive
ENV USER_ID=${USER_ID:-1000}
ENV GROUP_ID=${GROUP_ID:-1000}

ENV DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
ENV unix:runtime=yes

USER root

RUN mkdir -p /host/run/dbus/system_bus_socket && chmod -R 0777 /host/run/dbus/system_bus_socket

RUN apt-get update && apt-get  install -y xfce4 && apt-get clean

USER ${USER}
WORKDIR ${HOME}

CMD ["/bin/bash"]

MAINTAINER Piotr ZAWADZKI "pzawadzki@polsl.pl"

