with base as (

    select
      SalesReasonKey,
      SalesReasonName,
      SalesReasonReasonType

    from {{ source('sql-server-on-prem', 'DimSalesReason') }} -- noqa: disable=TMP, PRS

)

select *

from base
