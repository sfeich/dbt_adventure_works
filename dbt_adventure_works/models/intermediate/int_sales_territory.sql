-- noqa: disable=TMP,PRS
{{ simple_cte_star([
       ('base', 'stg_sales_territory')
]) }},
-- noqa: enable=TMP,PRS

cleaned as (

    select 
      bas.SalesTerritoryKey,
      case when bas.SalesTerritoryAlternateKey = 0 and bas.SalesTerritoryCountry = 'NA' then 'Unknown'
           else bas.SalesTerritoryCountry end as SalesTerritoryCountry,
      case when bas.SalesTerritoryAlternateKey = 0 and bas.SalesTerritoryRegion = 'NA' then 'Unknonw'
           else bas.SalesTerritoryRegion end as SalesTerritoryRegion,
      case when bas.SalesTerritoryAlternateKey = 0 and bas.SalesTerritoryGroup = 'NA' then 'Unknown'
           else bas.SalesTerritoryGroup end as SalesTerritoryGroup

    from base as bas

)

select *

from cleaned