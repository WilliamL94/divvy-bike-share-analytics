
  CREATE OR REPLACE FORCE EDITIONABLE VIEW "TEST_USER1"."DIVVY_TRIPS_CLEAN" ("RIDE_ID", "RIDEABLE_TYPE", "STARTED_AT", "ENDED_AT", "START_STATION_NAME", "START_STATION_ID", "END_STATION_NAME", "END_STATION_ID", "START_LAT", "START_LNG", "END_LAT", "END_LNG", "MEMBER_CASUAL") AS 
  SELECT
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
FROM (
    SELECT
        t.*,
        ROW_NUMBER() OVER (
            PARTITION BY ride_id
            ORDER BY
                started_at,
                ended_at,
                rideable_type,
                member_casual,
                start_station_name,
                start_station_id,
                end_station_name,
                end_station_id,
                start_lat,
                start_lng,
                end_lat,
                end_lng,
                ROWID
        ) AS rn
    FROM DIVVY_TRIPS t
    WHERE ride_id IS NOT NULL
      AND started_at IS NOT NULL
      AND ended_at IS NOT NULL
      AND ended_at > started_at
)
WHERE rn = 1