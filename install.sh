#!/bin/bash

sudo apt update
# curl
sudo apt install curl
# axel
sudo apt install axel
# git python3
sudo apt -y install python3 build-essential git
# ssl
sudo apt-get install libssl-dev
# nodejs
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
sudo apt-get install nodejs
# npm
sudo npm config set registry https://registry.npmmirror.com
# cnpm
sudo npm install -g cnpm --registry=https://registry.npmmirror.com
# typescript
sudo npm install -g typescript
