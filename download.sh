#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
mycard_download_url="https://code.mycard.moe/mycard/mycard/-/archive/v3/mycard-v3.tar.gz"
mycard_path="$root_path/mycard-v3.tar.gz"
if [ ! -e "$mycard_path" ]; then
    while true; do
        curl -C - -o "$mycard_path" "$mycard_download_url"
        if [ $? -eq 0 ]; then
            break
        fi
        if [[ -e "$mycard_path" ]]; then
            rm -rf "$mycard_path"
        fi
    done
fi
