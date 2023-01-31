DROP TABLE IF EXISTS "public"."recipes";
-- This script only contains the table creation statements and does not fully represent the table in the database. It's still missing: indices, triggers. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS recipes_id_seq;

CREATE TABLE recipes (
  id SERIAL,
  recipe_name text,
  cooking_time int,
  rating int,
  PRIMARY KEY ("id")
);

INSERT INTO recipes (id, recipe_name, cooking_time, rating) VALUES (2,'Cheese Pasta', 20, 5);
INSERT INTO recipes (id, recipe_name, cooking_time, rating) VALUES (3,'Courgette Cake', 40, 1);
INSERT INTO recipes (id, recipe_name, cooking_time, rating) VALUES (4,'Nan Bread', 30, 5);
INSERT INTO recipes (id, recipe_name, cooking_time, rating) VALUES (5,'Tea', 5, 5);