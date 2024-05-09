#!/usr/bin/env bash
export MYSQL_HOME=${MYSQL_HOME:-/opt/mysql}

if [ -f $MYSQL_HOME/mysqld.pid ]; then
    export MYSQLD_PID=$(cat $MYSQL_HOME/mysqld.pid)
    echo "mysqld already started. pid = $MYSQLD_PID"
    exit
fi

# set args
# (lldb) settings set target.run-args --gdb

# show args
# (lldb) settings show target.run-args

# set envs
# (lldb) settings set target.env-vars DEBUG=1
# (lldb) set se target.env-vars DEBUG=1
# (lldb) env DEBUG=1

lldb -o "b main" \
     -o "r" \
     -- mysqld --gdb
