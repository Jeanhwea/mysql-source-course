#!/usr/bin/env bash
export MYSQL_SRC=${MYSQL_SRC:-/opt/src/mysql-server}

cd $MYSQL_SRC
rm -f cscope.* tags TAGS

rtc_index_dir() {
    local srcdir=$1
    echo "index source dir: $srcdir"
    find $srcdir \(             \
         -iname '*.ic'    -o    \
         -iname '*.c.in'  -o    \
         -iname '*.h.in'  -o    \
         -iname '*.cc.in' -o    \
         -iname '*.pc.in' -o    \
         -iname '*.h'     -o    \
         -iname '*.hpp'   -o    \
         -iname '*.c'     -o    \
         -iname '*.yy'    -o    \
         -iname '*.cc'          \
    \) -type f -print >> cscope.files
}

touch cscope.files
rtc_index_dir "$MYSQL_SRC/client"
rtc_index_dir "$MYSQL_SRC/components"
# rtc_index_dir "$MYSQL_SRC/extra"
rtc_index_dir "$MYSQL_SRC/include"
rtc_index_dir "$MYSQL_SRC/mysys"
# rtc_index_dir "$MYSQL_SRC/plugin"
rtc_index_dir "$MYSQL_SRC/router"
rtc_index_dir "$MYSQL_SRC/sql"
rtc_index_dir "$MYSQL_SRC/sql-common"
# rtc_index_dir "$MYSQL_SRC/storage"
# rtc_index_dir "$MYSQL_SRC/storage/csv"
# rtc_index_dir "$MYSQL_SRC/storage/heap"
rtc_index_dir "$MYSQL_SRC/storage/innobase"
rtc_index_dir "$MYSQL_SRC/storage/myisam"
rtc_index_dir "$MYSQL_SRC/storage/perfschema"
rtc_index_dir "$MYSQL_SRC/storage/temptable"
# rtc_index_dir "$MYSQL_SRC/storage/myisam"
rtc_index_dir "$MYSQL_SRC/strings"
# rtc_index_dir "$MYSQL_SRC/unittest"
rtc_index_dir "$MYSQL_SRC/utilities"
rtc_index_dir "$MYSQL_SRC/vio"

sort -u -o cscope.files cscope.files

FILECNT=$(wc -l cscope.files | awk '{print $1}')
echo "STAT: total $FILECNT source file"

echo "GEN: create cscope database"
cscope -b -q -k

echo "GEN: create TAGS file"
# grep '.ic$' cscope.files    | etags --language=c++ -L -
grep '.ic$' cscope.files    | etags --language-force=c++ -L -
grep -v '.ic$' cscope.files | etags --append -L -
# ctags --langmap=c:+.ic -e -L cscope.files
# ctags --langmap=c:+.ic -f tags -L cscope.files
