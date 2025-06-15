-- noqa: disable=TMP,PRS
{{ simple_cte_star([
       ('product', 'stg_product'),
       ('product_subcategory', 'stg_product_subcategory'),
       ('product_category', 'stg_product_category')
]) }},
-- noqa: enable=TMP,PRS

product_enriched as (


    select 
       prd.*
       -- add flag
       ,case when prd.FinishedGoodsFlag > 0 then 'Yes'
             when prd.FinishedGoodsFlag = 0 then 'No'
             end as FinishedGoodsFlagDesc


    from product as prd


),


joined as (


    select 
      prd.ProductKey,
      prd.ProductAlternateKey,
      
      -- product & model names
      prd.EnglishProductName as ProductName,
      prd.EnglishDescription as ProductDescription,
      prd.ModelName,
      prd.ProductLine,
      cat.EnglishProductCategoryName as ProductCategory, 
      subcat.EnglishProductSubcategoryName as ProductSubcategory,

      -- product qualities
      prd.StandardCost,
      prd.Color,
      prd.Size,
      prd.SizeRange,
      prd.Weight,
      prd.WeightUnitMeasureCode,
      prd.SizeUnitMeasureCode,
      prd.Class,
      prd.Style,
      prd.DaysToManufacture,  
      prd.FinishedGoodsFlagDesc as FinishedGoodsFlag,

      -- price & stock/reorder details
      prd.SafetyStockLevel,
      prd.ReorderPoint,
      prd.ListPrice,    
      prd.DealerPrice

    from product_enriched as prd 
       left join product_subcategory as subcat 
          on prd.ProductSubcategoryKey = subcat.ProductSubcategoryKey
       left join product_category as cat 
         on subcat.ProductCategoryKey = cat.ProductCategoryKey

)

select *

from joined