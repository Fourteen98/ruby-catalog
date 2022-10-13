CREATE TABLE item (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  genre_id INT,
  author_id INT,
  label_id INT,
  FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (label_id) REFERENCES label(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE book(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  publisher VARCHAR(100),
  cover_state VARCHAR(4),
  genre_id INT,
  author_id INT,
  label_id INT,
  FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE SET NULL ON UPDATE CASCADE,
  FOREIGN KEY (label_id) REFERENCES label(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE label(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100),
  color VARCHAR(100)
);

CREATE TABLE author (
  id INT GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  items FOREIGN KEY (id) REFERENCES item (author_id),
);

CREATE TABLE game (
  id INT GENERATED ALWAYS AS IDENTITY,
  genre VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  label VARCHAR(255) NOT NULL,
  publisher DATE NOT NULL,
  multiplayer VARCHAR(255) NOT NULL,
  last_played DATE NOT NULL,
);

CREATE TABLE music_albums (
  id INT GENERATED ALWAYS AS IDENTITY,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  genre_id INT,
  ADD CONSTRAINT fk_genre_id FOREIGN KEY (genre_id) REFERENCES genres (id);
  PRIMARY KEY(id)
);

CREATE TABLE genres (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250),
  PRIMARY KEY(id)
);