# frozen_string_literal: true
require 'sqlite3'

File.delete('music.db') if File.exist?('music.db')

# Open a database
db = SQLite3::Database.new 'music.db'

# Create a table
db.execute <<-SQL
  create table artists (
    id Integer not null PRIMARY KEY,
    name varchar(255)
  );
SQL
db.execute <<-SQL
  create table albums (
    id Integer not null PRIMARY KEY,
    name varchar(255),
    artist_id integer
  );
SQL
db.execute <<-SQL
  create table tracks (
    id Integer not null PRIMARY KEY,
    name varchar(255),
    album_id Integer
  );
SQL

{
  1 => 'Adele',
  2 => 'Michael Jackson',
  3 => 'Eminem',
  4 => 'Daft Punk',
  5 => 'Bob Marley',
  6 => 'Sigur Ros',
  7 => 'Kovacs',
  8 => 'Muse',
  9 => 'Otis Redding',
  10 => 'Nicky Romero',
  11 => 'Hammock',
  12 => 'Stromae',
  13 => 'Rammstein',
  14 => 'Nicky Jam'
}.each do |pair|
  db.execute 'insert into artists (id, name) VALUES (?, ?)', pair
end

db.execute('INSERT INTO albums (id, name, artist_id) VALUES (?, ?, ?)', [1, 'Hello', 1])
db.execute('INSERT INTO albums (id, name, artist_id) VALUES (?, ?, ?)', [2, 'Thriller', 2])

db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [1, 'Hello', 1])
db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [2, 'And bye', 1])
db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [3, 'Thriller', 2])
db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [4, 'Bad', 2])
db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [5, 'Blood on the dancefloor', 2])
db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [6, 'The way you make me feel', 2])
db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [7, 'Too Bad', 2])
db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [8, 'Billie Jean', 2])
db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [9, 'Liberian Girl', 2])
db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [10, 'Earth Song', 2])
db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [11, 'XScape', 2])
db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [12, 'Privacy', 2])
db.execute('INSERT INTO tracks (id, name, album_id) VALUES (?, ?, ?)', [13, 'Cry', 2])
