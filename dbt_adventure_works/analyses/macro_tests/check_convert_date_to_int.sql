select BirthDate,
   {{ convert_date_to_int('BirthDate') }}

from {{ source('sql-server-on-prem', 'DimCustomer') }}