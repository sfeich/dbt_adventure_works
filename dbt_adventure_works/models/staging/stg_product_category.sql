with base as (

    select
      ProductCategoryKey,
      EnglishProductCategoryName

    from {{ source('sql-server-on-prem', 'DimProductCategory') }} -- noqa: disable=TMP, PRS

)

select *

from base