{% macro get_O3_subindex(column_name) -%}
    case 
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 60 then 1
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 100 then 2
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 140 then 3
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 180 then 4
        else 5
    end
{%- endmacro %}
