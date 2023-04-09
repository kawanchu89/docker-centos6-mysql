DELETE FROM user WHERE user='';
DROP DATABASE test;

CREATE DATABASE aaa;
CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON `aaa`.* TO 'user'@'%';
