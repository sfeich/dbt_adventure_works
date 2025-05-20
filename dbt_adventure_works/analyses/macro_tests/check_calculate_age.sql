select BirthDate,
   {{ calculate_age('BirthDate') }}

from {{ source('sql-server-on-prem', 'DimCustomer') }}