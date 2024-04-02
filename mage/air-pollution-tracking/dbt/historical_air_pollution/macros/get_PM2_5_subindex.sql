{% macro get_PM2_5_subindex(column_name) -%}
    case 
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 10 then 1
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 25 then 2
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 50 then 3
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 75 then 4
        else 5
    end
{%- endmacro %}