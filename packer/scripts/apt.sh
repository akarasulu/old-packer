#!/bin/bash

echo Updating from repositories ...
sudo apt-get -y update

echo Upgrading distribution ...
sudo apt-get -y dist-upgrade

echo Adding needed packages ...
if [ "$DISTRIBUTION" == "debian" ]; then
  sudo apt-get install net-tools snapd
elif [ "$DISTRIBUTION" == "ubuntu" ]; then
  sudo apt-get install net-tools
fi
