{{ config(materialized='view') }}

with monthly_subindex as (
    select * from {{ ref('monthly_subindex') }}
)
    select *,
    {{ get_SO2_subindex("monthly_SO2") }} as monthly_SO2_sub,
    {{ get_NO2_subindex("monthly_NO2") }} as monthly_NO2_sub,
    {{ get_PM10_subindex("monthly_PM10") }} as monthly_PM10_sub,
    {{ get_PM2_5_subindex("monthly_PM2_5") }} as monthly_PM2_5_sub,
    {{ get_O3_subindex("monthly_O3") }} as monthly_O3_sub,
    {{ get_CO_subindex("monthly_CO") }} as monthly_CO_sub,

    greatest({{ get_SO2_subindex("monthly_SO2") }},
    {{ get_NO2_subindex("monthly_NO2") }},
    {{ get_PM10_subindex("monthly_PM10") }},
    {{ get_PM2_5_subindex("monthly_PM2_5") }},
    {{ get_O3_subindex("monthly_O3") }},
    {{ get_CO_subindex("monthly_CO") }}) as monthly_aqi

    from monthly_subindex