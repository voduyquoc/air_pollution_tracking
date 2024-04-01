{{ config(materialized='view') }}

with daily_subindex as (
    select * from {{ ref('daily_subindex') }}
)
    select *,
    {{ get_SO2_subindex("daily_SO2") }} as daily_SO2_sub,
    {{ get_NO2_subindex("daily_NO2") }} as daily_NO2_sub,
    {{ get_PM10_subindex("daily_PM10") }} as daily_PM10_sub,
    {{ get_PM2_5_subindex("daily_PM2_5") }} as daily_PM2_5_sub,
    {{ get_O3_subindex("daily_O3") }} as daily_O3_sub,
    {{ get_CO_subindex("daily_CO") }} as daily_CO_sub,

    greatest({{ get_SO2_subindex("daily_SO2") }},
    {{ get_NO2_subindex("daily_NO2") }},
    {{ get_PM10_subindex("daily_PM10") }},
    {{ get_PM2_5_subindex("daily_PM2_5") }},
    {{ get_O3_subindex("daily_O3") }},
    {{ get_CO_subindex("daily_CO") }}) as daily_aqi

    from daily_subindex