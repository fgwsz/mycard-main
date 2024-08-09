#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
mycard_file_path="$root_path/mycard-v3.tar.gz"
if [ ! -e "$mycard_file_path" ]; then
    "$root_path/download.sh"
fi
mycard_root_path="$root_path/mycard"
if [ ! -e "$mycard_root_path" ]; then
    mkdir "$mycard_root_path"
    tar -zxvf "$mycard_file_path" -C "$mycard_root_path/"
fi
mycard_dir_path="$mycard_root_path/mycard-v3"
cd "$mycard_dir_path"
sudo cnpm install --save electron@4.2.12
sudo cnpm ci -f --openssl_fips=''
sudo cp "$root_path/package.json" "$mycard_dir_path/package.json"
sudo cnpm run dist --openssl_fips=''
