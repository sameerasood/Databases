-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (id, recipe_name, cooking_time, rating) VALUES (1, 'Okra', 30, 3);
INSERT INTO recipes (id, recipe_name, cooking_time, rating) VALUES (2, 'Chicken salad', 10, 2);