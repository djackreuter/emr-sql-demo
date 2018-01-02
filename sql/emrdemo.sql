-- create a database
CREATE DATABASE emr_sql_demo;

-- create a user
CREATE USER 'jimmy'@'localhost' IDENTIFIED BY 'password';

-- grant permissions to new user
GRANT ALL PRIVILEGES ON emr_sql_demo.* TO 'jimmy'@'localhost';

-- create users table
