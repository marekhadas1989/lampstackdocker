#!/bin/bash

rm -rf /var/run/mysqld/mysqld.sock

mysqld --initialize-insecure > /dev/null 2>&1
./helpers/mysql_init.sh


supervisord -n