{#
-- This macro is a slight variation on the standard deduplicate macro implemented for T-SQL.
-- It provides an additional parameter (ties): if set to Y(es) the dedup is performed with ties; else without.
#}
{%- macro adjustable_deduplicate(relation, partition_by, order_by, ties='Y') -%}

{%- if ties == 'Y' -%}

select top 1 with ties *
from {{ relation }}
order by row_number() over (
        partition by {{ partition_by }}
        order by {{ order_by }}
    )

{%- else -%}

select top 1 *
from {{ relation }}
order by row_number() over (
        partition by {{ partition_by }}
        order by {{ order_by }}
    )

{%- endif -%}

{%- endmacro -%}