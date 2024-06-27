#!/usr/bin/env bash
export MYSQLD_TRACE_FILE=${MYSQLD_TRACE_FILE:-/tmp/mysqld.trace}

grep -n 'dispatch_sql_command' $MYSQLD_TRACE_FILE
