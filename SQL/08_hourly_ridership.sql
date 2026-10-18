
/*
Project: Google Data Analytics Capstone — Divvy Bike Share
Analysis: Hourly Riding Patterns
Period: January 2023 – December 2025

Business Question:
How do riding patterns vary by hour of day between
annual members and casual riders?

Purpose:
Aggregate total rides by rider type and starting hour.
The output will be used to create Chart 4 in Tableau.

Output:
MEMBER_CASUAL, RIDE_HOUR, TOTAL_RIDES
*/

SELECT
    MEMBER_CASUAL,
    EXTRACT(HOUR FROM CAST(STARTED_AT AS TIMESTAMP)) AS RIDE_HOUR,
    COUNT(*) AS TOTAL_RIDES
FROM DIVVY_TRIPS_CLEAN
WHERE STARTED_AT >= DATE '2023-01-01'
  AND STARTED_AT < DATE '2026-01-01'
  AND MEMBER_CASUAL IN ('member', 'casual')
GROUP BY
    MEMBER_CASUAL,
    EXTRACT(HOUR FROM CAST(STARTED_AT AS TIMESTAMP))
ORDER BY
    RIDE_HOUR,
    MEMBER_CASUAL;
  