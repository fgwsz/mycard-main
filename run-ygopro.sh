#!/bin/bash

mycard_ygopro_dir_path=~/.config/MyCardLibrary/ygopro
if [ ! -e "$mycard_ygopro_dir_path" ]; then
    echo "Please install mycard ygopro!"
    exit 1
fi
cd "$mycard_ygopro_dir_path"
./ygopro
