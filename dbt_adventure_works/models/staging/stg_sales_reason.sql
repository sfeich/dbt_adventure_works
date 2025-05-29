with base as (
    
    select SalesReasonKey
       ,SalesReasonName
       ,SalesReasonReasonType
      

    from {{ source('sql-server-on-prem', 'DimSalesReason') }}

)


select *

from base
