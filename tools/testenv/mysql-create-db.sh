#!/usr/bin/env bash

echo "Creating MySQL database"

DBPASS=""
test ! -z "$OXI_TEST_DB_MYSQL_DBPASSWORD" && DBPASS="-p$OXI_TEST_DB_MYSQL_DBPASSWORD" || true

cat <<__SQL | mysql -h $OXI_TEST_DB_MYSQL_DBHOST -P $OXI_TEST_DB_MYSQL_DBPORT -u$OXI_TEST_DB_MYSQL_DBUSER $DBPASS
DROP database IF EXISTS $OXI_TEST_DB_MYSQL_NAME;
CREATE database $OXI_TEST_DB_MYSQL_NAME CHARSET utf8;
__SQL
