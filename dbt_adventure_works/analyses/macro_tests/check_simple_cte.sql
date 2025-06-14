-- noqa: disable=TMP,PRS
{{ simple_cte([
       ('product', 'stg_product'),
       ('subcategory', 'stg_product_subcategory')
]) }}
-- noqa: enable=TMP,PRS

select
    prd.*,
    sub.*

from product as prd
    left join subcategory as sub
        on prd.ProductSubcategoryKey = sub.ProductSubcategoryKey