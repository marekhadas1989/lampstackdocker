#!/bin/bash

./helpers/mysql_init.sh

rm /var/lib/mysql

supervisord -n