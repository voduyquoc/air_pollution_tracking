CREATE OR REPLACE TABLE `ny-rides-quocvo.air_pollution.air_data_partitioned_clustered`
    PARTITION BY DATE(recorded_time)
    CLUSTER BY latitude, longitude AS (
    SELECT * FROM `ny-rides-quocvo.air_pollution.air_data_non_partitioned`);