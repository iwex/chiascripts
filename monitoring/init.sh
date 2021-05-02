#!/bin/bash

git clone https://github.com/ytx1991/ChiaMonitor.git /root/ChiaMonitor
rm /root/ChiaMonitor/mtail

wget -c https://github.com/google/mtail/releases/download/v3.0.0-rc45/mtail_3.0.0-rc45_Linux_x86_64.tar.gz -O - | tar -xz -C /root/ChiaMonitor/

wget -O /etc/systemd/system/watch-farmer.service https://raw.githubusercontent.com/iwex/chiascripts/monitoring/watch-farmer.service
wget -O /etc/systemd/system/watch-farmer.timer https://raw.githubusercontent.com/iwex/chiascripts/monitoring/watch-farmer.timer
wget -O /etc/systemd/system/mtail.service https://raw.githubusercontent.com/iwex/chiascripts/monitoring/mtail.service

wget -O /root/watch-farmer.sh https://raw.githubusercontent.com/iwex/chiascripts/monitoring/watch-farmer.sh
chmod +x /root/watch-farmer.sh

systemctl daemon-reload

systemctl enable watch-farmer
systemctl enable watch-farmer.timer
systemctl enable mtail

systemctl start watch-farmer.timer
systemctl start mtail
