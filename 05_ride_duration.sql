-- =====================================================
-- DIVVY BIKE SHARE | AVERAGE RIDE DURATION
-- Analysis Period: January 2023 - December 2025
-- Source: DIVVY_TRIPS_CLEAN
-- Database: Oracle SQL
-- =====================================================

-- Calculate average trip duration in minutes by rider type.
-- Each record represents one trip, not a unique rider.

SELECT
    MEMBER_CASUAL AS RIDER_TYPE,
    COUNT(*) AS TOTAL_RIDES,
    ROUND(
        AVG(
            (CAST(ENDED_AT AS DATE) - CAST(STARTED_AT AS DATE))
            * 24 * 60
        ),
        2
    ) AS AVG_DURATION_MINUTES
FROM DIVVY_TRIPS_CLEAN
WHERE STARTED_AT >= DATE '2023-01-01'
  AND STARTED_AT < DATE '2026-01-01'
GROUP BY MEMBER_CASUAL
ORDER BY RIDER_TYPE;

-- Verified results:
-- casual |  6,209,374 | 25.35 minutes
-- member | 10,921,833 | 12.55 minutes