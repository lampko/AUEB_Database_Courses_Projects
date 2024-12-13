create table Credits(
   "cast" text,
   crew text,
   id int
);

create table Keywords(
   id int,
   keywords text
);

create table Links(
   movieId int,
   imdbId int,
   tmdbId int
);

create table Movies_Metadata(
   adult varchar(10),
   belongs_to_collection varchar(190),
   budget int,
   genres varchar(270),
   homepage varchar(250),
   id int,
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(110),
   overview varchar(1000),
   popularity varchar(10),
   poster_path varchar(40),
   production_companies varchar(1260),
   production_countries varchar(1040),
   release_date date,
   revenue bigint,
   runtime varchar(10),
   spoken_languages varchar(770),
   status varchar(20),
   tagline varchar(300),
   title varchar(110),
   video varchar(10),
   vote_average varchar(10),
   vote_count int
);

create table Ratings_Small(
   userId int,
   movieId int,
   rating varchar(10),
   timestamp int
);

CREATE TABLE movies."Credits-copy"(
    "cast" text,
    crew text,
    id int
);
INSERT INTO movies."Credits-copy"
SELECT DISTINCT ON(movies.credits.id) movies.credits.cast, movies.credits.crew,movies.Credits.id
FROM  movies.credits;


CREATE TABLE movies."Keywords-copy"(
    id int,
       keywords text
);

INSERT INTO movies."Keywords-copy"
SELECT DISTINCT ON(movies.keywords.id) movies.keywords.*
FROM  movies.keywords;

create table movies."Links-copy"(
   movieId int,
   imdbId int,
   tmdbId int
);
INSERT INTO movies."Links-copy"
SELECT DISTINCT ON(movies.links.movieid) movies.links.*
FROM  movies.links;

create table movies."Movies_Metadata-copy"(
   adult varchar(10),
   belongs_to_collection varchar(190),
   budget int,
   genres varchar(270),
   homepage varchar(250),
   id int,
   imdb_id varchar(10),
   original_language varchar(10),
   original_title varchar(110),
   overview varchar(1000),
   popularity varchar(10),
   poster_path varchar(40),
   production_companies varchar(1260),
   production_countries varchar(1040),
   release_date date,
   revenue bigint,
   runtime varchar(10),
   spoken_languages varchar(770),
   status varchar(20),
   tagline varchar(300),
   title varchar(110),
   video varchar(10),
   vote_average varchar(10),
   vote_count int
);
INSERT INTO movies."Movies_Metadata-copy"
SELECT DISTINCT ON(movies.movies_metadata.id) movies.movies_metadata.*
FROM  movies.movies_metadata;

DROP TABLE movies.credits;
DROP TABLE movies.keywords;
DROP TABLE movies.links;
DROP TABLE movies.movies_metadata;

ALTER TABLE movies."Credits-copy" RENAME TO credits;
ALTER TABLE movies."Keywords-copy" RENAME TO keywords;
ALTER TABLE movies."Links-copy" RENAME TO links;
ALTER TABLE movies."Movies_Metadata-copy" RENAME TO movies_metadata;

DELETE FROM movies.credits
WHERE id NOT IN(SELECT id
FROM movies.movies_metadata);

DELETE FROM movies.keywords
WHERE id NOT IN(SELECT id
FROM movies.movies_metadata);

DELETE FROM movies.links
WHERE movieid NOT IN(SELECT id
FROM movies.movies_metadata);

DELETE FROM movies.ratings_small
WHERE movieid NOT IN(SELECT id
FROM movies.movies_metadata);

ALTER TABLE movies.credits ADD PRIMARY KEY(id);
ALTER TABLE movies.keywords ADD PRIMARY KEY(id);
ALTER TABLE movies.links ADD PRIMARY KEY(movieid);
ALTER TABLE movies.movies_metadata ADD PRIMARY KEY(id);
ALTER TABLE movies.ratings_small ADD PRIMARY KEY(userid, movieid);

ALTER TABLE movies.credits ADD FOREIGN KEY(id) REFERENCES movies.movies_metadata(id);
ALTER TABLE movies.keywords ADD FOREIGN KEY(id) REFERENCES movies.movies_metadata(id);
ALTER TABLE movies.links ADD FOREIGN KEY(movieid) REFERENCES movies.movies_metadata(id);
ALTER TABLE movies.ratings_small ADD FOREIGN KEY(movieid) REFERENCES movies.movies_metadata(id);