#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
# install curl node npm python3 build-essential git libssl-dev
sudo apt update
sudo apt install curl
sudo apt -y install python3 build-essential git
sudo apt-get install libssl-dev
# 下面的18指的是nodejs的大版本号,填入你需要的最新版版号即可
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
sudo apt-get install nodejs
# install cnpm
sudo npm config set registry https://registry.npmmirror.com
sudo npm install -g cnpm --registry=https://registry.npmmirror.com
# download mycard v3
mycard_download_url="https://code.mycard.moe/mycard/mycard/-/archive/v3/mycard-v3.tar.gz"
mycard_path="$root_path/mycard-v3.tar.gz"
curl -C - -o "$mycard_path" "$mycard_download_url"
cd "$root_path"
mkdir mycard
tar -zxvf mycard-v3.tar.gz -C mycard/
# for mycard v3
sudo apt update
sudo apt -y install python3 build-essential git
cd "$root_path/mycard/mycard-v3"
sudo cnpm ci -f --openssl_fips=''
sudo cp "$root_path/package.json" "$root_path/mycard/mycard-v3/package.json"
sudo cnpm run dist --openssl_fips=''
