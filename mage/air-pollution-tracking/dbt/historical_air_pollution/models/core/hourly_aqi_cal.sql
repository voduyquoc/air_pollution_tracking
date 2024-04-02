{{ config(materialized='view') }}

with hourly_subindex as (
    select * from {{ ref('hourly_subindex') }}
)
    select *,
    {{ get_SO2_subindex("hourly_SO2") }} as hourly_SO2_sub,
    {{ get_NO2_subindex("hourly_NO2") }} as hourly_NO2_sub,
    {{ get_PM10_subindex("hourly_PM10") }} as hourly_PM10_sub,
    {{ get_PM2_5_subindex("hourly_PM2_5") }} as hourly_PM2_5_sub,
    {{ get_O3_subindex("hourly_O3") }} as hourly_O3_sub,
    {{ get_CO_subindex("hourly_CO") }} as hourly_CO_sub,

    greatest({{ get_SO2_subindex("hourly_SO2") }},
    {{ get_NO2_subindex("hourly_NO2") }},
    {{ get_PM10_subindex("hourly_PM10") }},
    {{ get_PM2_5_subindex("hourly_PM2_5") }},
    {{ get_O3_subindex("hourly_O3") }},
    {{ get_CO_subindex("hourly_CO") }}) as hourly_aqi

    from hourly_subindex