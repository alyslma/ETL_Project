-- Create tables for raw data to be loaded into
CREATE TABLE nyt_weeks (
title VARCHAR,
author VARCHAR,
isbn BIGINT PRIMARY KEY,
publisher VARCHAR,
date DATE,
weeks_on_list INT
);

CREATE TABLE goodreads_ratings (
isbn BIGINT PRIMARY KEY,
avg_rating DEC,
ratings_count INT,
reviews_count INT
);

-- Query to check successful load
SELECT * FROM nyt_weeks;
SELECT * FROM goodreads_ratings;

-- Join tables on isbn
SELECT nyt_weeks.title, nyt_weeks.author, nyt_weeks.weeks_on_list, goodreads_ratings.avg_rating, goodreads_ratings.ratings_count, goodreads_ratings.reviews_count
FROM nyt_weeks
INNER JOIN goodreads_ratings
ON nyt_weeks.isbn = goodreads_ratings.isbn;