#!/usr/bin/env bash

set -ex
set -o pipefail

if ! command -v curl &> /dev/null; then
	echo >&2 'error: "curl" not found!'
	exit 1
fi

if ! command -v tar &> /dev/null; then
	echo >&2 'error: "tar" not found!'
	exit 1
fi

GOLANG_PACKAGE=go1.19.linux-amd64
cd /opt

url=https://mirrors.ustc.edu.cn/golang/${GOLANG_PACKAGE}.tar.gz
echo "Downloading $url"
curl -# -LO $url


tar -xzvf "${GOLANG_PACKAGE}.tar.gz"
rm -f "${GOLANG_PACKAGE}.tar.gz"


