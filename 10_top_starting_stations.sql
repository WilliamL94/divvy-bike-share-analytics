
/*
Project: Google Data Analytics Capstone — Divvy Bike Share
Chart 6: Top Starting Stations
Period: January 2023 – December 2025

Business Question:
Which starting stations are most frequently used by
annual members and casual riders?

Methodology:
- Count rides by starting station and membership type.
- Exclude missing and blank station names.
- Rank stations separately for members and casual riders.
- Return the top 10 stations for each rider type.

Limitation:
Rides without a recorded starting station are excluded.
*/

WITH station_counts AS (
    SELECT
        MEMBER_CASUAL,
        TRIM(START_STATION_NAME) AS START_STATION_NAME,
        COUNT(*) AS TOTAL_RIDES
    FROM DIVVY_TRIPS_CLEAN
    WHERE STARTED_AT >= DATE '2023-01-01'
      AND STARTED_AT < DATE '2026-01-01'
      AND MEMBER_CASUAL IN ('member', 'casual')
      AND TRIM(START_STATION_NAME) IS NOT NULL
    GROUP BY
        MEMBER_CASUAL,
        TRIM(START_STATION_NAME)
),
ranked_stations AS (
    SELECT
        MEMBER_CASUAL,
        START_STATION_NAME,
        TOTAL_RIDES,
        ROW_NUMBER() OVER (
            PARTITION BY MEMBER_CASUAL
            ORDER BY TOTAL_RIDES DESC, START_STATION_NAME
        ) AS STATION_RANK
    FROM station_counts
)
SELECT
    MEMBER_CASUAL,
    START_STATION_NAME,
    TOTAL_RIDES,
    STATION_RANK
FROM ranked_stations
WHERE STATION_RANK <= 10
ORDER BY MEMBER_CASUAL, STATION_RANK;
  