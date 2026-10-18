-- =====================================================
-- DIVVY BIKE SHARE | WEEKDAY VS. WEEKEND ANALYSIS
-- Analysis Period: January 2023 - December 2025
-- Source: DIVVY_TRIPS_CLEAN
-- Database: Oracle SQL
-- =====================================================

-- Classify trips as weekday or weekend using ISO weeks.
-- Saturday = 5, Sunday = 6.

WITH ride_days AS (
    SELECT
        MEMBER_CASUAL AS RIDER_TYPE,
        CASE
            WHEN TRUNC(STARTED_AT) - TRUNC(STARTED_AT, 'IW') IN (5, 6)
                THEN 'Weekend'
            ELSE 'Weekday'
        END AS DAY_TYPE
    FROM DIVVY_TRIPS_CLEAN
    WHERE STARTED_AT >= DATE '2023-01-01'
      AND STARTED_AT < DATE '2026-01-01'
)
SELECT
    RIDER_TYPE,
    DAY_TYPE,
    COUNT(*) AS TOTAL_RIDES,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY RIDER_TYPE),
        2
    ) AS PERCENTAGE_OF_RIDER_TYPE
FROM ride_days
GROUP BY RIDER_TYPE, DAY_TYPE
ORDER BY RIDER_TYPE, DAY_TYPE;

-- Verified results:
-- casual | Weekday | 3,901,927 | 62.84%
-- casual | Weekend | 2,307,447 | 37.16%
-- member | Weekday | 8,311,003 | 76.10%
-- member | Weekend | 2,610,830 | 23.90%