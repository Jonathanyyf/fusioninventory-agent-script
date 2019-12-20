#!/bin/bash
#
# Official documentation for Debian/Ubuntu
# http://fusioninventory.org/documentation/agent/installation/linux/deb.html
#

read -p "Enter path of your plugin (ex: https://server.domain.com/glpi/plugins/fusioninventory/): " SERVER

apt -y install dmidecode hwdata ucf hdparm perl libuniversal-require-perl libwww-perl libparse-edid-perl libproc-daemon-perl libfile-which-perl libhttp-daemon-perl libxml-treepp-perl libyaml-perl libnet-cups-perl libnet-ip-perl libdiges
wget https://github.com/fusioninventory/fusioninventory-agent/releases/download/2.5.1/fusioninventory-agent_2.5.1-1_all.deb -P /tmp/
dpkg -i /tmp/fusioninventory-agent_2.5.1-1_all.deb
sed -i "/#server = http:\/\/server.domain.com\/glpi\/plugins\/fusioninventory\//aserver = http:\/\/$SERVER\/glpi\/plugins\/fusioninventory/" /etc/fusioninventory/agent.cfg
systemctl restart fusioninventory-agent
fusioninventory-agent
