#!/bin/bash

/usr/sbin/apache2ctl -D FOREGROUND &
/usr/sbin/mysqld -u mysql &
