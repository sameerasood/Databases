TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO albums (title, release_year, artist_id) VALUES ('Dark Horse', '2013', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('Yellow', '2000', '2');