#!/bin/sh

rm -f /etc/udev/rules.d/70-persistent-net.rules

cat > /etc/sysconfig/network-scripts/ifcfg-eth0 <<-EOF
DEVICE=eth0
BOOTPROTO=dhcp
ONBOOT=yes
EOF