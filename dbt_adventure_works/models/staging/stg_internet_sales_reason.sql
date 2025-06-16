with base as (

    select
      SalesOrderNumber,
      SalesOrderLineNumber,
      SalesReasonKey

    from {{ source('sql-server-on-prem', 'FactInternetSalesReason') }} -- noqa: disable=TMP, PRS

)

select *

from base