{% macro get_SO2_subindex(column_name) -%}
    case 
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 20 then 1
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 80 then 2
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 250 then 3
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 350 then 4
        else 5
    end
{%- endmacro %}
