#!/bin/bash

sudo apt update
sudo apt install curl
sudo apt -y install python3 build-essential git
sudo apt-get install libssl-dev
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
sudo apt-get install nodejs
sudo npm config set registry https://registry.npmmirror.com
sudo npm install -g cnpm --registry=https://registry.npmmirror.com
