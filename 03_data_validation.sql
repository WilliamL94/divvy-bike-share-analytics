-- =====================================================
-- DIVVY BIKE SHARE | DATA VALIDATION
-- Analysis Period: January 2023 - December 2025
-- Database: Oracle SQL
-- Source View: DIVVY_TRIPS_CLEAN
-- =====================================================


-- VALIDATION 1: Total cleaned rides
-- Expected Result: 35,686,178

SELECT
    COUNT(*) AS TOTAL_CLEANED_RIDES
FROM DIVVY_TRIPS_CLEAN;


-- VALIDATION 2: Total rides in analysis period
-- Expected Result: 17,131,207

SELECT
    COUNT(*) AS TOTAL_ANALYSIS_RIDES
FROM DIVVY_TRIPS_CLEAN
WHERE STARTED_AT >= DATE '2023-01-01'
  AND STARTED_AT < DATE '2026-01-01';
  
-- VALIDATION 3: Member vs. Casual Rider Distribution
-- Analysis Period: January 2023 - December 2025
-- Verified Results:
-- Member: 10,921,833 rides (63.75%)
-- Casual: 6,209,374 rides (36.25%)

SELECT
    MEMBER_CASUAL AS RIDER_TYPE,
    COUNT(*) AS TOTAL_RIDES,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS PERCENTAGE_OF_RIDES
FROM DIVVY_TRIPS_CLEAN
WHERE STARTED_AT >= DATE '2023-01-01'
  AND STARTED_AT < DATE '2026-01-01'
GROUP BY MEMBER_CASUAL
ORDER BY TOTAL_RIDES DESC;