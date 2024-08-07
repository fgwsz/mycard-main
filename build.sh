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
if [ ! -d "$mycard_path" ]; then
    curl -C - -o "$mycard_path" "$mycard_download_url"
fi
mycard_dir_path="$root_path/mycard"
if [ ! -d "$mycard_dir_path" ]; then
    mkdir -p "$mycard_dir_path"
fi
tar -zxvf "$mycard_path" -C "$mycard_dir_path/"
# for mycard v3
sudo apt update
sudo apt -y install python3 build-essential git
cd "$root_path/mycard/mycard-v3"
sudo cnpm install --save electron@4.2.12
sudo cnpm ci -f --openssl_fips=''
sudo cp "$root_path/package.json" "$root_path/mycard/mycard-v3/package.json"
sudo cnpm run dist --openssl_fips=''
