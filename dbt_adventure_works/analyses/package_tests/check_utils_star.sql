-- noqa: disable=TMP,PRS
select
  {{ dbt_utils.star(source('sql-server-on-prem', 'DimCurrency')) }}

from {{ source('sql-server-on-prem', 'DimCurrency') }}
-- noqa: enable=TMP,PRS