#!/bin/bash

echo "######################################################"
echo "######################################################"
echo "## MySQL INIT STARTED $(date)                       ##"
echo "######################################################"
echo "######################################################"
echo "      											    "

/usr/bin/mysqld_safe &

RET=1
while [[ RET -ne 0 ]]; do
    echo "Please wait while MySQL service is starting up"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

mysql -uroot -e "CREATE USER IF NOT EXISTS 'phpmyadmin'@'localhost' IDENTIFIED BY '9wBVSFCcyzAY'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'phpmyadmin'@'localhost' WITH GRANT OPTION"

mysql -uroot < /usr/share/phpmyadmin/sql/create_tables.sql

mysql -uroot -e "CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY 'root'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION"

echo "                                                                                    "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@phpMyAdmin user 'phpmyadmin@localhost' WITH PASSWORD '9wBVSFCcyzAY'@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                                                                                    "

echo "                                                                        "
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@Default user 'root%' WITH PASSWORD 'root'@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "                                                                        "

echo "                                                                        "
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!!!!!!!!!!Please change both of your password IMMEDIATELLY!!!!!!!!!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "                                                                        "

mysqladmin -uroot shutdown

echo "######################################################"
echo "######################################################"
echo "MySQL initialized successfully $(date)"
echo "######################################################"
echo "######################################################"
echo "                                                      "
