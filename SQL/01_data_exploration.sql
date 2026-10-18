-- =====================================================
-- DIVVY BIKE SHARE | INITIAL DATA EXPLORATION
-- Database: Oracle SQL
-- Raw Table: TEST_USER1.DIVVY_TRIPS
--
-- Reconstructed exploration queries for portfolio
-- documentation. These are read-only queries.
-- =====================================================


-- 1. Inspect the raw table structure

SELECT
    COLUMN_ID,
    COLUMN_NAME,
    DATA_TYPE,
    NULLABLE
FROM USER_TAB_COLUMNS
WHERE TABLE_NAME = 'DIVVY_TRIPS'
ORDER BY COLUMN_ID;


-- 2. Count all imported records
-- Previously documented: 36,328,528 records

SELECT
    COUNT(*) AS TOTAL_RAW_RECORDS
FROM DIVVY_TRIPS;


-- 3. Identify the date range in the raw dataset

SELECT
    MIN(STARTED_AT) AS EARLIEST_RIDE,
    MAX(STARTED_AT) AS LATEST_RIDE
FROM DIVVY_TRIPS;


-- 4. Examine membership categories

SELECT
    MEMBER_CASUAL AS RIDER_TYPE,
    COUNT(*) AS TOTAL_RECORDS
FROM DIVVY_TRIPS
GROUP BY MEMBER_CASUAL
ORDER BY TOTAL_RECORDS DESC;


-- 5. Check missing values in important fields

SELECT
    SUM(CASE WHEN RIDE_ID IS NULL THEN 1 ELSE 0 END)
        AS MISSING_RIDE_IDS,

    SUM(CASE WHEN STARTED_AT IS NULL THEN 1 ELSE 0 END)
        AS MISSING_START_TIMES,

    SUM(CASE WHEN ENDED_AT IS NULL THEN 1 ELSE 0 END)
        AS MISSING_END_TIMES,

    SUM(CASE WHEN MEMBER_CASUAL IS NULL THEN 1 ELSE 0 END)
        AS MISSING_RIDER_TYPES,

    SUM(CASE WHEN START_STATION_NAME IS NULL THEN 1 ELSE 0 END)
        AS MISSING_START_STATIONS

FROM DIVVY_TRIPS;
