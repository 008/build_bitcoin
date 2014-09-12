#!/bin/sh
# Needs root
if [ `id -u` != 0 ] ; then
	echo "Need root!"
	exit
fi

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# Dependencies
apt-get update || exit
apt-get install -y gcc g++ autoconf libtool libboost-all-dev pkg-config make libminiupnpc-dev || exit
# Can't find libdb 4.8 in debian repos
dpkg -i $SCRIPTPATH/libdb4.8_4.8.24-1ubuntu1_i386.deb || exit
dpkg -i $SCRIPTPATH/libdb4.8-dev_4.8.24-1ubuntu1_i386.deb || exit
dpkg -i $SCRIPTPATH/libdb4.8++_4.8.24-1ubuntu1_i386.deb || exit
dpkg -i $SCRIPTPATH/libdb4.8++-dev_4.8.24-1ubuntu1_i386.deb || exit

git clone https://github.com/bitcoin/bitcoin.git
cd bitcoin
./autogen.sh
./configure
make

