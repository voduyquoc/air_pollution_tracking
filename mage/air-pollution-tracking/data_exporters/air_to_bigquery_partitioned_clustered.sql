CREATE OR REPLACE TABLE `<gcp-project-id>.air_pollution.air_data_partitioned_clustered`
    PARTITION BY DATE(recorded_time)
    CLUSTER BY latitude, longitude AS (
    SELECT * FROM `<gcp-project-id>.air_pollution.air_data_non_partitioned`);