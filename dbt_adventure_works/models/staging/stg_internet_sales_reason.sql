with base as (
  
    
    select SalesOrderNumber
      ,SalesOrderLineNumber
      ,SalesReasonKey
     

    from {{ source('sql-server-on-prem', 'FactInternetSalesReason') }}

)


select *

from base