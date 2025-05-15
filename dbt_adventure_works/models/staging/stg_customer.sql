WITH base AS (
    
    SELECT CustomerKey
      ,CustomerAlternateKey
      ,GeographyKey
      ,FirstName
      ,MiddleName
      ,LastName
      ,BirthDate
      ,MaritalStatus
      ,Gender 
      ,YearlyIncome
      ,TotalChildren
      ,NumberChildrenAtHome
      ,EnglishEducation
      ,HouseOwnerFlag
      ,NumberCarsOwned
      ,DateFirstPurchase
      ,CommuteDistance 

    FROM {{ source('sql-server-on-prem', 'DimCustomer') }}

)


SELECT *

FROM base






