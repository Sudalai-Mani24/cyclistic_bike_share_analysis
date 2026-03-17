/* Project: Cyclistic Case Study
   Author: Sudalai Mani S
   Description: Data Cleaning and Transformation
*/


---CREATING TABLE STRUCTURE

CREATE TABLE cyclistic_trips (
    ride_id VARCHAR(255) PRIMARY KEY,
    rideable_type VARCHAR(50),
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    start_station_name VARCHAR(255),
    start_station_id VARCHAR(100),
    end_station_name VARCHAR(255),
    end_station_id VARCHAR(100),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual VARCHAR(50)
);

---DATA CLEANING SCRIPTS

--##Cleaning Script

-- 1. Create a new table for cleaned data
CREATE TABLE cyclistic_trips_cleaned AS
SELECT 
    DISTINCT ride_id, -- Approach A: Deduplication (removes any double-logged trips)
    rideable_type,
    started_at,
    ended_at,
    -- Approach C: Structural Standardization (removes accidental spaces and fixes casing)
    TRIM(LOWER(start_station_name)) AS start_station_name,
    start_station_id,
    TRIM(LOWER(end_station_name)) AS end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
FROM cyclistic_trips
-- Approach B: Handling Nulls (Removing rows where we don't know the rider type or start time)
WHERE start_station_name IS NOT NULL 
  AND end_station_name IS NOT NULL
  AND member_casual IS NOT NULL
-- Approach D: Outlier Removal (Business Logic)
  AND (ended_at - started_at) > INTERVAL '1 minute'  -- Removes accidental docks
  AND (ended_at - started_at) < INTERVAL '24 hours' -- Removes stolen/lost bikes
-- Approach C: Removing "Test" data
  AND start_station_name NOT LIKE '%test%'
  AND start_station_name NOT LIKE '%hq%';


--##compare the row counts to see how much data's are removed

SELECT 
    (SELECT COUNT(*) FROM cyclistic_trips) AS raw_count,
    (SELECT COUNT(*) FROM cyclistic_trips_cleaned) AS cleaned_count,
    (SELECT COUNT(*) FROM cyclistic_trips) - (SELECT COUNT(*) FROM cyclistic_trips_cleaned) AS rows_removed;



CREATE TABLE cyclistic_final_analysis AS
SELECT 
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    (ended_at - started_at) AS ride_length,
    EXTRACT(DOW FROM started_at) AS day_of_week,
    member_casual,
    -- Labeling rows with missing stations so we can filter them easily later
    CASE 
        WHEN start_station_name IS NULL OR end_station_name IS NULL THEN 'Missing Station'
        ELSE 'Complete'
    END AS data_quality_flag
FROM cyclistic_trips
WHERE (ended_at - started_at) > INTERVAL '1 minute' 
  AND (ended_at - started_at) < INTERVAL '24 hours'
  AND member_casual IS NOT NULL;

SELECT 
    member_casual,
    AVG(ended_at - started_at) AS avg_ride_duration,
    MAX(ended_at - started_at) AS max_ride_duration,
    MIN(ended_at - started_at) AS min_ride_duration
FROM cyclistic_trips
-- Applying our cleaning filters on the fly
WHERE (ended_at - started_at) > INTERVAL '1 minute' 
  AND (ended_at - started_at) < INTERVAL '24 hours'
GROUP BY member_casual;


--DATA TRANSFORMATION SCRIPT

--Calculating ride length in minutes and extracting day of week/month from the
   raw timestamps 

SELECT 
    ride_id,
    member_casual,
    -- Calculate duration in minutes by extracting epoch seconds
    EXTRACT(EPOCH FROM (ended_at - started_at)) / 60 AS ride_length_m,
    -- Extract Day of Week (0 = Sunday, 6 = Saturday)
    EXTRACT(DOW FROM started_at) AS day_of_week,
    -- Extract Month for seasonality analysis
    EXTRACT(MONTH FROM started_at) AS month_num
FROM cyclistic_trips
WHERE 
    (ended_at - started_at) > INTERVAL '1 minute' -- Filtering false starts
    AND (ended_at - started_at) < INTERVAL '24 hours'; -- Removing outliers


---DATA AGGREGATION SCRIPT

---Top 10 station list of causal riders

SELECT 
    start_station_name,
    COUNT(*) AS total_rides
FROM cyclistic_trips
WHERE member_casual = 'casual'
  AND start_station_name IS NOT NULL
GROUP BY start_station_name
ORDER BY total_rides DESC
LIMIT 10;