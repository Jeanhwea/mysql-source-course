#!/usr/bin/env bash
export MYSQL_HOME=${MYSQL_HOME:-/opt/mysql}
export MYSQL_SRC=${MYSQL_SRC:-/opt/src/mysql-server}

$MYSQL_HOME/bin/mysql --defaults-file=$MYSQL_HOME/my.cnf <<END
create user 'rtc'@'%' identified by 'rtc+1234';
grant all privileges on *.* to 'rtc'@'%';
flush privileges;
END
