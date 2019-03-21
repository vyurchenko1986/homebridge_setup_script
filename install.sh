#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y &&
sudo apt-get install gcc g++ make &&


sudo sed -i 's/raspberrypi/homebridge/g' /etc/hostname &&
sudo sed -i 's/raspberrypi/homebridge/g' /etc/hosts &&
sudo chpasswd <<< "pi:QY32SFyTQfaHDTKd" &&

curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - &&
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list &&
sudo apt-get update && sudo apt-get install yarn &&

curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash - &&
sudo apt-get install -y nodejs libavahi-compat-libdnssd-dev &&
mkdir ~/.homebridge && cp config.json ~/.homebridge &&

sudo npm i -g --unsafe-perm homebridge homebridge-config-ui-x &&
sudo npm i -g install homebridge-ewelink-max &&
sudo npm i -g install pm2 &&

pm2 start homebridge &&
pm2 startup &&

sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u pi --hp /home/pi &&
pm2 save &&
sudo reboot
