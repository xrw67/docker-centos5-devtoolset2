#!/usr/bin/env bash

set -ex
set -o pipefail

cd /opt

git clone https://github.com/microsoft/vcpkg.git && \
	cd vcpkg && \
	./bootstrap-vcpkg.sh -musl
