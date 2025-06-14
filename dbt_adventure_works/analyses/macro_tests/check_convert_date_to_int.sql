-- noqa: disable=TMP, PRS
select BirthDate as birth_date_raw
   {{ convert_date_to_int('BirthDate') }} as birth_date_converted

from {{ source('sql-server-on-prem', 'DimCustomer') }}
-- noqa: enable=TMP, PRS