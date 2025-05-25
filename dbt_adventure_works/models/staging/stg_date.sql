with base as (
    
    select DateKey
      ,FullDateAlternateKey
      ,EnglishDayNameOfWeek
      ,EnglishMonthName
      
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
      

    from {{ source('sql-server-on-prem', 'DimDate') }}

)


select *

from base

