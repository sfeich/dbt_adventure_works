/*
This macro takes a single date column (denoting the date of birth) and calculates the corresponding age 
*/

{% macro calculate_age(dob_column) %}
case when dateadd(year, datediff(year, {{ dob_column }}, getdate()), {{ dob_column }}) > getdate()
     then datediff(year, {{ dob_column }}, getdate()) - 1
     else datediff(year, {{ dob_column }}, getdate()) end
{%- endmacro %}

