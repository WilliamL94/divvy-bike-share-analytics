
/*
Project: Google Data Analytics Capstone — Divvy Bike Share
Chart 5: Bike Type Preferences
Period: January 2023 – December 2025

Business Question:
How do bike type preferences differ between annual members
and casual riders?

Output:
MEMBER_CASUAL, RIDEABLE_TYPE, TOTAL_RIDES, PCT_OF_RIDER_TYPE
*/

SELECT
    MEMBER_CASUAL,
    RIDEABLE_TYPE,
    COUNT(*) AS TOTAL_RIDES,
    ROUND(
        100.0 * COUNT(*) /
        SUM(COUNT(*)) OVER (PARTITION BY MEMBER_CASUAL),
        2
    ) AS PCT_OF_RIDER_TYPE
FROM DIVVY_TRIPS_CLEAN
WHERE STARTED_AT >= DATE '2023-01-01'
  AND STARTED_AT < DATE '2026-01-01'
  AND MEMBER_CASUAL IN ('member', 'casual')
  AND RIDEABLE_TYPE IS NOT NULL
GROUP BY
    MEMBER_CASUAL,
    RIDEABLE_TYPE
ORDER BY
    MEMBER_CASUAL,
    TOTAL_RIDES DESC;
  