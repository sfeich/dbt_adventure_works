with stg_customer as (
    

    select CustomerKey
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

    from {{ ref('stg_customer') }}


),


enrich as (


    select stg.*

      -- cast output in more readable format
      ,case when stg.Gender = 'M' then 'Male'
            when stg.Gender = 'F' then 'Female'
            end as GenderDesc
      ,case when stg.MaritalStatus = 'M' then 'Married'
            when stg.MaritalStatus = 'S' then 'Single'
            end as MaritalStatusDesc
      
      -- add flags
      ,case when stg.TotalChildren > 0 then 'Yes'
            when stg.TotalChildren = 0 then 'No'
            end as HasChildrenFlag
      ,case when stg.HouseOwnerFlag > 0 then 'Yes'
            when stg.HouseOwnerFlag = 0 then 'No'
            end as HouseOwnerFlagAdjusted
      ,case when stg.NumberCarsOwned > 0 then 'Yes'
            when stg.NumberCarsOwned = 0 then 'No'
            end as CarOwnerFlag

      -- calculate date difference since DOB and date first purchase
      ,datediff(day, stg.DateFirstPurchase, convert(date, getdate())) as DaysSinceFirstPurchase 
      ,case when dateadd(year, datediff(year, BirthDate, getdate()), BirthDate) > getdate()
            then datediff(year, BirthDate, getdate()) - 1
            else datediff(year, BirthDate, getdate())
            end as Age

    from stg_customer as stg


),


alias as (


    select CustomerKey
      ,CustomerAlternateKey
      ,GeographyKey
      ,FirstName
      ,MiddleName
      ,LastName
      ,BirthDate
      ,Age
      ,MaritalStatusDesc as MaritalStatus
      ,GenderDesc as Gender
      ,YearlyIncome
      ,TotalChildren
      ,NumberChildrenAtHome
      ,EnglishEducation as EducationLevel
      ,HouseOwnerFlagAdjusted as HouseOwnerFlag
      ,HasChildrenFlag
      ,CarOwnerFlag
      ,NumberCarsOwned
      ,DateFirstPurchase
      ,DaysSinceFirstPurchase 
      ,CommuteDistance 

    from enrich


)



select *

from alias




