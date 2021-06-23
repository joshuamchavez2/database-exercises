USE albums_db;
SHOW Tables;
DESCRIBE albums;

SELECT release_date from albums
ORDER BY release_date;


#3c the primary key is ID
DESCRIBE albums;

#3d The oldest album is 1967 and newest is 2011
SELECT release_date from albums
ORDER BY release_date;

#4a The Dark side of the moon and the wall
SELECT name from albums
WHERE artist ='Pink Floyd';

#4b 1967
SELECT name, release_date
FROM albums
WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

#4c Grunge, Alternative rock
SELECT genre
FROM albums
WHERE name = 'Nevermind';

#4d The Bodyguard, Jagged Little Pill, Come On Over, Falling into You, Let's Talk About Love, 
#Dangerous, The Immaculate Collection, Titanic: Music from the Motion Picture, Metallica, Nevermind, Supernatural
SELECT name
FROM albums
WHERE release_date BETWEEN 1990 and 1999;

#4e 13 albums under 20 million copies sold
SELECT sales
FROM albums
WHERE sales < 20.0;

#4f Sgt. Pepper's Lonely Hearts Club Band, 1, Abbey Road, Born in the U.S.A., Supernatural.  We didn't get hard rock or Progressive rock because it didn't match Rock
SELECT name
FROM albums
WHERE genre = 'Rock';