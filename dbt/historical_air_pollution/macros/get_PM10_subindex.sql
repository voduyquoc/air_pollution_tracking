{% macro get_PM10_subindex(column_name) -%}
    case 
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 20 then 1
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 50 then 2
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 100 then 3
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 200 then 4
        else 5
    end
{%- endmacro %}
