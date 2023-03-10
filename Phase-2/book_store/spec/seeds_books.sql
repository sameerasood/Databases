
-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE books RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO books (id, title, author_name) VALUES (1, 'The Vinci Code', 'Dan Brown');
INSERT INTO books (id, title, author_name) VALUES (2, 'The Shining', 'Stephen King');