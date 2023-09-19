--Название и продолжительность самого длительного трека
select name, duration from tracks
where duration = (select max(duration) from tracks);

--Название треков, продолжительность которых больше 3.5 минут
select name, duration from tracks
where duration > 3.5

--Названия сборников, вышедших в период с 2018 по 2020 год включительно
select name from collections
where release_date >= '2018.01.01' and release_date <= '2020.01.01'

--Исполнители, чьё имя состоит из одного слова
select nickname from artists
where not nickname like '% %';

--Название треков, которые содержат слово «мой» или «my»
select name from tracks
where name like '%мой%' or name like '%My%'

--Количество исполнителей в каждом жанре
select genres_name, count(a.nickname) from genres g
left join artistsgenres a2 on g.id = a2.genres_id 
left join artists a on a2.artists_id = a.id 
group by genres_name 
order by count(a.nickname) desc;


--Количество треков, вошедших в альбомы 2019-2020 годов
select count(tracks_name) from tracks t
left join albums a on t.albums_id = a.id
where release_date > '2019.01.01' and release_date < '2021.01.01';

--Средняя продолжительность треков по каждому альбому 
select a.albums_name, avg(duration) from tracks t 
left join albums a on t.albums_id = a.id
group by albums_name 
order by avg(duration);


--Все исполнители которые не выпустили альбомы в 2020 году
select nickname from artists a 
left join artistsalbums a2 on a.id = a2.artists_id
left join albums a3 on a2.albums_id = a3.id
where nickname not in (select nickname from artistsalbums where release_date >= '2020.01.01' and release_date < '2021.01.01');


--Названия сборников, в которых присутствует конкретный исполнитель
select collections_name from collections c 
left join trackscollections t on t.collections_id = c.id 
left join tracks t2 on t.tracks_id = t2.id 
left join albums a on t2.albums_id = a.id 
left join artistsalbums a2 on a.id = a2.albums_id 
left join artists a3 on a2.artists_id = a3.id 
where nickname like 'Da%';
