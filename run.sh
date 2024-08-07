#!/bin/bash

root_path=$(dirname "$(readlink -f "$0")")
"$root_path/mycard/mycard-v3/dist/MyCard-3.0.70.AppImage"
