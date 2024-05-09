#!/usr/bin/env bash

# https://dev.mysql.com/doc/refman/8.0/en/source-installation-prerequisites.html
sudo apt install -y build-essential git ncurses-dev bison cmake libaio1

# GCC 10
gcc --version
# GNU make 3.75 or later.
make --version
# cmake 3.x
cmake --version
# bison 2.1 or later
bison --version

# install debug source
sudo apt install linux-source glibc-source
