#!/bin/bash
mysqld --initialize-insecure > /dev/null 2>&1
./helpers/mysql_init.sh

supervisord -n