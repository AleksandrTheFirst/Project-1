SELECT artists_id FROM artists a
LEFT JOIN artistsgenres a2 ON a.id = a2.artists_id
LEFT JOIN genres g2  ON g2.id = a2.genres_id
GROUP BY artists_id 
HAVING COUNT(DISTINCT genres_id) > 1
ORDER BY artists_id;
