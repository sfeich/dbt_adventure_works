-- noqa: disable=TMP,PRS
{{ simple_cte_star([
       ('base', 'stg_customer')
]) }},
-- noqa: enable=TMP,PRS

enrich as (

    select 
      bas.*,

      -- cast output in more readable format
      case when bas.Gender = 'M' then 'Male'
           when bas.Gender = 'F' then 'Female'
           end as GenderDesc,
      case when bas.MaritalStatus = 'M' then 'Married'
           when bas.MaritalStatus = 'S' then 'Single'
           end as MaritalStatusDesc,
      
      -- add flags
      case when bas.TotalChildren > 0 then 'Yes'
           when bas.TotalChildren = 0 then 'No'
           end as HasChildrenFlag,
      case when bas.HouseOwnerFlag > 0 then 'Yes'
           when bas.HouseOwnerFlag = 0 then 'No'
           end as HouseOwnerFlagAdjusted,
      case when bas.NumberCarsOwned > 0 then 'Yes'
           when bas.NumberCarsOwned = 0 then 'No'
           end as CarOwnerFlag,

      -- calculate date difference since DOB and date first purchase
      datediff(day, bas.DateFirstPurchase, convert(date, getdate())) as DaysSinceFirstPurchase,
      {{ calculate_age('bas.BirthDate') }} as Age -- noqa: disable=TMP,PRS

    from base as bas

),

alias as (

    select 
      CustomerKey,
      CustomerAlternateKey,
      GeographyKey,
      FirstName,
      MiddleName,
      LastName,
      BirthDate,
      Age,
      MaritalStatusDesc as MaritalStatus,
      GenderDesc as Gender,
      YearlyIncome,
      TotalChildren,
      NumberChildrenAtHome,
      EnglishEducation as EducationLevel,
      HouseOwnerFlagAdjusted as HouseOwnerFlag,
      HasChildrenFlag,
      CarOwnerFlag,
      NumberCarsOwned,
      DateFirstPurchase,
      DaysSinceFirstPurchase,
      CommuteDistance 

    from enrich

)

select *

from alias