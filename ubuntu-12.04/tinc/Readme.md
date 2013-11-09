## Tinc:

apt-get install -y build-essential
apt-get install -y texinfo
apt-get install -y zlibc zlib1g zlib1g-dev
apt-get install -y liblzo2-dev
apt-get install -y libssl-dev


git clone https://github.com/gsliepen/tinc.git
cd tinc
autoreconf -fsi
./configure --prefix=
make
make install
