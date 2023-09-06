--Количество исполнителей в каждом жанре
SELECT albums_name FROM albums a
LEFT JOIN artistsalbums am ON a.id = am.albums_id
LEFT JOIN artists a3 ON a3.id = am.artists_id
LEFT JOIN artistsgenres a2 ON a.id = a2.artists_id
LEFT JOIN genres g2  ON g2.id = a2.genres_id
GROUP BY albums_name 
HAVING COUNT(DISTINCT genres_name) > 1
ORDER BY albums_name;

https://ru.paste.pics/e736ef08dcfb974675b8a28f7fe89d6b (данные таблицы albums)
https://ru.paste.pics/36ffc578d1af7eb6017a295b66eb815f (данные таблицы artistsalbums)
https://ru.paste.pics/32004012f713d2c6ae90610895ec5ec9 (данные таблицы artists)
https://ru.paste.pics/d32331c51292f45de6e372fe32786f28 (данные таблицы artistsgenres)
https://ru.paste.pics/1d7d7121912d13d45c6b1267b0c62ae8 (данные таблицы genres)
