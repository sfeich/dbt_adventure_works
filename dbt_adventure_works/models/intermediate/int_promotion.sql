-- noqa: disable=TMP,PRS
{{ simple_cte_star([
       ('base','stg_promotion')
]) }},
-- noqa: enable=TMP,PRS

cleaned as (

    select
      PromotionKey,
      EnglishPromotionName as PromotionName, 
      EnglishPromotionType as PromotionType,
      EnglishPromotionCategory as PromotionCategory,
      DiscountPct as DiscountPercentage,
      {{ convert_date_to_int('StartDate') }} as PromotionStartDate, -- noqa: disable=TMP,PRS
      {{ convert_date_to_int('EndDate') }} as PromotionEndDate,     -- noqa: disable=TMP,PRS
      MinQty as MinimumPromotionQuantity,
      MaxQty as MaximumPromotionQuantity

    from base

)

select *

from cleaned