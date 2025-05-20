/*
This macro takes a single date column and converts it into integer of format yyyyMMdd 
*/

{% macro convert_date_to_int(date_column) %}
cast(convert(varchar(8), {{ date_column }}, 112) as int)
{%- endmacro %}