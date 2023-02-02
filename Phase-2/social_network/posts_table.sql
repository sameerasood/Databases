CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content: text,
  views: int
);

-- Then the table with the foreign key first.
CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  views int
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_artist foreign key(user_id)
    references posts(id)
    on delete cascade
);