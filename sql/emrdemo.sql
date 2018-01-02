-- create a database
CREATE DATABASE emr_sql_demo;

-- create a user
CREATE USER 'jimmy'@'localhost' IDENTIFIED BY 'password';

-- grant permissions to new user
GRANT ALL PRIVILEGES ON emr_sql_demo.* TO 'jimmy'@'localhost';

-- create users table
CREATE TABLE users (
  id INT UNSIGNED AUTO_INCREMENT NOT NULL,
  user_name VARCHAR(50) NOT NULL,
  user_gender TINYINT UNSIGNED,
  user_email VARCHAR(128) NOT NULL,
  user_hash CHAR(128),
  user_salt CHAR(64),
  UNIQUE (user_email),
  PRIMARY KEY (id)
);
