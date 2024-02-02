#!/bin/bash

set -ex

if [[ -z "${NINJA_VERSION}" ]]; then
  echo >&2 'error: NINJA_VERSION env. variable must be set to a non-empty value'
  exit 1
fi

cd /usr/src
tar xvzf /imagefiles/ninja-${NINJA_VERSION}.tar.gz -C .

pushd ninja-${NINJA_VERSION}
mkdir build && cd build && cmake .. && make && make install
popd

rm -rf "ninja-${NINJA_VERSION}"