CREATE DATABASE InstagramDB;

USE InstagramDB;
ALTER TABLE Users RENAME COLUMN fisrt_name TO first_name;
CREATE TABLE Users (
user_id INT AUTO_INCREMENT PRIMARY KEY,
username VARCHAR(50) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL UNIQUE,
fisrt_name VARCHAR(50),
last_name VARCHAR(50),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 2. PROFILE TABLE --
-- One-to-One Relationship with Users --


CREATE TABLE Profiles (
profile_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT UNIQUE NOT NULL,
bio VARCHAR(255),
profile_picture VARCHAR(255),
date_of_birth DATE,

FOREIGN KEY (user_id)
REFERENCES users(user_id)
ON DELETE CASCADE
);


-- 3. POSTS TABLE --
-- One user can create Many Posts --
-- One to Many Relationship --


CREATE TABLE Posts (
post_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL, content TEXT,
image_url VARCHAR(255), created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (user_id)
REFERENCES Users (user_id)
ON DELETE CASCADE
);

-- 4. COMMENTS TABLE --
-- Weak Entity --
-- Depends on Users and Posts --

DROP TABLE Comments;
CREATE TABLE Comments (
comment_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
post_id INT NOT NULL,
comment_text VARCHAR (500),
created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (user_id)
REFERENCES Users (user_id)
ON DELETE CASCADE, 

FOREIGN KEY (post_id)
REFERENCES Posts (post_id)
ON DELETE CASCADE
);


-- 5. LIKES TABLE --
-- Creates Many-to-Many Relationship --
-- Between Users and Posts --


CREATE TABLE Likes (
user_id INT,
post_id INT,
liked_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY (user_id, post_id),

FOREIGN KEY (user_id)
REFERENCES Users (user_id)
ON DELETE CASCADE,

FOREIGN KEY (post_id)
REFERENCES Posts (post_id)
ON DELETE CASCADE
);


# Insert Date:
INSERT INTO Users
(username, email, first_name, last_name)
VALUES
('hitesh123', 'hitesh@gmail.com', 'Hitesh', 'Pandey'),
('rahul_01', 'rahul@gmail.com', 'Rahul', 'Sharma'),
('priya_99', 'priya@gmail.com', 'Priya', 'Patil');

INSERT INTO Profiles
(user_id, bio, date_of_birth)
VALUES
(1, 'Data Science Trainer', '1995-05-10'),
(2, 'Software Developer', '1998-08-15'),
(3, 'Data Analyst', '1999-12-20');

INSERT INTO Posts
(user_id, content, image_url)
VALUES
(1, 'Learning SQL Database Relationships!', 'sql.jpg'),
(1, 'Today we learned Foreign Keys.', 'foreignkey.jpg'),
(2, 'Hello from Instagram Database!', 'instagram.jpg');

-- Insert Comments
INSERT INTO Comments
(user_id, post_id, comment_text)
VALUES
(2, 1, 'Great explanation!'), (3, 1, 'Very useful topic.'),
(1, 3, 'Welcome to the platform!');

select *FROM Comments;

desc Comments;

desc Likes;
-- Insert Likes--
INSERT INTO Likes
(user_id, post_id)
VALUES
(2,1),(3,1),(1,3),(3,3);

select *from Likes;





