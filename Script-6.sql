/// Таблица

CREATE TABLE IF NOT EXISTS genres(
	id SERIAL primary key,
	genres_name VARCHAR(40) not null
);
CREATE TABLE IF NOT EXISTS artists(
	id SERIAL primary key,
	nickname VARCHAR(40) not null
);
CREATE TABLE IF NOT EXISTS artistsgenres(
	id SERIAL primary key,
	artists_id INTEGER not null references artists(id),
	genres_id INTEGER not null references genres(id)
);
CREATE TABLE IF NOT EXISTS albums(
	id SERIAL primary key,
	albums_name VARCHAR(40) not null,
	release_date DATE not null
);
CREATE TABLE IF NOT EXISTS artistsalbums(
	id SERIAL primary key,
	artists_id INTEGER not null references artists(id),
	albums_id INTEGER not null references albums(id)
);
CREATE TABLE IF NOT EXISTS tracks(
	id SERIAL primary key,
	tracks_name VARCHAR(40) not null,
	duration INTEGER not null,
	albums_id INTEGER not null references albums(id)
);
CREATE TABLE IF NOT EXISTS collections(
	id SERIAL primary key,
	collections_name VARCHAR(40) not null,
	release_date DATE not null
);
CREATE TABLE IF NOT EXISTS trackscollections(
	id SERIAL primary key,
	tracks_id INTEGER not null references tracks(id),
	collections_id INTEGER not null references collections(id)
);

/// Присоединение данных к таблицам

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
insert into albums (albums_name, release_date)
values('By the Way', '2002.07.09');

insert into albums (albums_name, release_date)
values('Caught in the trees', '2008.09.09');

insert into albums (albums_name, release_date)
values('Erys', '2019.07.05');

insert into albums (albums_name, release_date)
values('For My Own Sake', '2020.01.15');

insert into albums (albums_name, release_date)
values('Small Town', '2005.06.06');

insert into albums (albums_name, release_date)
values('Dance the Devil', '1999.06.25');

insert into albums (albums_name, release_date)
values('Lullabies To Paralyze', '2002.03.21');

insert into albums (albums_name, release_date)
values('Ok Computer', '1997.05.21');

--Название треков
insert into tracks (tracks_name, duration, albums_id)
values('NOIZE', 4, 6);

insert into tracks (tracks_name, duration, albums_id)
values('Everything Trying', 3.25, 8);

insert into tracks (tracks_name, duration, albums_id)
values('On My Own', 4, 6);

insert into tracks (tracks_name, duration, albums_id)
values('Gravity', 2.39, 7);

insert into tracks (tracks_name, duration, albums_id)
values('Overdrive', 2.36, 7);

insert into tracks (tracks_name, duration, albums_id)
values('Cant Stop', 4, 1);

insert into tracks (tracks_name, duration, albums_id)
values('I do not fear jazz', 3.35, 5);

insert into tracks (tracks_name, duration, albums_id)
values('In My Head', 4, 4);

insert into tracks (tracks_name, duration, albums_id)
values('Midnight', 5, 1);

insert into tracks (tracks_name, duration, albums_id)
values('Seven Day Mile', 4, 2);

insert into tracks (tracks_name, duration, albums_id)
values('Rent Day Blues', 4, 2);

insert into tracks (tracks_name, duration, albums_id)
values('No Surprises', 4, 3);

insert into tracks (tracks_name, duration, albums_id)
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
values('1', '1');

insert into artistsgenres (artists_id, genres_id)
values('6', '1');

insert into artistsgenres (artists_id, genres_id)
values('2', '2');

insert into artistsgenres (artists_id, genres_id)
values('4', '2');

insert into artistsgenres (artists_id, genres_id)
values('5', '3');

insert into artistsgenres (artists_id, genres_id)
values('7', '3');

--Присоединение артистов и альбомов
insert into artistsalbums(artists_id, albums_id)
values(1,1);

insert into artistsalbums(artists_id, albums_id)
values(2,2);

insert into artistsalbums(artists_id, albums_id)
values(7,5);

insert into artistsalbums(artists_id, albums_id)
values(8,7);

insert into artistsalbums(artists_id, albums_id)
values(10,6);

--Присоединение названия треков и сборников
insert into trackscollections(tracks_id, collections_id)
values(1,1);

insert into trackscollections(tracks_id, collections_id)
values(3,1);

insert into trackscollections(tracks_id, collections_id)
values(4,4);

insert into trackscollections(tracks_id, collections_id)
values(5,4);

insert into trackscollections(tracks_id, collections_id)
values(6,5);

insert into trackscollections(tracks_id, collections_id)
values(16,7);

insert into trackscollections(tracks_id, collections_id)
values(12,8);

insert into trackscollections(tracks_id, collections_id)
values(13,9);

/// Селект выборка

SELECT albums_name FROM albums a
LEFT JOIN artistsalbums am ON a.id = am.albums_id
LEFT JOIN artists a3 ON a3.id = am.artists_id
LEFT JOIN artistsgenres a2 ON a3.id = a2.artists_id
LEFT JOIN genres g2 ON g2.id = a2.genres_id
GROUP BY albums_name 
HAVING COUNT(DISTINCT genres_name) > 1
ORDER BY albums_name;

