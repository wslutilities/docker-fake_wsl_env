FROM debian:stretch

# Add distinguish file to check
ADD src/fake-wsl-release /etc/

# Install prerequisites
RUN dpkg --add-architecture i386 \
      && apt-get -y update \
      && apt-get -y install apt-utils \
      && apt-get -y install git-core wget curl apt-transport-https gnupg rclone

# Install wine & Powershell Core
ADD src/*.list /etc/apt/sources.list.d/

RUN curl https://dl.winehq.org/wine-builds/winehq.key | apt-key add - \
      && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -

RUN apt-get -y update \
      && apt-get -y install powershell \
      && apt-get -y install --install-recommends winehq-stable

# Add execuables
ADD src/*.exe /usr/bin/
RUN chmod 755 /usr/bin/*.exe

# inital wine for the first time
RUN wine cmd.exe /c ver

# mount wine drive_c under /mnt/c/
RUN rclone sync /root/.wine/drive_c/ /mnt/c/
