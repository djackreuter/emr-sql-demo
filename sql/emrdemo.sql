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

-- create posts table
CREATE TABLE posts (
  id INT UNSIGNED AUTO_INCREMENT NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  post_title VARCHAR(64),
  post_content VARCHAR(1000) NOT NULL,
  post_date TIMESTAMP(6) NOT NULL,
  INDEX (user_id),
  FOREIGN KEY (user_id) REFERENCES users (id),
  PRIMARY KEY (id)
);

-- create comments table
CREATE TABLE comments (
  id INT UNSIGNED AUTO_INCREMENT NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  comment_body VARCHAR(500) NOT NULL,
  comment_date TIMESTAMP(6) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id),
  PRIMARY KEY (id)
);

-- create comment_post table
CREATE TABLE comment_post (
  id INT UNSIGNED AUTO_INCREMENT NOT NULL,
  comment_id INT UNSIGNED NOT NULL,
  post_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (comment_id) REFERENCES comments (id),
  FOREIGN KEY (post_id) REFERENCES posts (id),
  PRIMARY KEY (id)
);

-- insert some users into users table
INSERT INTO users VALUES (null, 'John', 0, 'john@test.com', null, null);
INSERT INTO users VALUES (null, 'Jane', 1, 'jane@test.com', null, null);
INSERT INTO users VALUES (null, 'Anne', 1, 'anne@test.com', null, null);
INSERT INTO users VALUES (null, 'Mark', 0, 'mark@test.com', null, null);
INSERT INTO users VALUES (null, 'Gary', 0, 'gary@test.com', null, null);
INSERT INTO users VALUES (null, 'Robert', 0, 'robert@test.com', null, null);
INSERT INTO users VALUES (null, 'Lola', 1, 'lola@test.com', null, null);

-- insert some posts from the users
INSERT INTO posts VALUES (null, 1, 'User 1 Post 1', 'User 1 Post 1 content', '2018-01-02 11:06:45');
INSERT INTO posts VALUES (null, 2, 'User 2 Post 1', 'User 2 Post 1 content', '2018-01-02 11:07:05');
INSERT INTO posts VALUES (null, 3, 'User 3 Post 1', 'User 3 Post 1 content', '2018-01-02 11:16:15');
INSERT INTO posts VALUES (null, 4, 'User 4 Post 1', 'User 4 Post 1 content', '2018-01-02 10:06:45');
INSERT INTO posts VALUES (null, 5, 'User 5 Post 1', 'User 5 Post 1 content', '2018-01-02 10:40:05');
INSERT INTO posts VALUES (null, 6, 'User 6 Post 1', 'User 6 Post 1 content', '2018-01-02 09:05:01');
INSERT INTO posts VALUES (null, 7, 'User 7 Post 1', 'User 7 Post 1 content', '2018-01-01 11:50:59');
INSERT INTO posts VALUES (null, 1, 'User 1 Post 2', 'User 1 Post 2 content', '2018-01-02 10:20:30');
INSERT INTO posts VALUES (null, 2, 'User 2 Post 2', 'User 2 Post 2 content', '2018-01-02 09:30:45');
INSERT INTO posts VALUES (null, 3, 'User 3 Post 2', 'User 3 Post 2 content', '2018-01-02 09:06:15');
INSERT INTO posts VALUES (null, 4, 'User 4 Post 2', 'User 4 Post 2 content', '2018-01-01 13:46:16');
INSERT INTO posts VALUES (null, 5, 'User 5 Post 2', 'User 5 Post 2 content', '2018-01-01 15:43:50');
INSERT INTO posts VALUES (null, 6, 'User 6 Post 2', 'User 6 Post 2 content', '2018-01-01 18:30:16');
INSERT INTO posts VALUES (null, 7, 'User 7 Post 2', 'User 7 Post 2 content', '2018-01-01 14:50:59');
INSERT INTO posts VALUES (null, 1, 'User 1 Post 3', 'User 1 Post 3 content', '2018-01-02 11:17:30');
INSERT INTO posts VALUES (null, 2, 'User 2 Post 3', 'User 2 Post 3 content', '2018-01-01 13:06:45');
INSERT INTO posts VALUES (null, 3, 'User 3 Post 3', 'User 3 Post 3 content', '2018-01-02 09:00:00');
INSERT INTO posts VALUES (null, 4, 'User 4 Post 3', 'User 4 Post 3 content', '2018-01-02 11:12:34');
INSERT INTO posts VALUES (null, 5, 'User 5 Post 3', 'User 5 Post 3 content', '2018-01-02 11:11:41');
INSERT INTO posts VALUES (null, 6, 'User 6 Post 3', 'User 6 Post 3 content', '2018-01-02 11:01:54');
INSERT INTO posts VALUES (null, 7, 'User 7 Post 3', 'User 7 Post 3 content', '2018-01-02 10:58:32');
INSERT INTO posts VALUES (null, 1, 'User 1 Post 4', 'User 1 Post 4 content', '2018-01-02 11:06:18');
INSERT INTO posts VALUES (null, 2, 'User 2 Post 4', 'User 2 Post 4 content', '2018-01-01 12:06:37');
INSERT INTO posts VALUES (null, 3, 'User 3 Post 4', 'User 3 Post 4 content', '2018-01-02 10:00:45');
INSERT INTO posts VALUES (null, 4, 'User 4 Post 4', 'User 4 Post 4 content', '2018-01-02 11:06:32');
INSERT INTO posts VALUES (null, 5, 'User 5 Post 4', 'User 5 Post 4 content', '2018-01-02 11:13:55');
INSERT INTO posts VALUES (null, 6, 'User 6 Post 4', 'User 6 Post 4 content', '2018-01-02 10:42:18');
INSERT INTO posts VALUES (null, 7, 'User 7 Post 4', 'User 7 Post 4 content', '2018-01-02 06:45:15');
INSERT INTO posts VALUES (null, 1, 'User 1 Post 5', 'User 1 Post 5 content', '2018-01-01 13:30:33');
INSERT INTO posts VALUES (null, 2, 'User 2 Post 5', 'User 2 Post 5 content', '2018-01-01 16:06:45');

-- insert some comments
INSERT INTO comments VALUES (null, 'comment 1', '2018-01-01 17:06:05');
INSERT INTO comments VALUES (null, 'comment 2', '2018-01-01 14:06:05');
INSERT INTO comments VALUES (null, 'comment 3', '2018-01-02 07:06:05');
INSERT INTO comments VALUES (null, 'comment 4', '2018-01-02 11:06:05');
INSERT INTO comments VALUES (null, 'comment 5', '2018-01-02 11:30:05');
INSERT INTO comments VALUES (null, 'comment 6', '2018-01-02 11:10:05');
INSERT INTO comments VALUES (null, 'comment 7', '2018-01-02 11:06:05');
INSERT INTO comments VALUES (null, 'comment 8', '2018-01-01 13:06:05');
INSERT INTO comments VALUES (null, 'comment 9', '2018-01-02 11:20:05');
INSERT INTO comments VALUES (null, 'comment 10', '2018-01-02 11:00:05');
INSERT INTO comments VALUES (null, 'comment 11', '2018-01-02 11:16:05');
INSERT INTO comments VALUES (null, 'comment 12', '2018-01-02 11:25:15');

-- add relationships to comments
INSERT INTO comment_post VALUES (null, 1, 30);
INSERT INTO comment_post VALUES (null, 2, 29);
INSERT INTO comment_post VALUES (null, 3, 28);
INSERT INTO comment_post VALUES (null, 4, 27);
INSERT INTO comment_post VALUES (null, 5, 26);
INSERT INTO comment_post VALUES (null, 6, 25);
INSERT INTO comment_post VALUES (null, 7, 24);
INSERT INTO comment_post VALUES (null, 8, 23);
INSERT INTO comment_post VALUES (null, 9, 22);
INSERT INTO comment_post VALUES (null, 10, 21);
INSERT INTO comment_post VALUES (null, 11, 20);
INSERT INTO comment_post VALUES (null, 12, 19);

-- select all female users
SELECT * FROM users WHERE user_gender = 1;

-- count all male users
SELECT COUNT(id) AS male_users FROM users WHERE user_gender = 0;

-- count all posts by male users
SELECT COUNT(*) AS posts_by_male_users FROM users INNER JOIN posts ON users.id=posts.user_id AND users.user_gender=0;
-- show in a table
SELECT users.id, users.user_name, users.user_gender FROM users INNER JOIN posts ON users.id=posts.user_id AND users.user_gender=0;

-- count comments by female users
SELECT COUNT(*) AS comments_by_female_users FROM users JOIN comments ON users.id=comments.user_id AND users.user_gender=1;
-- show in table
SELECT users.id, users.user_name, users.user_gender FROM users JOIN comments ON users.id=comments.user_id AND users.user_gender=1;

-- add column to table
ALTER TABLE users ADD test_col VARCHAR(20);

-- modify a column name
ALTER TABLE users CHANGE `test_col` `new_col` VARCHAR(20);

-- modify a record
UPDATE users SET user_name = 'Angie' WHERE id = 3;

-- delete a record
DELETE FROM users WHERE id = 3;

-- drop table
DROP DATABASE emr_sql_demo;

-- dump database content
mysqldump -u user -p --databases emr_sql_demo > emr_sql_demo_backup.sql

-- restore database
mysql -u user -p emr_sql_demo < emr_sql_demo_backup.sql
