/*
This macro takes a list of tuples in the form (cte_name, referenced_model) as single argument and generates a sequence
of CTEs composed of select star statements.
Sourced from GitLab Data Team repo at https://gitlab.com/gitlab-data/analytics/-/blob/master/transform/snowflake-dbt/macros/utils/simple_cte.sql
*/

{% macro simple_cte(tuple_list) %}

with{% for cte_ref in tuple_list %} {{cte_ref[0]}} as (

    select * 
    
    from {{ ref(cte_ref[1]) }}

)
    
    {%- if not loop.last -%}
    ,
    {%- endif -%}
    
    {%- endfor -%}

{%- endmacro %}







