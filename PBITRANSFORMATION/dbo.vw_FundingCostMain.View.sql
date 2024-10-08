USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_FundingCostMain]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_FundingCostMain] as
with fundingcstm as (SELECT
  Loan_Reference,
  Amount,
  Effective_Interest_Date,
  STATUS,
  Chasbook_Tranche,
  Cashbook_Tranche_Date,
  row_number() over ( ORDER BY loan_reference, Cashbook_Tranche_Date DESC ) idx,
convert(date,CASE
    
    WHEN Effective_Interest_Date <> '' THEN
    Effective_Interest_Date ELSE Payment_Date 
  END,103) Payment_Date,
  Private_Investor,
  Interest_Calculation_Type,
  TermLoans_Table,
  Interest_Year_Basis,
  Interest_Rate_Type,
  convert(date,Redemption_Date_For_Reporting,103) Redemption_Date_For_Reporting,
  Funder_Interest_Calculation_Type,
  Funder_Interest_Rate_Type,
  Funder_Margin_Rate,
 -- Scenario_Funder_Margin_Rate,
  Novellus_Share,
  ( CASE WHEN Scenario_Funder_Margin_Rate IS NULL OR Scenario_Funder_Margin_Rate = 0.00 THEN [dbo].[F_DATATYPE_CONVERSION_NUMERIC]( Funder_Margin_Rate ) ELSE Scenario_Funder_Margin_Rate END / 100 ) Cost_Of_Capital,
  Scenario_Funder_Margin_Rate--,
 -- Interest_Year_Basis 
FROM
  vw_TableCashbookAllWithTranche
  LEFT OUTER JOIN vw_TableMasterLoanAll ON Loan_Reference = novellus_ref 
WHERE
  Loan_Reference <> '-' 
  AND Loan_Reference <> '0' 
  AND Loan_Reference <> '' 
  AND Payment_Date <> '' 
  AND amount IS NOT NULL 
  AND Redemption_Date_For_Reporting <> '' 
  AND Redemption_Date_For_Reporting IS NOT NULL 
  AND TermLoans_Table <> 'Yes' 
  AND ( CASE WHEN Scenario_Funder_Margin_Rate IS NULL OR Scenario_Funder_Margin_Rate = 0.00 THEN [dbo].[F_DATATYPE_CONVERSION_NUMERIC]( Funder_Margin_Rate ) ELSE Scenario_Funder_Margin_Rate END / 100 ) IS NOT NULL
  ), fundingcstmday as 
  (select *,Cost_Of_Capital/Interest_Year_Basis Floor_Daily_Interest_Rate from fundingcstm
  , datecalendar where Payment_Date<= convert(date,thedate,103) and Redemption_Date_For_Reporting>=convert(date,thedate,103)
  )

  select fundingcstmday.*,case when Daily_Interest_Rate is null then 0 else Daily_Interest_Rate end  Variable_Daily_Interest_Rate,
  
  case when Scenario_Funder_Margin_Rate is null or Scenario_Funder_Margin_Rate=0 then Floor_Daily_Interest_Rate+case when Daily_Interest_Rate is null then 0 else Daily_Interest_Rate end  else Floor_Daily_Interest_Rate end Daily_Interest_Rate
  from fundingcstmday left outer join [dbo].[vw_TABLE_ALLRATES] tar on fundingcstmday.thedate=tar.date and fundingcstmday.Funder_Interest_Rate_Type=tar.Interest_Rate_Type


GO
