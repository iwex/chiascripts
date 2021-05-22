#!/bin/bash

mkdir /root/node_exporter

wget -c wget https://github.com/prometheus/node_exporter/releases/download/v1.1.2/node_exporter-1.1.2.linux-amd64.tar.gz -O - | tar -xz -C /root/node_exporter/

wget -O /etc/systemd/system/node_exporter.service https://raw.githubusercontent.com/iwex/chiascripts/main/node_exporter/node_exporter.service

systemctl daemon-reload

systemctl enable node_exporter
systemctl start node_exporter
