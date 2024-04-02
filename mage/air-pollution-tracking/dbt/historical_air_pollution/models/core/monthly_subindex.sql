{{ config(materialized='view') }}

with air_data as (
    select * from {{ ref('fact_air_pollution') }}
)
    select 
    -- Grouping 
    recorded_country as country,
    recorded_state as state,
    recorded_city as city,
    {{ dbt.date_trunc("month", "recorded_time") }} as time_month, 

    -- Calculation 
    avg(carbon_monoxide_co) as monthly_CO,
    avg(nitrogen_monoxide_no) as monthly_NO,
    avg(nitrogen_dioxide_no2) as monthly_NO2,
    avg(ozone_o3) as monthly_O3,
    avg(sulphur_dioxide_so2) as monthly_SO2,
    avg(fine_particles_matter_pm2_5) as monthly_PM2_5,
    avg(coarse_particulate_matter_pm10) as monthly_PM10,
    avg(ammonia_nh3) as monthly_NH3
    
    from air_data
    group by 1,2,3,4