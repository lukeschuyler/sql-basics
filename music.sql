-- INSERT DATA

INSERT INTO Artist (ArtistName, YearEstablished)
VALUES ('King Crimson', '1969');

INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES ('Red', '1974', '2207', ' Columbia', '29', '2');

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES ('One More Red Nightmare', '740', '1974', '2', '29', '24');

-- SELECT ARTIST ALBUM SONG FROM ALBUM

SELECT ar.ArtistName, al.Title, s.Title
FROM Album al 
LEFT JOIN Song s ON s.AlbumId = al.AlbumId
LEFT JOIN Artist ar ON al.ArtistId = ar.ArtistId
WHERE al.Title = 'Red'

-- RETURNS SONG AMOUNT ON ALBUMS

SELECT al.Title, COUNT(al.Title)
FROM Album al 
LEFT JOIN Song s ON s.AlbumId = al.AlbumId
GROUP BY (al.Title)

-- RETURNS SONG AMOUNT FOR ARTISTS

SELECT ar.ArtistName, COUNT(*)
FROM Song s 
LEFT JOIN Artist ar ON s.ArtistId = ar.ArtistId
GROUP BY (ar.ArtistName)

-- RETURN COUNT OF GENRES

SELECT g.Label, COUNT(*)
FROM Genre g 
LEFT JOIN Song s ON g.genreId = s.genreId
GROUP BY (g.genreId)

-- GET LONGEST ALBUM

SELECT al.Title, MAX (DISTINCT al.AlbumLength)
FROM Album al

-- GET LONGEST SONG

SELECT Album.Title, song.Title, MAX (SongLength)
FROM song, Album
ON song.AlbumId = album.AlbumId
