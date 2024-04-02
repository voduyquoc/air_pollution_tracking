{{ config(materialized='table') }}

with hourly_aqi_cal as (
    select * from {{ ref('hourly_aqi_cal') }}
)
    select *,
    {{ get_aqi_description("hourly_aqi") }} as hourly_aqi_description

    from hourly_aqi_cal