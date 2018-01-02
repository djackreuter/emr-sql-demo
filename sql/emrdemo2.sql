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

-- create posts table
CREATE TABLE posts (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  user_id INT NOT NULL REFERENCES users (id),
  post_title VARCHAR(64),
  post_content VARCHAR(1000) NOT NULL,
  post_date TIMESTAMP(6) NOT NULL
);
-- add index
CREATE INDEX user_id ON posts (user_id);

-- create comments table
CREATE TABLE comments (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  user_id INT NOT NULL,
  comment_body VARCHAR(500) NOT NULL,
  comment_date TIMESTAMP(6) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id)
);

-- create comment_post table
CREATE TABLE comment_post (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  comment_id INT NOT NULL,
  post_id INT NOT NULL,
  FOREIGN KEY (comment_id) REFERENCES comments (id),
  FOREIGN KEY (post_id) REFERENCES posts (id)
);

-- insert some users into users table
INSERT INTO users VALUES (DEFAULT, 'John', 0, 'john@test.com', null, null);
INSERT INTO users VALUES (DEFAULT, 'Jane', 1, 'jane@test.com', null, null);
INSERT INTO users VALUES (DEFAULT, 'Anne', 1, 'anne@test.com', null, null);
INSERT INTO users VALUES (DEFAULT, 'Mark', 0, 'mark@test.com', null, null);
INSERT INTO users VALUES (DEFAULT, 'Gary', 0, 'gary@test.com', null, null);
INSERT INTO users VALUES (DEFAULT, 'Robert', 0, 'robert@test.com', null, null);
INSERT INTO users VALUES (DEFAULT, 'Lola', 1, 'lola@test.com', null, null);
