#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
version=$(cat "$root_path/VERSION")
mycard_path="$root_path/mycard/mycard-v$version/dist/MyCard-$version.AppImage"
if [ ! -e "$mycard_path" ]; then
    "$root_path/build.sh"
fi
echo "MyCard Version $version"
"$mycard_path"
