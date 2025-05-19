with stg_product as (
    

    select *

    from {{ ref('stg_product') }}

),


stg_product_subcategory as (
    

    select *

    from {{ ref('stg_product_subcategory') }}

),


stg_product_category as (
    

    select *

    from {{ ref('stg_product_category') }}

),


product_enriched as (


    select prd.*
       -- add flag
       ,case when prd.FinishedGoodsFlag > 0 then 'Yes'
             when prd.FinishedGoodsFlag = 0 then 'No'
             end as FinishedGoodsFlagDesc


    from stg_product as prd


),


joined as (


    select prd.ProductKey
      ,prd.ProductAlternateKey
      
      -- product & model names
      ,prd.EnglishProductName
      ,prd.EnglishDescription
      ,prd.ModelName
      ,prd.ProductLine
      ,cat.EnglishProductCategoryName
      ,subcat.EnglishProductSubcategoryName

      -- product qualities
      ,prd.StandardCost
      ,prd.Color
      ,prd.Size
      ,prd.SizeRange
      ,prd.Weight
      ,prd.WeightUnitMeasureCode
      ,prd.SizeUnitMeasureCode
      ,prd.Class
      ,prd.Style
      ,prd.DaysToManufacture     
      ,prd.FinishedGoodsFlagDesc as FinishedGoodsFlag

      -- price & stock/reorder details
      ,prd.SafetyStockLevel
      ,prd.ReorderPoint
      ,prd.ListPrice     
      ,prd.DealerPrice


    from product_enriched as prd 
       left join stg_product_subcategory as subcat 
          on prd.ProductSubcategoryKey = subcat.ProductSubcategoryKey
       left join stg_product_category as cat 
         on subcat.ProductCategoryKey = cat.ProductCategoryKey


)



select *

from joined