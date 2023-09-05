--Имена групп/исполнителей
insert into artists(nickname)
values ('Red Hot Chili Peppers');

insert into artists(nickname)
values ('The Frames');

insert into artists(nickname)
values ('big strides');

insert into artists(nickname)
values ('Damien Jurado');

insert into artists(nickname)
values ('Queens of the stone age');

insert into artists(nickname)
values ('Radiohead');

insert into artists(nickname)
values ('Jaden');

insert into artists(nickname)
values ('Ferdous');

--Название жанров
insert into genres (name)
values ('New Metal');

insert into genres (name)
values ('Jazz');

insert into genres (name)
values ('Rock');

--Название альбомов
insert into albums (name, release_date)
values('By the Way', '2002.07.09');

insert into albums (name, release_date)
values('Erys', '2019.07.05');

insert into albums (name, release_date)
values('For My Own Sake', '2020.01.15');

insert into albums (name, release_date)
values('Small Town', '2005.06.06');

insert into albums (name, release_date)
values('Dance the Devil', '1999.06.25');

insert into albums (name, release_date)
values('Lullabies To Paralyze', '2002.03.21');

insert into albums (name, release_date)
values('Ok Computer', '1997.05.21');

--Название треков
insert into tracks (name, duration, albums_id)
values('NOIZE', 4, 6);

insert into tracks (name, duration, albums_id)
values('On My Own', 4, 6);

insert into tracks (name, duration, albums_id)
values('Gravity', 2.39, 7);

insert into tracks (name, duration, albums_id)
values('Overdrive', 2.36, 7);

insert into tracks (name, duration, albums_id)
values('Cant Stop', 4, 1);

insert into tracks (name, duration, albums_id)
values('I do not fear jazz', 3.35, 5);

insert into tracks (name, duration, albums_id)
values('In My Head', 4, 4);

insert into tracks (name, duration, albums_id)
values('Midnight', 5, 1);

insert into tracks (name, duration, albums_id)
values('Seven Day Mile', 4, 2);

insert into tracks (name, duration, albums_id)
values('Rent Day Blues', 4, 2);

insert into tracks (name, duration, albums_id)
values('No Surprises', 4, 3);

insert into tracks (name, duration, albums_id)
values('Lucky', 4, 3);

--Название коллекций
insert into collections (name, release_date)
values('Random Collection of RHCP', '2004.06.21');

insert into collections (name, release_date)
values('Random Collection of Big Strides', '2010.07.17');

insert into collections (name, release_date)
values('Random Collection of QOTSA', '2004.06.21');

insert into collections (name, release_date)
values('Random Collection of Radiohead', '2005.07.22');

insert into collections (name, release_date)
values('Random Collection of The Frames', '2000.04.12');

insert into collections (name, release_date)
values('Random Collection of Damien Jurado', '2019.02.01');

--Присоединение артистов к жанру
insert into artistsgenres (artists_id, genres_id)
values('1', '1')

insert into artistsgenres (artists_id, genres_id)
values('6', '1')

insert into artistsgenres (artists_id, genres_id)
values('2', '2')

insert into artistsgenres (artists_id, genres_id)
values('4', '2')

insert into artistsgenres (artists_id, genres_id)
values('5', '3')

insert into artistsgenres (artists_id, genres_id)
values('7', '3')

--Присоединение артистов и альбомов
insert into artistsalbums(artists_id, albums_id)
values(1,1)

insert into artistsalbums(artists_id, albums_id)
values(2,2)

insert into artistsalbums(artists_id, albums_id)
values(7,5)

insert into artistsalbums(artists_id, albums_id)
values(8,7)

insert into artistsalbums(artists_id, albums_id)
values(10,6)

--Количество исполнителей в каждом жанре
SELECT artists_id FROM artists a
LEFT JOIN artistsgenres a2 ON a.id = a2.artists_id
LEFT JOIN genres g2  ON g2.id = a2.genres_id
GROUP BY artists_id 
HAVING COUNT(DISTINCT genres_id) > 1
ORDER BY artists_id;

