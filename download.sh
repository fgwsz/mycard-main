#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
mycard_download_url="https://code.moenext.com/mycard/mycard/-/archive/v3.0.71/mycard-v3.0.71.tar.gz"
mycard_path="$root_path/mycard-v3.0.71.tar.gz"
mycard_remote_size=$(curl -sI "$mycard_download_url" | grep -i Content-Length | awk '{print $2}' | tr -d '\r')
download_flag=false
#check remote mycard size
if [ -z "$mycard_remote_size" ]; then
    download_flag=true
    echo "Unable to retrieve the size of the remote mycard file."
fi
mycard_remote_size=${mycard_remote_size% }
if [ -f "$mycard_path" ]; then
    mycard_size=$(stat -c%s "$mycard_path")
else
    download_flag=true
    echo "mycard file does not exist."
fi
if [ "$mycard_remote_size" -eq "$mycard_size" ]; then
    download_flag=false
    echo "mycard is up to date."
else
    download_flag=true
    echo "mycard has updates available."
fi
#download & update mycard
if [ $download_flag = true ]; then
    if [[ -e "$mycard_path" ]]; then
        rm -rf "$mycard_path"
    fi
    while true; do
        curl --http1.1 -L -C - --retry 999 --retry-delay 2 -o "$mycard_path" "$mycard_download_url"
        if [ $? -eq 0 ]; then
            break
        fi
    done
fi
