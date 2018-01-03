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

-- insert some posts from the users
INSERT INTO posts VALUES (DEFAULT, 1, 'User 1 Post 1', 'User 1 Post 1 content', '2018-01-02 11:06:45');
INSERT INTO posts VALUES (DEFAULT, 2, 'User 2 Post 1', 'User 2 Post 1 content', '2018-01-02 11:07:05');
INSERT INTO posts VALUES (DEFAULT, 3, 'User 3 Post 1', 'User 3 Post 1 content', '2018-01-02 11:16:15');
INSERT INTO posts VALUES (DEFAULT, 4, 'User 4 Post 1', 'User 4 Post 1 content', '2018-01-02 10:06:45');
INSERT INTO posts VALUES (DEFAULT, 5, 'User 5 Post 1', 'User 5 Post 1 content', '2018-01-02 10:40:05');
INSERT INTO posts VALUES (DEFAULT, 6, 'User 6 Post 1', 'User 6 Post 1 content', '2018-01-02 09:05:01');
INSERT INTO posts VALUES (DEFAULT, 7, 'User 7 Post 1', 'User 7 Post 1 content', '2018-01-01 11:50:59');
INSERT INTO posts VALUES (DEFAULT, 1, 'User 1 Post 2', 'User 1 Post 2 content', '2018-01-02 10:20:30');
INSERT INTO posts VALUES (DEFAULT, 2, 'User 2 Post 2', 'User 2 Post 2 content', '2018-01-02 09:30:45');
INSERT INTO posts VALUES (DEFAULT, 3, 'User 3 Post 2', 'User 3 Post 2 content', '2018-01-02 09:06:15');
INSERT INTO posts VALUES (DEFAULT, 4, 'User 4 Post 2', 'User 4 Post 2 content', '2018-01-01 13:46:16');
INSERT INTO posts VALUES (DEFAULT, 5, 'User 5 Post 2', 'User 5 Post 2 content', '2018-01-01 15:43:50');
INSERT INTO posts VALUES (DEFAULT, 6, 'User 6 Post 2', 'User 6 Post 2 content', '2018-01-01 18:30:16');
INSERT INTO posts VALUES (DEFAULT, 7, 'User 7 Post 2', 'User 7 Post 2 content', '2018-01-01 14:50:59');
INSERT INTO posts VALUES (DEFAULT, 1, 'User 1 Post 3', 'User 1 Post 3 content', '2018-01-02 11:17:30');
INSERT INTO posts VALUES (DEFAULT, 2, 'User 2 Post 3', 'User 2 Post 3 content', '2018-01-01 13:06:45');
INSERT INTO posts VALUES (DEFAULT, 3, 'User 3 Post 3', 'User 3 Post 3 content', '2018-01-02 09:00:00');
INSERT INTO posts VALUES (DEFAULT, 4, 'User 4 Post 3', 'User 4 Post 3 content', '2018-01-02 11:12:34');
INSERT INTO posts VALUES (DEFAULT, 5, 'User 5 Post 3', 'User 5 Post 3 content', '2018-01-02 11:11:41');
INSERT INTO posts VALUES (DEFAULT, 6, 'User 6 Post 3', 'User 6 Post 3 content', '2018-01-02 11:01:54');
INSERT INTO posts VALUES (DEFAULT, 7, 'User 7 Post 3', 'User 7 Post 3 content', '2018-01-02 10:58:32');
INSERT INTO posts VALUES (DEFAULT, 1, 'User 1 Post 4', 'User 1 Post 4 content', '2018-01-02 11:06:18');
INSERT INTO posts VALUES (DEFAULT, 2, 'User 2 Post 4', 'User 2 Post 4 content', '2018-01-01 12:06:37');
INSERT INTO posts VALUES (DEFAULT, 3, 'User 3 Post 4', 'User 3 Post 4 content', '2018-01-02 10:00:45');
INSERT INTO posts VALUES (DEFAULT, 4, 'User 4 Post 4', 'User 4 Post 4 content', '2018-01-02 11:06:32');
INSERT INTO posts VALUES (DEFAULT, 5, 'User 5 Post 4', 'User 5 Post 4 content', '2018-01-02 11:13:55');
INSERT INTO posts VALUES (DEFAULT, 6, 'User 6 Post 4', 'User 6 Post 4 content', '2018-01-02 10:42:18');
INSERT INTO posts VALUES (DEFAULT, 7, 'User 7 Post 4', 'User 7 Post 4 content', '2018-01-02 06:45:15');
INSERT INTO posts VALUES (DEFAULT, 1, 'User 1 Post 5', 'User 1 Post 5 content', '2018-01-01 13:30:33');
INSERT INTO posts VALUES (DEFAULT, 2, 'User 2 Post 5', 'User 2 Post 5 content', '2018-01-01 16:06:45');

-- insert some comments
INSERT INTO comments VALUES (DEFAULT, 1, 'comment 1', '2018-01-01 17:06:05');
INSERT INTO comments VALUES (DEFAULT, 3, 'comment 2', '2018-01-01 14:06:05');
INSERT INTO comments VALUES (DEFAULT, 2, 'comment 3', '2018-01-02 07:06:05');
INSERT INTO comments VALUES (DEFAULT, 5, 'comment 4', '2018-01-02 11:06:05');
INSERT INTO comments VALUES (DEFAULT, 4, 'comment 5', '2018-01-02 11:30:05');
INSERT INTO comments VALUES (DEFAULT, 7, 'comment 6', '2018-01-02 11:10:05');
INSERT INTO comments VALUES (DEFAULT, 2, 'comment 7', '2018-01-02 11:06:05');
INSERT INTO comments VALUES (DEFAULT, 7, 'comment 8', '2018-01-01 13:06:05');
INSERT INTO comments VALUES (DEFAULT, 4, 'comment 9', '2018-01-02 11:20:05');
INSERT INTO comments VALUES (DEFAULT, 5, 'comment 10', '2018-01-02 11:00:05');
INSERT INTO comments VALUES (DEFAULT, 6, 'comment 11', '2018-01-02 11:16:05');
INSERT INTO comments VALUES (DEFAULT, 4, 'comment 12', '2018-01-02 11:25:15');

-- add relationships to comments
INSERT INTO comment_post VALUES (DEFAULT, 1, 30);
INSERT INTO comment_post VALUES (DEFAULT, 2, 29);
INSERT INTO comment_post VALUES (DEFAULT, 3, 28);
INSERT INTO comment_post VALUES (DEFAULT, 4, 27);
INSERT INTO comment_post VALUES (DEFAULT, 5, 26);
INSERT INTO comment_post VALUES (DEFAULT, 6, 25);
INSERT INTO comment_post VALUES (DEFAULT, 7, 24);
INSERT INTO comment_post VALUES (DEFAULT, 8, 23);
INSERT INTO comment_post VALUES (DEFAULT, 9, 22);
INSERT INTO comment_post VALUES (DEFAULT, 10, 21);
INSERT INTO comment_post VALUES (DEFAULT, 11, 20);
INSERT INTO comment_post VALUES (DEFAULT, 12, 19);

-- select all female users
SELECT user_name, user_email FROM users WHERE user_gender = 1;

-- count all male users
SELECT COUNT(id) AS male_users FROM users WHERE user_gender = 0;

-- count all posts by male users
SELECT COUNT(*) AS posts_by_male_users FROM users INNER JOIN posts ON users.id=posts.user_id AND users.user_gender = 0;
-- show in a table
SELECT users.id, users.user_name, users.user_gender, posts.post_title FROM users INNER JOIN posts ON users.id = posts.user_id AND users.user_gender = 0;

-- count comments by female users
SELECT COUNT(*) AS comments_by_female_users FROM users JOIN comments ON users.id=comments.user_id AND users.user_gender = 1;
-- show in table
SELECT users.id, users.user_name, users.user_gender, comments.comment_body FROM users JOIN comments ON users.id=comments.user_id AND users.user_gender = 1;

-- add column to table
ALTER TABLE users ADD test_col VARCHAR(20);

-- modify a column name
ALTER TABLE users RENAME test_col TO new_col;

-- modify column datatype
ALTER TABLE users ALTER COLUMN new_col TYPE VARCHAR(50);

-- delete a record
DELETE FROM users WHERE id = 8;

-- dump database content
pg_dump -U jimmy emr_sql_demo > emr_sql_demo_backup.pgsql

-- restore database content
psql -U jimmy emr_sql_demo < emr_sql_demo_backup.pgsql

-- drop database
DROP DATABASE emr_sql_demo;
