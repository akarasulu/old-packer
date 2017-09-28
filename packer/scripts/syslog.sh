#!/bin/bash

cat >> /etc/rsyslog.conf <<-EOF
kern.*;\
kern.=crit;\
kern.=err;\
kern.=alert;\
kern.=emerg;\
kern.=panic; /dev/ttyS0

kern.*;\
kern.=crit;\
kern.=err;\
kern.=alert;\
kern.=emerg;\
kern.=panic; /dev/ttyS0


daemon,mail.*;\
news.=crit;news.=err;news.=notice;\
*.=debug;*.=info;\
*.=notice;*.=warning /dev/ttyS0

EOF

systemctl restart syslog.service

# Console slows down because of video framebuffer, this speeds up
cat >> /etc/modprobe.d/aliases <<-EOF
alias vesafb off
alias vga16fb off
alias vgastate off
alias softcursor off
alias cfbimgblt off
alias cfbfillrect off
alias cfbcopyarea off
alias fbcon off
alias tileblit off
alias font off
alias bitblit off

EOF

cat >> /etc/modprobe.d/blacklist-framebuffer.conf <<-EOF
blacklist vga16fb

EOF

dpkg-reconfigure linux-image-`uname -r`
echo 'GRUB_CMDLINE_LINUX="net.ifnames=0 console=tty1 console=ttyS0"' >> /etc/default/grub
update-grub2
