WITH base AS (
    
    SELECT ProductCategoryKey
     ,EnglishProductCategoryName
    
    FROM {{ source('sql-server-on-prem', 'DimProductCategory') }}

)


SELECT *

FROM base






