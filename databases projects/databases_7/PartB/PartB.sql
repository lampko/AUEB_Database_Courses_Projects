/*Query 1*/
SELECT EXTRACT(year FROM release_date) AS release_year, COUNT(id)
FROM movies.movies_metadata
GROUP BY release_year;

/*Query 2*/
SELECT genres, COUNT(id)
FROM movies.movies_metadata
GROUP BY genres;

/*Query 3*/
SELECT EXTRACT(year FROM release_date) AS release_year, genres, COUNT(*) AS movie_count
FROM movies.movies_metadata
GROUP BY genres, release_year
ORDER BY release_year;

/*Query 4*/
SELECT genres, AVG(CAST(rating AS FLOAT)) AS average_ratings
FROM movies.movies_metadata
JOIN movies.ratings_small
ON id = movieid
GROUP BY genres;

/*Query 5*/
SELECT userid, COUNT(userid) AS number_of_ratings
FROM movies.ratings_small
GROUP BY userid;

/*Query 6*/
SELECT userid, AVG(CAST(rating AS float)) AS average_ratings
FROM movies.ratings
GROUP BY userid;

CREATE VIEW movies.rating_summary AS
SELECT t1.*, t2.average_ratings
FROM (SELECT userid, COUNT(userid) AS number_of_ratings
FROM movies.ratings_small
GROUP BY userid) AS t1
JOIN (SELECT userid, AVG(CAST(rating AS float)) AS average_ratings
FROM movies.ratings_small
GROUP BY userid) AS t2
ON t1.userid = t2.userid;