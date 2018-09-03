FROM debian:stretch

# Add distinguish file to check
ADD src/fake-wsl-release /etc/

# Install prerequisites
RUN dpkg --add-architecture i386
RUN apt-get -y update
RUN apt-get -y install git-core wget curl apt-transport-https gnupg

# Install wine & Powershell Core
ADD src/*.list /etc/apt/sources.list.d/

RUN curl https://dl.winehq.org/wine-builds/Release.key | apt-key add - \
      && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN apt-get -y update
RUN apt-get -y install powershell
RUN apt-get -y install --install-recommends winehq-stable

# Add execuables
ADD src/*.exe /usr/bin/
RUN chmod 755 /usr/bin/*.exe

# inital for the first time
RUN wine cmd.exe /c ver