with base as (

    select
       CurrencyKey,
       CurrencyName

    from {{ source('sql-server-on-prem', 'DimCurrency') }} -- noqa: disable=TMP, PRS

)

select *

from base