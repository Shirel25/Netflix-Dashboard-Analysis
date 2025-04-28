SET search_path TO public;
-- Step 01: Create new tables from netflix_titles

-- This script creates new structured tables to organize the data
-- for easier analysis and visualization in Power BI.

-----------------------------------------------------------------------------------------------
-- Create actors_movies table
-----------------------------------------------------------------------------------------------
CREATE TABLE actors_movies AS
SELECT 
    show_id,
    title,
    TRIM(unnest(string_to_array("cast", ', '))) AS actor
FROM netflix_titles
WHERE "cast" IS NOT NULL
  AND "cast" <> 'Unknown';
  
-----------------------------------------------------------------------------------------------
-- Create genres_movies table
-----------------------------------------------------------------------------------------------
CREATE TABLE genres_movies AS
SELECT 
    show_id,
    title,
    TRIM(unnest(string_to_array(listed_in, ', '))) AS genre
FROM netflix_titles
WHERE listed_in IS NOT NULL;

-----------------------------------------------------------------------------------------------
-- Create country_movies table
-----------------------------------------------------------------------------------------------
CREATE TABLE country_movies AS
SELECT 
    show_id,
    title,
    TRIM(unnest(string_to_array(country, ', '))) AS country
FROM netflix_titles
WHERE country IS NOT NULL;

-----------------------------------------------------------------------------------------------
-- Create rating_description table
-----------------------------------------------------------------------------------------------
-- This table maps each Netflix rating code to a full human-readable description.
-- It is used to make ratings understandable for all users in Power BI visualizations.

CREATE TABLE rating_description (
    rating TEXT PRIMARY KEY,
    description TEXT
);

INSERT INTO rating_description (rating, description) VALUES
('TV-MA', 'Mature Audiences (17+)'),
('TV-14', 'Parents Strongly Cautioned (14+)'),
('TV-PG', 'Parental Guidance Suggested'),
('PG-13', 'Parents Cautioned (under 13)'),
('R', 'Restricted (17+ unless with adult)'),
('G', 'General Audience (All Ages)'),
('NC-17', 'No Children Under 17'),
('TV-Y', 'Suitable for All Children'),
('TV-Y7', 'Suitable for Ages 7+');

