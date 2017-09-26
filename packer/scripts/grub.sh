#!/bin/bash

ln -s /dev/null /etc/systemd/network/99-default.link
echo 'GRUB_TIMEOUT=5'
echo 'GRUB_CMDLINE_LINUX_DEFAULT=""' >> /etc/default/grub
echo 'GRUB_CMDLINE_LINUX="net.ifnames=0 console=tty1 console=ttyS0"' >> /etc/default/grub
update-grub2
