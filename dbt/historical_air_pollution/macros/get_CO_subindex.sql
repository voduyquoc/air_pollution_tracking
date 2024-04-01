{% macro get_CO_subindex(column_name) -%}
    case 
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 4400 then 1
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 9400 then 2
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 12400 then 3
        when {{ dbt.safe_cast(column_name, api.Column.translate_type("float")) }} < 15400 then 4
        else 5
    end
{%- endmacro %}
