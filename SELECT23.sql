/*Задание 2*/
/*Название и продолжительность самого длительного трека.*/
SELECT name, duration  FROM track
WHERE duration = (SELECT max(duration) FROM track)


/*Название треков, продолжительность которых не менее 3,5 минут.*/
SELECT name FROM track
WHERE duration > '000:03:30'


/*Названия сборников, вышедших в период с 2018 по 2020 год включительно.*/
SELECT name, year_of_issue FROM collection
GROUP BY name, year_of_issue 
HAVING year_of_issue > '2017-12-31' AND year_of_issue < '2021-01-01'


/*Исполнители, чьё имя состоит из одного слова.*/
SELECT * FROM musician
WHERE name NOT LIKE '% %'


/*Название треков, которые содержат слово «мой» или «my».*/
SELECT * FROM track
WHERE lower(name) LIKE '%мой%' OR lower(name) LIKE '%my%'


/*Задание 3*/
/*Количество исполнителей в каждом жанре.*/
SELECT name, count(*) AS musician_count FROM musiciangenres m
JOIN genre g ON g.id = genre_id
GROUP BY name


/*Количество треков, вошедших в альбомы 2019–2020 годов.*/
/*Изменил условие задания под свои данные, вывожу количество треков в альбомах
 *с 2000 по 2018 год включительно.*/
SELECT count(*) AS tracks_count FROM album a
JOIN track t ON t.album_id = a.id
WHERE a.year_of_issue > '1999-12-31' AND year_of_issue < '2019-01-01'


/*Средняя продолжительность треков по каждому альбому.*/
SELECT AVG(duration) FROM track t 
WHERE album_id > 0


/*Все исполнители, которые не выпустили альбомы в 2020 году.*/
SELECT m.name FROM musician m
JOIN albummusicians a ON a.musician_id = m.id 
JOIN album a2 ON a2.id = a.album_id 
WHERE a2.year_of_issue NOT BETWEEN '2019-12-31' AND '2021-01-01'


/*Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).*/
SELECT c.name FROM collection c 
JOIN collectiontracks c2 ON c2.collection_id = c.id 
JOIN track t ON c2.track_id = t.id 
JOIN album a ON a.id = t.album_id 
JOIN albummusicians a2 ON a2.album_id = a.id 
JOIN musician m ON m.id = a2.musician_id 
WHERE m.name = 'Rammstein'

