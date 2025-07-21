-- Create a route dimension table
CREATE TABLE route (
	route_id INTEGER PRIMARY KEY,
    park_name VARCHAR(160) NOT NULL,
    city_name VARCHAR(160) NOT NULL,
    distance_km FLOAT NOT NULL,
    route_name VARCHAR(160) NOT NULL
);
-- Create a week dimension table
CREATE TABLE week(
	week_id INTEGER PRIMARY KEY,
    week INTEGER NOT NULL,
    month VARCHAR(160) NOT NULL,
    year INTEGER NOT NULL
);

SELECT 
	-- Get the total duration of all runs
	SUM(duration_mins)
FROM 
	runs_fact
-- Get all the week_id's that are from July, 2019
INNER JOIN week_dim ON week_dim.week_id = runs_fact.week_id
WHERE month = 'July' AND year = '2019';

---------------------------------------------------------------------------------------------------------------

-- Add the book_id foreign key
ALTER TABLE fact_booksales ADD CONSTRAINT sales_book
    FOREIGN KEY (book_id) REFERENCES dim_book_star (book_id);
    
-- Add the time_id foreign key
ALTER TABLE fact_booksales ADD CONSTRAINT sales_time
    FOREIGN KEY (time_id) REFERENCES dim_time_star (time_id);
    
-- Add the store_id foreign key
ALTER TABLE fact_booksales ADD CONSTRAINT sales_store
    FOREIGN KEY (store_id) REFERENCES dim_store_star (store_id);

---------------------------------------------------------------------------------------------------------------

-- Create a new table for dim_author with an author column
CREATE TABLE dim_author (
    author varchar(256)  NOT NULL
);

-- Insert authors 
INSERT INTO dim_author
SELECT DISTINCT author FROM dim_book_star;

-- Add a primary key 
ALTER TABLE dim_author ADD COLUMN author_id SERIAL PRIMARY KEY;

-- Output the new table
SELECT * FROM dim_author;

---------------------------------------------------------------------------------------------------------------

-- Output each state and their total sales_amount
SELECT ds.state, SUM(fs.sales_amount)
FROM fact_booksales fs
    -- Join to get book information
    JOIN dim_book_star db ON fs.book_id = db.book_id
    -- Join to get store information
    JOIN dim_store_star ds ON fs.store_id = ds.store_id
-- Get all books with the genre 'novel'
WHERE  
    db.genre = 'novel'
-- Group results by state
GROUP BY
    ds.state;

---------------------------------------------------------------------------------------------------------------

-- Output each state and their total sales_amount
SELECT ds.state, SUM(fs.sales_amount)
FROM fact_booksales fs
    -- Joins for genre
    JOIN dim_book_sf db ON fs.book_id = db.book_id
    JOIN dim_genre_sf dg ON db.genre_id = dg.genre_id
    -- Joins for state
    JOIN dim_store_sf dsf ON fs.store_id = dsf.store_id
    JOIN dim_city_sf dc ON dsf.city_id = dc.city_id
    JOIN dim_state_sf ds ON dc.state_id = ds.state_id
-- Get all books within the novel genre
WHERE  
    dg.genre = 'novel'
-- Group the results by state
GROUP BY
    ds.state;
