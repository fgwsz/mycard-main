#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
mycard_download_url="https://code.moenext.com/mycard/mycard/-/archive/v3.0.73/mycard-v3.0.73.tar.gz"
mycard_path="$root_path/mycard.tar.gz"
mycard_remote_size=$(curl -sIL "$mycard_download_url" | grep -i "Content-Length" | tail -1 | awk '{print $2}' | tr -d '\r')
download_flag=false
#check remote mycard size
while true; do
    if [ -z "$mycard_remote_size" ]; then
        download_flag=true
        echo "Unable to retrieve the size of the remote mycard file."
        break
    fi
    mycard_remote_size=${mycard_remote_size% }
    if [ -f "$mycard_path" ]; then
        mycard_size=$(stat -c%s "$mycard_path")
    else
        download_flag=true
        echo "mycard file does not exist."
        break
    fi
    if [ "$mycard_remote_size" -eq "$mycard_size" ]; then
        download_flag=false
        echo "mycard is up to date."
        break
    else
        download_flag=true
        echo "mycard has updates available."
        break
    fi
done
#download & update mycard
if [ $download_flag = true ]; then
    while true; do
        if [[ -e "$mycard_path" ]]; then
            rm -rf "$mycard_path"
        fi
        axel -o "$mycard_path" "$mycard_download_url"
        if [ $? -eq 0 ]; then
            break
        fi
    done
fi
