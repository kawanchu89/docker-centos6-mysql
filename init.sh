#!/bin/bash
# MySQLにテストデータを読み込む

# 複数同時に起動しないようになっているので、それに甘える
nohup /usr/bin/mysqld_safe &

while ! mysqladmin ping -h localhost --silent;
do
  sleep 1
done

# これより下でSQLを読み込ます
mysql -u root -h localhost mysql < /tmp/init.sql
mysql -u root -h localhost aaa < /tmp/aaa.sql
