{#
    This macro returns the description of the aqi 
#}

{% macro get_aqi_description(aqi) -%}

    case {{ dbt.safe_cast(aqi, api.Column.translate_type("integer")) }}  
        when 1 then 'Good'
        when 2 then 'Fair'
        when 3 then 'Moderate'
        when 4 then 'Poor'
        when 5 then 'Very Poor'
        else 'EMPTY'
    end

{%- endmacro %}