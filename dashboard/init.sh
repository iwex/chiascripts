#!/bin/bash

wget -O /etc/systemd/system/dashboard.service https://raw.githubusercontent.com/iwex/chiascripts/main/dashboard/dashboard.service
systemctl daemon-reload
systemctl enable node_exporter
systemctl start node_exporter
