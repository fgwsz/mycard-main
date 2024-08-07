#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
mycard_download_url="https://code.mycard.moe/mycard/mycard/-/archive/v3/mycard-v3.tar.gz"
mycard_path="$root_path/mycard-v3.tar.gz"
if [ ! -e "$mycard_path" ]; then
    curl -C - -o "$mycard_path" "$mycard_download_url"
fi
