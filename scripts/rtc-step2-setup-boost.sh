#!/usr/bin/env bash
BOOST_DIR="/opt/boost_1_77_0"
BOOST_URL="https://boostorg.jfrog.io/artifactory/main/release/1.77.0/source/boost_1_77_0.tar.bz2"
if [ -d $BOOST_DIR ]; then
    echo "Find boost"
    exit
fi

if [ ! -f "/tmp/boost_1_77_0.tar.bz2" ]; then
    echo "Download from $BOOST_URL"
    cd /tmp
    wget -c $BOOST_URL
fi

tar xvf /tmp/boost_1_77_0.tar.bz2

if [ $UID -ne 0 ]; then
    echo "Permission deny, sudo ..."
    exit 13 # EACCES
fi

sudo mv boost_1_77_0 /opt
