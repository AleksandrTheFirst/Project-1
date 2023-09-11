--Имена групп/исполнителей
insert into artists(nickname)
values
	('Red Hot Chili Peppers'),
	('The Frames'),
	('big strides'),
	('Damien Jurado'),
	('Queens of the stone age'),
	('Radiohead'),
	('Jaden'),
	('Ferdous');

--Название жанров
insert into genres (name)
values
	('New Metal'),
	('Jazz'),
	('Rock');

--Название альбомов
insert into albums (albums_name, release_date)
values
	('By the Way', '2002.07.09'),
	('Caught in the trees', '2008.09.09'),
	('Erys', '2019.07.05'),
	('For My Own Sake', '2020.01.15'),
	('Small Town', '2005.06.06'),
	('Dance the Devil', '1999.06.25'),
	('Lullabies To Paralyze', '2002.03.21'),
	('Ok Computer', '1997.05.21');
	

--Название треков
insert into tracks (tracks_name, duration, albums_id)
values
	('NOIZE', 4, 6),
	('Everything Trying', 3.25, 8),
	('On My Own', 4, 6),
	('Gravity', 2.39, 7),
	('Overdrive', 2.36, 7),
	('Cant Stop', 4, 1),
	('I do not fear jazz', 3.35, 5),
	('In My Head', 4, 4),
	('Midnight', 5, 1),
	('Seven Day Mile', 4, 2),
	('Rent Day Blues', 4, 2),
	('No Surprises', 4, 3),
	('Lucky', 4, 3);


--Название коллекций
insert into collections (collections_name, release_date)
values
	('Random Collection of RHCP', '2004.06.21'),
	('Random Collection of Big Strides', '2010.07.17'),
	('Random Collection of QOTSA', '2004.06.21'),
	('Random Collection of Radiohead', '2005.07.22'),
	('Random Collection of Radiohead', '2005.07.22'),
	('Random Collection of The Frames', '2000.04.12'),
	('Random Collection of Damien Jurado', '2019.02.01'),
	('Random Collection of Ferdous', '2022.06.02'),
	('Random Collection of Jaden', '2023.01.20');

--Присоединение артистов к жанру
insert into artistsgenres (artists_id, genres_id)
values
	('1', '1'),
	('6', '1'),
	('2', '2'),
	('4', '2'),
	('5', '3'),
	('7', '3'),
	('10', '1');
--Присоединение артистов и альбомов
insert into artistsalbums(artists_id, albums_id)
values
	(1,1),
	(2,2),
	(7,5),
	(8,7),
	(10,6),
	(5,8);

--Присоединение названия треков и сборников
insert into trackscollections(tracks_id, collections_id)
values
	(1,1),
	(3,1),
	(4,4),
	(5,4),
	(6,5),
	(16,7),
	(12,8),
	(13,9),
	(14,10),
	(15,10),
	(10,11),
	(11,11);
