#!/bin/bash

apt update
apt upgrade -y
apt install git software-properties-common iotop htop -y

git clone https://github.com/Chia-Network/chia-blockchain.git --recurse-submodules /root/chia-blockchain
cd /root/chia-blockchain
chmod +x ./install.sh
sh install.sh
. ./activate
chia init
pip install --force-reinstall git+https://github.com/ericaltendorf/plotman@main
plotman config generate

cd /root
mkdir ca
wget -O /root/ca/chia_ca.crt https://raw.githubusercontent.com/iwex/chiascripts/main/ecopool/chia_ca.crt
wget -O /root/ca/chia_ca.key https://raw.githubusercontent.com/iwex/chiascripts/main/ecopool/chia_ca.key
wget -O /root/ca/private_ca.crt https://raw.githubusercontent.com/iwex/chiascripts/main/ecopool/private_ca.crt
wget -O /root/ca/private_ca.key https://raw.githubusercontent.com/iwex/chiascripts/main/ecopool/private_ca.key

chia init -c /root/ca

chia configure --enable-upnp false
chia configure --set-farmer-peer 136.243.104.155:8447
chia configure --set-log-level INFO

wget -O /root/chia-blockchain/venv/lib/python3.8/site-packages/chiapos.cpython-38-x86_64-linux-gnu.so https://raw.githubusercontent.com/iwex/chiascripts/main/ecopool/chiapos.cpython-38-x86_64-linux-gnu.so

wget -O /root/chia-blockchain/venv/lib64/python3.8/site-packages/chiapos.cpython-38-x86_64-linux-gnu.so https://raw.githubusercontent.com/iwex/chiascripts/main/ecopool/chiapos.cpython-38-x86_64-linux-gnu.so