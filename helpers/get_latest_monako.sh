#!/bin/bash

# Fetches and unpacks the latest monako release

get_latest_release() {
  curl --silent "https://api.github.com/repos/snipem/monako/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/' |
    sed 's/^v//g'
}

latest_release=$(get_latest_release)

curl "https://github.com/snipem/monako/releases/download/v${latest_release}/monako_${latest_release}_linux_amd64.tar.gz" -o monako.tar.gz
tar xvf "monako.tar.gz"
chmod +x monako