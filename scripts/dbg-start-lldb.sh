#!/usr/bin/env bash
export MYSQL_HOME=${MYSQL_HOME:-/opt/mysql}

if [ -f $MYSQL_HOME/mysqld.pid ]; then
    export MYSQLD_PID=$(cat $MYSQL_HOME/mysqld.pid)
    echo "mysqld already started. pid = $MYSQLD_PID"
    exit
fi

lldb -o "b main" \
     -o "r" \
     -- mysqld --gdb
