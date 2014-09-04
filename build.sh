#!/bin/sh
# Dependencies
apt-get update
apt-get install -y gcc g++ autoconf libtool libboost-all-dev pkg-config make
dpkg -i libdb4.8_4.8.24-1ubuntu1_i386.deb
dpkg -i libdb4.8-dev_4.8.24-1ubuntu1_i386.deb
dpkg -i libdb4.8++_4.8.24-1ubuntu1_i386.deb
dpkg -i libdb4.8++-dev_4.8.24-1ubuntu1_i386.deb

cd /root
rm -rf bitcoin
git clone https://github.com/bitcoin/bitcoin.git
cd /root/bitcoin
./autogen.sh
./configure
make

