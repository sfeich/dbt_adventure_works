{%- macro simple_cte(tuple_list) -%}


{%- set cte_demarcation = ',' ~ '\n\n' -%}

{%- if not tuple_list or tuple_list | length == 0 -%}
    
    {% do exceptions.raise_compiler_error("The tuple_list argument must be a non-empty list of tuples.") %}

{%- endif -%}


with {% for tuple in tuple_list -%} {{ tuple[0] }} as (

    select *   
    
    from {{ ref(tuple[1]) }}

)
    
        {%- if not loop.last -%}
        
            {{ cte_demarcation }}
       
        {%- endif -%}
    
    {%- endfor -%}

{%- endmacro -%}