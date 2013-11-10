#!/usr/bin/env bash

release_version='1.0.23'
destdir=/tmp/install-tinc-$release_version
apt-get install -y build-essential
apt-get install -y texinfo
apt-get install -y zlibc zlib1g zlib1g-dev
apt-get install -y liblzo2-dev
apt-get install -y libssl-dev


cd /var/tmp

if [ ! -d tinc ]; then
  git clone https://github.com/gsliepen/tinc.git
fi

cd tinc
git fetch
git checkout release-$release_version
autoreconf -fsi
make clean
./configure --prefix=
make
make install DESTDIR=$destdir


apt-get install ruby rubygems -y
gem1.8 install fpm --no-ri --no-rdoc

mkdir -p /vagrant/pkg
cd /vagrant/pkg

fpm -s dir -t deb -n tinc -v $release_version -C $destdir \
  -p tinc-VERSION_ARCH.deb \
  --force \
  -d "zlibc (>= 0.9)" \
  -d "zlib1g (>= 1:1.2.3.4)" \
  -d "libssl-dev (>= 1.0.1)" \
  -d "liblzo2-dev (>= 2.06-1)" \
  sbin share

rm -rf $destdir