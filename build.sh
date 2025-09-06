#!/bin/bash
root_path=$(dirname "$(readlink -f "$0")")
version=$(cat "$root_path/VERSION")
mycard_file_path="$root_path/mycard.tar.gz"
mycard_root_path="$root_path/mycard"
mycard_dir_path="$mycard_root_path/mycard-v$version"

echo "下载 mycard.tar.gz..."
"$root_path/download.sh"
if [ ! -e "$mycard_root_path" ]; then
    echo "创建 mycard 目录..."
    mkdir "$mycard_root_path"
fi
if [ ! -e "$mycard_dir_path" ]; then
    echo "创建 mycard-v{...} 目录..."
    mkdir "$mycard_dir_path"
fi
echo "解压 mycard.tar.gz..."
if tar -zxvf "$mycard_file_path" -C "$mycard_root_path/"; then
    echo "解压成功"
else
    echo "解压失败" >&2
    exit 1
fi
cd "$mycard_dir_path"
echo "安装 Electron..."
sudo cnpm install --save electron@4.2.12
echo "执行 cnpm ci..."
sudo cnpm ci -f --openssl_fips=''
echo "构建项目..."
sudo cnpm run dist --openssl_fips=''
echo "复制 package.json..."
# 删除 electron 依赖行
sed -i -E '/^[[:space:]]*"electron":.*,/d' "$mycard_dir_path/package.json"
echo "重新构建项目..."
sudo cnpm run dist --openssl_fips=''
echo "构建项目完成"
