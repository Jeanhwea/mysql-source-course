#!/usr/bin/env bash
export MYSQL_HOME=${MYSQL_HOME:-/opt/mysql}
export MYSQL_SRC=${MYSQL_SRC:-/opt/src/mysql-server}

BOOST_DIR="/opt/boost_1_77_0"

BUILD_DIR="$MYSQL_SRC/build"

if [ ! -d $MYSQL_HOME ]; then
    sudo mkdir $MYSQL_HOME
    sudo chown $(whoami):$(whoami) $MYSQL_HOME
fi

echo "step1: prepare my.cnf"
tee $MYSQL_HOME/my.cnf <<END
# -*- mode: conf; -*-

[mysqld]
basedir   = $MYSQL_HOME
datadir   = $MYSQL_HOME/data
log-error = $MYSQL_HOME/mysqld-error.log
pid-file  = $MYSQL_HOME/mysqld.pid
socket    = $MYSQL_HOME/mysql.sock
# debug=d,info,error,query,general,where:O,/tmp/mysqld.trace
# debug=+d,info,error,query,general,enter,where:O,/tmp/mysqld.trace
#debug

# autocommit=0
# innodb_lock_wait_timeout=3600
# long_query_time   = 0
# slow_query_log      = on
# slow_query_log_file = /tmp/mysql-slow.log
# secure_file_priv  = /tmp

[client]
user      = root
socket    = $MYSQL_HOME/mysql.sock
END

echo "step2: config"
[ -d $BUILD_DIR ] && rm -rf $BUILD_DIR
mkdir $BUILD_DIR
cd $BUILD_DIR

CMAKE_EXTRA=""
if [ "$(uname)" == "Darwin" ]; then
    CMAKE_EXTRA="-DBISON_EXECUTABLE=/usr/local/opt/bison/bin/bison"
fi

cmake -DCMAKE_INSTALL_PREFIX=$MYSQL_HOME \
      -DWITH_BOOST=$BOOST_DIR \
      -DWITH_DEBUG=1 \
      -DWITH_UNIT_TESTS=1 \
      $CMAKE_EXTRA $MYSQL_SRC

echo "step3: build"
make -j$(nproc)

echo "step4: install"
make install

echo "step5: initdb"
$MYSQL_HOME/bin/mysqld --defaults-file=$MYSQL_HOME/my.cnf --initialize-insecure
