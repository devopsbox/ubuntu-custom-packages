#!/usr/bin/env bash

release_version='1.0.23'

apt-get install -y build-essential
apt-get install -y texinfo
apt-get install -y zlibc zlib1g zlib1g-dev
apt-get install -y liblzo2-dev
apt-get install -y libssl-dev


cd /tmp

git clone https://github.com/gsliepen/tinc.git
cd tinc
git co release-$release_version
autoreconf -fsi
./configure --prefix=
make
make install
