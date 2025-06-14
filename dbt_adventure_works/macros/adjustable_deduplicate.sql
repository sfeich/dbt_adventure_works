{%- macro adjustable_deduplicate(model, partition_by, order_by, ties='N') -%}


{%- if ties == 'Y' -%}

select top 1 with ties *

from {{ ref(model) }}
    
order by row_number() over (
    partition by {{ partition_by }}
    order by {{ order_by }}
)


{%- elif ties == 'N' -%}

select top 1 *
    
from {{ ref(model) }}
    
order by row_number() over (
    partition by {{ partition_by }}
    order by {{ order_by }}
)

{%- endif -%}

{%- endmacro -%}