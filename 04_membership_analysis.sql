-- =====================================================
-- DIVVY BIKE SHARE | MEMBERSHIP ANALYSIS
-- Analysis Period: January 2023 - December 2025
-- Source: DIVVY_TRIPS_CLEAN
-- Database: Oracle SQL
-- =====================================================

-- Calculate total rides and percentage by rider type.
-- Each record represents a trip, not a unique customer.

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

-- Verified results:
-- member | 10,921,833 | 63.75%
-- casual |  6,209,374 | 36.25%