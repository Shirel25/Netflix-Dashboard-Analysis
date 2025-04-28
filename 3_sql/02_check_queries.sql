-- Step 02: Check queries for validation

-- This script contains queries to verify that the data has been
-- correctly inserted and structured in the new tables.

-- These checks help ensure data quality before connecting to Power BI.

-----------------------------------------------------------------------------------------------
-- Check actors_movies table
-----------------------------------------------------------------------------------------------
SELECT * 
FROM actors_movies
LIMIT 10;

-- Count number of unique actors
SELECT COUNT(DISTINCT actor) AS unique_actors
FROM actors_movies;

-- Check number of distinct shows in actors_movies
SELECT COUNT(DISTINCT show_id) AS number_of_titles
FROM actors_movies;

-- Get the top 10 actors with the highest number of appearances
SELECT actor, COUNT(*) AS number_of_titles
FROM actors_movies
GROUP BY actor
ORDER BY number_of_titles DESC
LIMIT 10;

-----------------------------------------------------------------------------------------------
-- Check genres_movies table
-----------------------------------------------------------------------------------------------
SELECT * FROM genres_movies
LIMIT 10;

-- Get the top 10 most popular genres by number of titles
SELECT genre, COUNT(*) AS number_of_titles
FROM genres_movies
GROUP BY genre
ORDER BY number_of_titles DESC
LIMIT 10;

-----------------------------------------------------------------------------------------------
-- Check country_movies table
-----------------------------------------------------------------------------------------------
SELECT * FROM country_movies
LIMIT 10;

-- Top 10 countries with the most titles
SELECT country, COUNT(*) AS number_of_titles
FROM country_movies
GROUP BY country
ORDER BY number_of_titles DESC
LIMIT 10;

-----------------------------------------------------------------------------------------------
-- Check rating_description table
-----------------------------------------------------------------------------------------------
SELECT * FROM rating_description;