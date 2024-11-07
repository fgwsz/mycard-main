#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
mycard_path="$root_path/mycard/mycard-v3.0.71/dist/MyCard-3.0.71.AppImage"
if [ ! -e "$mycard_path" ]; then
    "$root_path/build.sh"
fi
"$mycard_path"
