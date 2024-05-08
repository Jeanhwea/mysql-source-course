#!/usr/bin/env bash
export MYSQL_HOME=${MYSQL_HOME:-/opt/mysql}
export MYSQL_PID=$(cat $MYSQL_HOME/mysqld.pid)

top -H -p $MYSQL_PID
