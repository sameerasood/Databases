CREATE TABLE blogs (
  id SERIAL PRIMARY KEY,
  post text
);

-- Then the table with the foreign key first.


CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  comment text,
  -- The foreign key name is always {other_table_singular}_id
  post_id int,
  constraint fk_artist foreign key(post_id)
    references blogs(id)
    on delete cascade
);

