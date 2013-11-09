#!/bin/bash

echo "This script is targetted for Ubuntu 12.04 (64-bit), YMMV..."

version=2.0.0
patch=p247
rubyversion=$version-$patch
rubysrc=ruby-$rubyversion.tar.bz2
checksum=60913f3eec0c4071f44df42600be2604
destdir=/tmp/install-$rubyversion

sudo apt-get -y install libssl-dev libreadline-dev zlib1g-dev libyaml-dev libgdbm-dev libffi-dev libncurses5-dev libxml2-dev libxslt1-dev automake libtool libc6-dev


cd /var/tmp/
if [ ! -f $rubysrc ]; then
    wget -q http://ftp.ruby-lang.org/pub/ruby/$rubysrc
fi

if [ "$(md5sum $rubysrc | cut -b1-32)" != "$checksum" ]; then
  echo "Checksum mismatch!"
  exit 1
fi

echo "Unpacking $rubysrc"
tar -jxf $rubysrc
cd ruby-$rubyversion
./configure --prefix=/usr/local --disable-install-doc --enable-shared && make && make install DESTDIR=$destdir

cd ..


apt-get install ruby rubygems -y
gem1.8 install fpm --no-ri --no-rdoc

mkdir -p /vagrant/pkg
cd /vagrant/pkg

fpm -s dir -t deb -n ruby$version -v $rubyversion -C $destdir \
  -p ruby-VERSION_ARCH.deb -d "libstdc++6 (>= 4.4.3)" \
  -d "libc6 (>= 2.6)" -d "libffi6 (>= 3.0.10)" -d "libgdbm3 (>= 1.8.3)" \
  -d "libncurses5 (>= 5.7)" -d "libreadline6 (>= 6.1)" \
  -d "libssl1.0.0 (>= 1.0.1)" -d "zlib1g (>= 1:1.2.2)" \
  -d "libyaml-0-2 (>= 0.1.4-2)" \
  usr/local/bin usr/local/lib usr/local/share/man usr/local/include

rm -r $destdir


apt-get remove ruby rubygems -y
apt-get autoremove -y
dpkg -i ruby-2*.deb

## update the available executables available within one of the $PATH
hash -r

## and now we have ruby 2.0 working
ruby -ropenssl -rzlib -rreadline -ryaml -e "puts 'something'"
