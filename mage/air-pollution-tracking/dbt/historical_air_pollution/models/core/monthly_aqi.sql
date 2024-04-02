{{ config(materialized='table') }}

with monthly_aqi_cal as (
    select * from {{ ref('monthly_aqi_cal') }}
)
    select *,
    {{ get_aqi_description("monthly_aqi") }} as monthly_aqi_description

    from monthly_aqi_cal