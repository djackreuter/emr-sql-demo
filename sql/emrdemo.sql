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
  comment_body VARCHAR(500) NOT NULL,
  comment_date TIMESTAMP(6) NOT NULL,
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
