with base as (

    select
      SalesTerritoryKey,
      SalesTerritoryAlternateKey,
      SalesTerritoryCountry,
      SalesTerritoryRegion,
      SalesTerritoryGroup

    from {{ source('sql-server-on-prem', 'DimSalesTerritory') }} -- noqa: disable=TMP, PRS

)

select *

from base
