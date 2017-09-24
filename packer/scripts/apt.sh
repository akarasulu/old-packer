#!/bin/bash

echo Updating from repositories ...
sudo apt-get -y update

echo Upgrading distribution ...
sudo apt-get -y dist-upgrade

set -e

echo Adding needed packages ...
if [ "debian" = "$DISTRIBUTION" ]; then
  sudo apt-get -y install net-tools snapd
elif [ "ubuntu" = "$DISTRIBUTION" ]; then
  sudo apt-get -y install net-tools
fi
