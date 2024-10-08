USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_DefaultMainTerm]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE 
    VIEW [dbo].[vw_DefaultMainTerm] AS 
with cashbookdefaultdata as (
SELECT
  "Novellus_Ref",
CASE
    
    WHEN "Interest_Year_Basis" IS NULL THEN
    365 ELSE "Interest_Year_Basis" 
  END "Interest_Year_Basis",
  "Total_Rate_Per_Month_Actual",
  "Default_Interest_Calculation_Type",
  "Default_Interest_Percentage_Actual",
  cast(replace("Default_Loan_Amount",',','') as numeric(18,2))"Default_Loan_Amount",
  "Default_Interest_Actual",
  CONVERT ( DATE, "Contractual_Start_Date", 103 ) "Contractual_Start_Date",
  CONVERT ( DATE, "Default_Start_Date", 103 ) "Default_Start_Date",
  CONVERT ( DATE, "Default_End_Date", 103 ) "Default_End_Date"
FROM
  [PBITRANSFORMATION].[layer1].[TableMasterLoanAll] 
WHERE
  "Default_Start_Date" <> '' 
  AND "Default_End_Date" <> '' 
  AND Default_Loan_Amount IS NOT NULL 
  AND Default_Interest_Percentage_Actual IS NOT NULL 
  AND "Default_Interest_Calculation_Type" = ' Compounding  Monthly '),
  calendardata as (

  select "Novellus_Ref",convert(date,thedate,103) thedate ,year(thedate) +month(thedate)*10000 month from datecalendar, cashbookdefaultdata where "Default_Start_Date"<=convert(date,thedate,103) and "Default_End_Date">=convert(date,thedate,103)
  
  
  ),
  tableexpansion as (
  select "Novellus_Ref",min(thedate) thedate,max(thedate) period_end_date,month from calendardata
  group by "Novellus_Ref",month )



  select cashbookdefaultdata.*,thedate period_start_date,period_end_date,(default_interest_percentage_actual*12)/interest_year_basis daily_interest_rate ,DATEDIFF(day,thedate,[period_end_date])+1 days,case when "Default_Start_Date"=thedate then default_loan_amount else 0 end Initial_amount  from cashbookdefaultdata inner join tableexpansion on tableexpansion."Novellus_Ref"=cashbookdefaultdata."Novellus_Ref"
  --order by tableexpansion."Novellus_Ref",thedate
GO
