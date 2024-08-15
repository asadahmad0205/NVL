create or replace view Calendar as 

WITH CTE_MY_DATE AS (
SELECT DATEADD(day, SEQ4(), '2000-01-01 00:00:00') AS MY_DATE
FROM TABLE(GENERATOR(ROWCOUNT=>20000))
)
SELECT
TO_DATE(MY_DATE) as date
--,TO_TIME(MY_DATE) as time
,TO_TIMESTAMP(MY_DATE) as datetime
,YEAR(MY_DATE) as year
,MONTH(MY_DATE) as month
,MONTHNAME(MY_DATE) as monthname
,DAY(MY_DATE) as day
,DAYOFWEEK(MY_DATE) as dayofweek
,WEEKOFYEAR(MY_DATE) as weekofyear
,DAYOFYEAR(MY_DATE) as dayofyear
--,HOUR(MY_DATE) as hour
,case when quarter(TO_DATE(MY_DATE)) > 2 
         then date_from_parts(year(TO_DATE(MY_DATE)), 04, 01)
         else date_from_parts(year(TO_DATE(MY_DATE)) -1, 04, 01)
       end as Fiscalyearbegins
      ,case when quarter(TO_DATE(MY_DATE)) > 2 
         then date_from_parts(year(TO_DATE(MY_DATE)) +1, 03, 31)
         else date_from_parts(year(TO_DATE(MY_DATE)) ,03, 31)
       end as FiscalyearEnds
FROM CTE_MY_DATE

where TO_DATE(MY_DATE) <=current_date
order by TO_DATE(MY_DATE) desc;