USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_TableTermLoanAccrualSimple]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_TableTermLoanAccrualSimple] as with cte as (
SELECT
  Loan_Reference,
  
  Grouping,
  Daily_Interest_Rate,
  Amount,
  Interest_Year_Basis,
  Amount * Daily_Interest_Rate * interest_day/100 Total_Interest,
  interest_day interest_days
  ,Day Start_Date,
  dateadd(day,interest_day,Day) Relevant_Date
FROM
  vw_TableTermLoanAccrual 
WHERE
  Interest_Calculation_Type = 'Simple'
  )
  select *,Total_Interest/interest_days Daily_Interest_Amount from cte
   , datecalendar where Start_Date<= convert(date,thedate,103) and Relevant_Date>=convert(date,thedate,103)
GO
