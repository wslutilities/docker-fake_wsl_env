FROM debian:stretch

MAINTAINER Patrick Wu <wotingwu@live.com>

ADD src/fake-wsl-release /etc/

RUN dpkg --add-architecture i386
RUN apt-get -y update
RUN apt-get -y install git-core build-essential wget

ADD winehq.list /etc/apt/sources.list.d/

RUN wget -nc https://dl.winehq.org/wine-builds/Release.key \
      && apt-key add Release.key \
      && rm Release.key

RUN apt-get -y update
RUN apt-get -y install --install-recommends winehq-stable