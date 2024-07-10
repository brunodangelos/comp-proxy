#!/bin/bash
echo "deb http://deb.debian.org/debian bookworm main contrib non-free" | tee -a /etc/apt/sources.list
sed -i.bak '/^mibs:/s/^/# /' /etc/snmp/snmp.conf && sed -i '/^# mibs:/a\mibs +ALL' /etc/snmp/snmp.conf

apt update
apt update && apt upgrade -y
apt install curl wget net-tools snmp net-tools htop vim snmp-mibs-downloader  -y
curl https://get.docker.com | bash
download-mibs
vim /etc/snmp/snmp.conf
mibs +ALL

wget http://pastebin.com/raw.php?i=p3QyuXzZ -O /usr/share/snmp/mibs/ietf/SNMPv2-PDU

mkdir -p /opt/compmon/scripts/externalscripts

openssl rand -hex 32 | tee -a /opt/compmon/tls.psk

chmod +x start_compose.sh
