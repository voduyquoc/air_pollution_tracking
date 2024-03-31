{{
    config(
        materialized='view'
    )
}}

with airdata as 
(
  select *,
    row_number() over(partition by latitude, longitude, recorded_time) as rn
  from {{ source('staging','air_data_partitioned_clustered') }}
  where latitude is not null and longitude is not null 
)
select
    -- identifiers
    {{ dbt_utils.generate_surrogate_key(['latitude', 'longitude', 'recorded_time']) }} as recordid,
    {{ dbt.safe_cast("latitude", api.Column.translate_type("float")) }} as latitude,
    {{ dbt.safe_cast("longitude", api.Column.translate_type("float")) }} as longitude,

    -- timestamps
    cast(recorded_time as timestamp) as recorded_time,

    -- air info
    {{ dbt.safe_cast("aqi", api.Column.translate_type("integer")) }} as aqi,
    {{ get_aqi_description("aqi") }} as aqi_description,
    {{ dbt.safe_cast("co", api.Column.translate_type("float")) }} as co,
    {{ dbt.safe_cast("no", api.Column.translate_type("float")) }} as "no",
    {{ dbt.safe_cast("no2", api.Column.translate_type("float")) }} as no2,
    {{ dbt.safe_cast("o3", api.Column.translate_type("float")) }} as o3,
    {{ dbt.safe_cast("so2", api.Column.translate_type("float")) }} as so2,
    {{ dbt.safe_cast("pm2_5", api.Column.translate_type("float")) }} as pm2_5,
    {{ dbt.safe_cast("pm10", api.Column.translate_type("float")) }} as pm10,
    {{ dbt.safe_cast("nh3", api.Column.translate_type("float")) }} as nh3,
from airdata
where rn = 1

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}