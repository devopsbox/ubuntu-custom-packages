#!/usr/bin/env bash


release_version='2.8.0-rc6'
destdir=/tmp/install-redis-$release_version
apt-get install -y build-essential


cd /var/tmp
if [ ! -d redis ]; then
  git clone https://github.com/antirez/redis.git
fi


cd redis
git fetch
git checkout $release_version
make
make PREFIX=$destdir install


apt-get install ruby rubygems -y
gem1.8 install fpm --no-ri --no-rdoc

mkdir -p /vagrant/pkg
cd /vagrant/pkg

fpm -s dir -t deb -n redis -v $release_version -C $destdir \
  -p redis-VERSION.ubuntu.12.04_ARCH.deb \
  --force \
  bin

rm -rf $destdir
