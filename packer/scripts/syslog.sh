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
