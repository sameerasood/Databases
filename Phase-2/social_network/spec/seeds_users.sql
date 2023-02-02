TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (id, username, email_address) VALUES (1, 'Boris', 'random@uk.com');
INSERT INTO users (id, username, email_address) VALUES (2, 'Mark', 'def@xyz.com');