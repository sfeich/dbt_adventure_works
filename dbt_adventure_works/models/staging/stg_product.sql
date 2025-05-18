WITH base AS (
    
    SELECT ProductKey
      ,ProductAlternateKey
      ,ProductSubcategoryKey
      
      -- product & model names
      ,EnglishProductName
      ,EnglishDescription
      ,ModelName
      ,ProductLine

      -- product qualities
      ,StandardCost
      ,Color
      ,Size
      ,SizeRange
      ,Weight
      ,WeightUnitMeasureCode
      ,SizeUnitMeasureCode
      ,Class
      ,Style
      ,DaysToManufacture     
      ,FinishedGoodsFlag

      -- price & stock/reorder details
      ,SafetyStockLevel
      ,ReorderPoint
      ,ListPrice     
      ,DealerPrice
      

    FROM {{ source('sql-server-on-prem', 'DimProduct') }}

)


SELECT *

FROM base