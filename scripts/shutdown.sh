#!/bin/bash

#sudo echo "pre-up sleep 2" >> /etc/network/interfaces
if [ -e ~/shutdown.sh ]; then
  sudo sync;
  sudo bash ~/shutdown.sh
else
  sudo shutdown -P now;
fi
exit
