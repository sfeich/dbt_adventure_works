WITH base AS (
    
    SELECT ProductSubcategoryKey
      ,ProductCategoryKey
      ,EnglishProductSubcategoryName

    FROM {{ source('sql-server-on-prem', 'DimProductSubcategory') }}

)


SELECT *

FROM base






