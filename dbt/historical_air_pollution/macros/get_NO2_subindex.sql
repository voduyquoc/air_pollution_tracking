{% macro get_NO2_subindex(column_name) -%}
    case 
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 40 then 1
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 70 then 2
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 150 then 3
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 200 then 4
        else 5
    end
{%- endmacro %}
