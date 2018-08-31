FROM debian:stretch

MAINTAINER Patrick Wu <wotingwu@live.com>

# Add distinguish file to check
ADD src/fake-wsl-release /etc/

# Install prerequisites
RUN dpkg --add-architecture i386
RUN apt-get -y update
RUN apt-get -y install git-core wget apt-transport-https gnupg

# Install wine
ADD src/winehq.list /etc/apt/sources.list.d/

RUN wget -nc https://dl.winehq.org/wine-builds/Release.key \
      && apt-key add Release.key \
      && rm Release.key

RUN apt-get -y update
RUN apt-get -y install --install-recommends winehq-stable

# Add execuables
ADD src/*.exe /usr/bin/
RUN chmod 755 /usr/bin/*.exe