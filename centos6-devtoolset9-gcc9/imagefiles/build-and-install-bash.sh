#!/usr/bin/env bash

set -ex

if ! command -v curl &> /dev/null; then
	echo >&2 'error: "curl" not found!'
	exit 1
fi

if ! command -v tar &> /dev/null; then
	echo >&2 'error: "tar" not found!'
	exit 1
fi

if [[ -z "${NEW_BASH_VERSION}" ]]; then
  echo >&2 'error: NEW_BASH_VERSION env. variable must be set to a non-empty value'
  exit 1
fi

(cat /etc/ld.so.conf.d/usr-local.conf 2> /dev/null | grep -q "^/usr/local/lib$") ||
  echo '/usr/local/lib' >> /etc/ld.so.conf.d/usr-local.conf
ldconfig

cd /usr/src

if [ -f /imagefiles/bash-${NEW_BASH_VERSION}.tar.gz ]; then
  ln -s /imagefiles/bash-${NEW_BASH_VERSION}.tar.gz bash-${NEW_BASH_VERSION}.tar.gz
else
  url="https://mirrors.ustc.edu.cn/gnu/bash/bash-${NEW_BASH_VERSION}.tar.gz"
  echo "Downloading $url"
  curl --connect-timeout 20 \
      --max-time 10 \
      --retry 5 \
      --retry-delay 10 \
      --retry-max-time 40 \
      -# -LO $url
fi

tar xvzf "bash-${NEW_BASH_VERSION}.tar.gz" --no-same-owner
rm -f "bash-${NEW_BASH_VERSION}.tar.gz"

pushd "bash-${NEW_BASH_VERSION}"
./configure --prefix=/usr/local --bindir=/bin
make -j"$(nproc)"
make install
popd

ldconfig

rm -rf "bash-${NEW_BASH_VERSION}"

