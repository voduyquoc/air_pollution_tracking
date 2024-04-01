{{
    config(
        materialized='table'
    )
}}

with air_pollution_data as (
    select *
    from {{ ref('stg_air_pollution_data') }}
), 
dim_locations as (
    select * from {{ ref('dim_locations') }}
    where Latitude is not null
    and Longitude is not null
)
select air_pollution_data.recordid,
    air_pollution_data.latitude,
    air_pollution_data.longitude,
    dim_locations.City as recorded_city,
    dim_locations.State as recorded_state,
    dim_locations.Country as recorded_country,
    air_pollution_data.recorded_time,
    air_pollution_data.carbon_monoxide_co,
    air_pollution_data.nitrogen_monoxide_no,
    air_pollution_data.nitrogen_dioxide_no2,
    air_pollution_data.ozone_o3,
    air_pollution_data.sulphur_dioxide_so2,
    air_pollution_data.fine_particles_matter_pm2_5,
    air_pollution_data.coarse_particulate_matter_pm10,
    air_pollution_data.ammonia_nh3
from air_pollution_data
inner join dim_locations
on air_pollution_data.latitude = dim_locations.Latitude
and air_pollution_data.longitude = dim_locations.Longitude