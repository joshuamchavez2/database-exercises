USE albums_db;
SHOW Tables;
DESCRIBE albums;

SELECT release_date from albums
ORDER BY release_date;

USE albums_db;

/* 
3C	What is the primary key for the albums table? ID field is the primary key 
*/

DESCRIBE albums; 

/* 
3D	What is the oldest release date for any album in the albums table? 1967
	what is the most recent release date? 2011
*/

SELECT release_date from albums
ORDER BY release_date;

/* 
4A	The name of all albums by Pink Floyd? The Dark Side of the Moon and The Wall
*/

SELECT name 
FROM albums
WHERE artist = 'Pink Floyd';

/* 
4B	The year Sgt. Pepper's Lonely Hearts Club Band was released? 1967
*/

SELECT name, release_date
FROM albums
WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

/* 
4C	The genre for the album Nevermind? Grunge, Alternative Rock 
*/

SELECT genre
FROM albums
WHERE name = 'Nevermind';

/*	
4D Which albums were released in the 1990s?

	The Bodyguard, 
	Jagged Little Pill, 
	Come On Over, 
	Falling into You, 
	Let's Talk About Love,
	Dangerous, 
	The Immaculate Collection,
	Titanic: Music from the Motion Picture,
	Metallica,
	Nevermind,
	Supernatural
*/

SELECT name
FROM albums
WHERE release_date BETWEEN 1990 and 1999;

/* 
4E	Which albums had less than 20 million certified sales?  13 albums under 20 million copies sold 
*/

SELECT sales
FROM albums
WHERE sales < 20.0;

/* 
4F	All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?

	Sgt. Pepper's Lonely Hearts Club Band, 
	1, 
	Abbey Road, 
	Born in the U.S.A.,
	Supernatural.
	
	We didn't get hard rock or Progressive rock because it didn't match the String "Rock" letter for letter
*/

SELECT name
FROM albums
WHERE genre = 'Rock';





