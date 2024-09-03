CREATE DATABASE IF NOT EXISTS wordpress;

CREATE USER IF NOT EXISTS 'oumaima'@'localhost' IDENTIFIED BY 'ensa-1234';
GRANT ALL PRIVILEGES ON wordpress.* TO 'oumaima'@'localhost';
FLUSH PRIVILEGES;

