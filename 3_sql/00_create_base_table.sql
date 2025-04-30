-- Step 00: Create main table netflix_titles

-- This table will hold all the initial cleaned data from the CSV file.

CREATE TABLE netflix_titles (
    show_id TEXT PRIMARY KEY,
    type TEXT,
    title TEXT,
    director TEXT,
    "cast" TEXT,
    country TEXT,
    date_added DATE,
    release_year INTEGER,
    rating TEXT,
    duration TEXT,
    listed_in TEXT,
    description TEXT,
	duration_num INTEGER,
    duration_unit TEXT,
    period TEXT
);

SELECT * 
FROM netflix_titles;