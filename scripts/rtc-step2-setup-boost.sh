#!/usr/bin/env bash
BOOST_DIR="/opt/boost_1_77_0"
BOOST_URL="https://boostorg.jfrog.io/artifactory/main/release/1.77.0/source/boost_1_77_0.tar.bz2"
if [ -d $BOOST_DIR ]; then
    echo "Find boost"
    exit
fi

if [ $UID -ne 0 ]; then
    echo "Permission deny, sudo ..."
    exit 13 # EACCES
fi

echo "Download from $BOOST_URL"
cd ~
wget -c $BOOST_URL

tar xvf boost_1_77_0.tar.bz2
sudo mv boost_1_77_0 /opt
