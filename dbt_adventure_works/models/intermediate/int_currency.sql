-- noqa: disable=TMP,PRS
{{ simple_cte_star([
       ('currency', 'stg_currency')
]) }}
-- noqa: enable=TMP,PRS

select *

from currency