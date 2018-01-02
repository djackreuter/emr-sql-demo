-- PostgreSQL

-- create a user
CREATE ROLE jimmy WITH LOGIN PASSWORD 'password';

-- grant permissions to user
ALTER ROLE jimmy CREATEDB;
GRANT ALL PRIVILEGES ON DATABASE emr_sql_demo TO jimmy;

-- create a database
CREATE DATABASE emr_sql_demo;

-- create users table
CREATE TABLE users (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  user_name VARCHAR(50) NOT NULL,
  user_gender SMALLINT,
  user_email VARCHAR(128) NOT NULL UNIQUE,
  user_hash CHAR(128),
  user_salt CHAR(64)
);
