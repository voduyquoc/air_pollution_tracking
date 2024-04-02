{{ config(materialized='table') }}

select 
    Latitude,
    Longitude, 
    City, 
    State, 
    Country 
from {{ ref('location_lookup') }}