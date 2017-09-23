#!/bin/bash

echo Updating from repositories ...
sudo apt-get -y update

echo Upgrading distribution ...
sudo apt-get -y dist-upgrade
