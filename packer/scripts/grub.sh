#!/bin/bash

ln -s /dev/null /etc/systemd/network/99-default.link
echo 'GRUB_CMDLINE_LINUX="net.ifnames=0"' >>/etc/default/grub
update-grub2
