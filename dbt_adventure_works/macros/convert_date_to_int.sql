{%- macro convert_date_to_int(date_column) -%}

convert(int, convert(varchar(8), {{ date_column }}, 112))

{%- endmacro -%}