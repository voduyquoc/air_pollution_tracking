{{ config(materialized='table') }}

with daily_aqi_cal as (
    select * from {{ ref('daily_aqi_cal') }}
)
    select *,
    {{ get_aqi_description("daily_aqi") }} as daily_aqi_description

    from daily_aqi_cal