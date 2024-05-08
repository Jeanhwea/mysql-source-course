#!/usr/bin/env bash
export MYSQL_HOME=${MYSQL_HOME:-/opt/mysql}
export MYSQLD_PID=$(cat $MYSQL_HOME/mysqld.pid)

ps -T -p $MYSQLD_PID
