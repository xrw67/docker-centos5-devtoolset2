#!/usr/bin/env bash

set -ex

OPENSSL_ROOT=openssl-1.1.1w
tar xvzf "/imagefiles/${OPENSSL_ROOT}.tar.gz" -C .

pushd "${OPENSSL_ROOT}"
./config --prefix=/opt/openssl
make -j"$(nproc)"
make install
popd

mv /usr/bin/openssl /usr/bin/openssl.old
mv /usr/lib64/openssl /usr/lib64/openssl.old
mv /usr/lib64/libssl.so /usr/lib64/libssl.so.old

ln -s /opt/openssl/bin/openssl /usr/bin/openssl
ln -s /opt/openssl/include/openssl /usr/include/openssl
ln -s /opt/openssl/lib/libssl.so /usr/lib64/libssl.so
# ln -s /opt/openssl/lib/libssl.so.1.1 /usr/lib/libssl.so.1.1

echo "/opt/openssl/lib" >> /etc/ld.so.conf
ldconfig

rm -rf "${OPENSSL_ROOT}"
