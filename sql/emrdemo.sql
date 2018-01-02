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
