
TRUNCATE TABLE artists RESTART IDENTITY;
TRUNCATE TABLE albums RESTART IDENTITY; 

INSERT INTO artists
  (name, genre)
  VALUES ('Foo Fighters', 'Rock');

INSERT INTO artists
  (name, genre)
  VALUES ('Father John Misty', 'Folk Rock');

INSERT INTO albums
  (title, release_year, artist_id)
  VALUES ('The Colour and the Shape', 1997, 1);
  
INSERT INTO albums
  (title, release_year, artist_id)
  VALUES ('Chloe and the Next 20th Century', 2022, 2);

