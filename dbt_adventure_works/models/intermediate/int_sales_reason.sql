{{ simple_cte_star([
       ('sales_reason','stg_sales_reason')
]) }},

default_value_added as (


        select 0 as SalesReasonKey,
          'Unknown' as SalesReasonName,
          'Unknown' as SalesReasonReasonType
    

        union all


        select SalesReasonKey,
           SalesReasonName,
           SalesReasonReasonType

        from sales_reason

),


aliased as (


         select SalesReasonKey,
           SalesReasonName,
           SalesReasonReasonType as SalesReasonType

        from default_value_added

)



select *


from aliased



