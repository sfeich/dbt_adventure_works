-- WeekdayFlag values must align with DayNameOfWeek
-- Therefore return records where either flag indicates no weekday, but day name is weekday
-- or flag indicates weekday, but day name is not a weekday in order to make the test fail.

select DateKey

from {{ ref('dim_date') }}

where  ( WeekdayFlag = 'No' and DayNameOfWeek in ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') )
   or  ( WeekdayFlag = 'Yes' and DayNameOfWeek in ('Saturday', 'Sunday') )
