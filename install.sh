#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y

sudo sed -i 's/raspberrypi/homebridge/g' /etc/hostname
sudo sed -i 's/raspberrypi/homebridge/g' /etc/hosts
sudo chpasswd <<< "pi:QY32SFyTQfaHDTKd"

curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash -
sudo apt-get install -y nodejs libavahi-compat-libdnssd-dev
mkdir ~/.homebridge && cp config.json ~/.homebridge

sudo npm i -g --unsafe-perm homebridge homebridge-config-ui-x
sudo npm i -g install homebridge-ewelink-max

sudo cp homebridge.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable homebridge
sudo systemctl start homebridge
