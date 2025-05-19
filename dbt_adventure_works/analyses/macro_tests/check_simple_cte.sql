{{ simple_cte([
       ('product', 'stg_product'),
       ('subcategory', 'stg_product_subcategory')
]) }}


select prd.*, sub.*

from product as prd
  left join subcategory as sub
     on prd.ProductSubcategoryKey = sub.ProductSubcategoryKey