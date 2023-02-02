TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (id, title, content, views, user_id) VALUES (1, 'Feb 2, 2023', 'It is the second day of February 2023', '8', 1);
INSERT INTO posts (id, title, content, views, user_id) VALUES (2, 'Tony', 'Tony is Ironman', '5', 2);