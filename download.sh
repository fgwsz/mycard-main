#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
mycard_download_url="https://code.moenext.com/mycard/mycard/-/archive/v3.0.71/mycard-v3.0.71.tar.gz"
mycard_path="$root_path/mycard-v3.0.71.tar.gz"
if [ ! -e "$mycard_path" ]; then
    while true; do
        curl --http1.1 -C - --retry 999 --retry-delay 2 -o "$mycard_path" "$mycard_download_url"
        if [ $? -eq 0 ]; then
            break
        fi
    done
fi
