with base as (

    select
      PromotionKey,
      EnglishPromotionName,
      DiscountPct,
      EnglishPromotionType,
      EnglishPromotionCategory,
      StartDate,
      EndDate,
      MinQty,
      MaxQty

    from {{ source('sql-server-on-prem', 'DimPromotion') }} -- noqa: disable=TMP, PRS

)

select *

from base