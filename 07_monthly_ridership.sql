-- =====================================================
-- DIVVY BIKE SHARE | MONTHLY RIDERSHIP TRENDS
-- Analysis Period: January 2023 - December 2025
-- Source: DIVVY_TRIPS_CLEAN
-- Database: Oracle SQL
-- =====================================================

SELECT
    TRUNC(STARTED_AT, 'MM') AS RIDE_MONTH,
    MEMBER_CASUAL AS RIDER_TYPE,
    COUNT(*) AS TOTAL_RIDES
FROM DIVVY_TRIPS_CLEAN
WHERE STARTED_AT >= DATE '2023-01-01'
  AND STARTED_AT < DATE '2026-01-01'
GROUP BY
    TRUNC(STARTED_AT, 'MM'),
    MEMBER_CASUAL
ORDER BY
    RIDE_MONTH,
    RIDER_TYPE;