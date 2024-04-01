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
    {{ dbt.safe_cast("carbon_monoxide_co", api.Column.translate_type("float")) }} as carbon_monoxide_co,
    {{ dbt.safe_cast("nitrogen_monoxide_no", api.Column.translate_type("float")) }} as nitrogen_monoxide_no,
    {{ dbt.safe_cast("nitrogen_dioxide_no2", api.Column.translate_type("float")) }} as nitrogen_dioxide_no2,
    {{ dbt.safe_cast("ozone_o3", api.Column.translate_type("float")) }} as ozone_o3,
    {{ dbt.safe_cast("sulphur_dioxide_so2", api.Column.translate_type("float")) }} as sulphur_dioxide_so2,
    {{ dbt.safe_cast("fine_particles_matter_pm2_5", api.Column.translate_type("float")) }} as fine_particles_matter_pm2_5,
    {{ dbt.safe_cast("coarse_particulate_matter_pm10", api.Column.translate_type("float")) }} as coarse_particulate_matter_pm10,
    {{ dbt.safe_cast("ammonia_nh3", api.Column.translate_type("float")) }} as ammonia_nh3,
from airdata
where rn = 1

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=false) %}

  limit 100

{% endif %}