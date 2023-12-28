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

if [[ -z "${LCOV_VERSION}" ]]; then
  echo >&2 'error: LCOV_VERSION env. variable must be set to a non-empty value'
  exit 1
fi

(cat /etc/ld.so.conf.d/usr-local.conf 2> /dev/null | grep -q "^/usr/local/lib$") ||
  echo '/usr/local/lib' >> /etc/ld.so.conf.d/usr-local.conf
ldconfig

cd /usr/src

if [ -f /imagefiles/lcov-${LCOV_VERSION}.tar.gz ];then 
  ln -s /imagefiles/lcov-${LCOV_VERSION}.tar.gz lcov-${LCOV_VERSION}.tar.gz
else
  url="https://github.com/linux-test-project/lcov/releases/download/v${LCOV_VERSION}/lcov-${LCOV_VERSION}.tar.gz"
  echo "Downloading $url"
  curl --connect-timeout 20 \
      --max-time 10 \
      --retry 5 \
      --retry-delay 10 \
      --retry-max-time 40 \
      -# -LO $url
fi

tar xvzf "lcov-${LCOV_VERSION}.tar.gz" --no-same-owner
rm -f "lcov-${LCOV_VERSION}.tar.gz"

pushd "lcov-${LCOV_VERSION}"
make install
popd

ldconfig

rm -rf "lcov-${LCOV_VERSION}"

