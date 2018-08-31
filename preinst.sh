#!/usr/bin/env bash

dpkg --add-architecture i386
apt -y update
apt -y install git-core build-essential

wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
rm Release.key

