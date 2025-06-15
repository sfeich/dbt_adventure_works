-- noqa: disable=TMP, PRS
select                         -- noqa: disable=LT09  
    BirthDate as birth_date, 
    {{ calculate_age('BirthDate') }} as age

from {{ source('sql-server-on-prem', 'DimCustomer') }}
-- noqa: enable=TMP, PRS