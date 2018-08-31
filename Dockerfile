FROM debian:stretch

MAINTAINER Patrick Wu <wotingwu@live.com>

RUN dpkg --add-architecture i386
RUN apt -y update
RUN apt -y install git-core build-essential wget

ADD src/winehd.list /etc/apt/sources.list.d/

RUN wget -nc https://dl.winehq.org/wine-builds/Release.key \
      && apt-key add Release.key \
      && rm Release.key

RUN apt -y update
RUN apt -y install --install-recommends winehq-stable
