with int_customer as (
    

    select *

    from {{ ref('int_customer') }}


)



select CustomerKey
    ,CustomerAlternateKey
    ,GeographyKey
    ,FirstName
    ,MiddleName
    ,LastName
    ,BirthDate
    ,Age
    ,MaritalStatus
    ,Gender
    ,YearlyIncome
    ,TotalChildren
    ,NumberChildrenAtHome
    ,EducationLevel
    ,HouseOwnerFlag
    ,HasChildrenFlag
    ,CarOwnerFlag
    ,NumberCarsOwned
    ,DateFirstPurchase
    ,DaysSinceFirstPurchase 
    ,CommuteDistance 

from int_customer