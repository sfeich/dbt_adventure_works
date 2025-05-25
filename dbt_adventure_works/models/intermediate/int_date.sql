{{ simple_cte_star([
       ('base', 'stg_date')
]) }},

enrich as (


    select base.*
      
      -- add flags
      ,case when base.DayNumberOfWeek in (1,7) then 'No'
            when base.DayNumberOfWeek between 2 and 6 then 'Yes'
            end as WeekdayFlag

    from base


),


alias as (


    select DateKey
      ,FullDateAlternateKey
      ,EnglishDayNameOfWeek as DayNameOfWeek
      ,EnglishMonthName as MonthName
      
      -- no. in date unit
      ,DayNumberOfWeek     
      ,DayNumberOfMonth
      ,DayNumberOfYear
      ,WeekNumberOfYear   
      ,MonthNumberOfYear
      
      -- calendar dates
      ,CalendarQuarter
      ,CalendarSemester
      ,CalendarYear

      -- fiscal dates  
      ,FiscalQuarter
      ,FiscalSemester
      ,FiscalYear

      -- flags
      ,WeekdayFlag


    from enrich


)



select *

from alias




