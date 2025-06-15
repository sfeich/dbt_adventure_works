with base as (

    select
      CustomerKey,
      CustomerAlternateKey,
      GeographyKey,
      FirstName,
      MiddleName,
      LastName,
      BirthDate,
      MaritalStatus,
      Gender,
      YearlyIncome,
      TotalChildren,
      NumberChildrenAtHome,
      EnglishEducation,
      HouseOwnerFlag,
      NumberCarsOwned,
      DateFirstPurchase,
      CommuteDistance

    from {{ source('sql-server-on-prem', 'DimCustomer') }} -- noqa: disable=TMP, PRS

)

select *

from base