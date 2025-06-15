with base as (

    select
      ProductSubcategoryKey,
      ProductCategoryKey,
      EnglishProductSubcategoryName

    from {{ source('sql-server-on-prem', 'DimProductSubcategory') }} -- noqa: disable=TMP, PRS

)

select *

from base