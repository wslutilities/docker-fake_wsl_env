#!/usr/bin/env bash

git clone git://source.winehq.org/git/wine.git
cd wine
sudo apt update
sudo apt install build-essential
./configure
./make
