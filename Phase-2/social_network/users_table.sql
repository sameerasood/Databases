CREATE TABLE users (
  id int SERIAL PRIMARY KEY,
  username text,
  email_address text
);

INSERT INTO users (id, username, email_address) VALUES (1,'harrypotter', 'xyz@abc.com');
INSERT INTO users (id, username, email_address) VALUES (2,'bellaswan', 'abc@xyz.com');
INSERT INTO users (id, username, email_address) VALUES (3,'spiderman', 'spidey@web.com');
INSERT INTO users (id, username, email_address) VALUES (4,'ironman', 'tony@stark.com');