/*
This macro takes a list of tuples in the form (cte_name, referenced_model) as single argument and generates a sequence
of CTEs composed of select statements listing all fields in the referenced model.
This macro is a simple adaptation of the simple_cte macro.
Sourced from GitLab Data Team repo at https://gitlab.com/gitlab-data/analytics/-/blob/master/transform/snowflake-dbt/macros/utils/simple_cte.sql
*/


{% macro simple_cte_star(tuple_list) %}

with{% for cte_ref in tuple_list %} {{cte_ref[0]}} as (

    select {{ dbt_utils.star( ref(cte_ref[1]) ) }}
    
    from {{ ref(cte_ref[1]) }}

)
    
    {%- if not loop.last -%}
    ,
    {%- endif -%}
    
    {%- endfor -%}

{%- endmacro %}







