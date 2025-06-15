with base as (

    select 
      ProductKey,
      ProductAlternateKey,
      ProductSubcategoryKey,
          
      -- product & model names
      EnglishProductName,
      EnglishDescription,
      ModelName,
      ProductLine,

      -- product qualities
      StandardCost,
      Color,
      Size,
      SizeRange,
      Weight,
      WeightUnitMeasureCode,
      SizeUnitMeasureCode,
      Class,
      Style,
      DaysToManufacture,   
      FinishedGoodsFlag,
      
      -- price & stock/reorder details
      SafetyStockLevel,
      ReorderPoint,
      ListPrice ,    
      DealerPrice
      
    from {{ source('sql-server-on-prem', 'DimProduct') }} -- noqa: disable=TMP, PRS

)

select *

from base