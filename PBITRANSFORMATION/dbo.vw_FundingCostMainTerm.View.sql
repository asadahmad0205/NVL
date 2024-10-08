USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_FundingCostMainTerm]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[vw_FundingCostMainTerm] as
WITH fundingcstm AS (
  SELECT
    Loan_Reference,
    Amount,
    Effective_Interest_Date,
    STATUS,
    Chasbook_Tranche,
    Cashbook_Tranche_Date,
    row_number() over ( ORDER BY loan_reference, Cashbook_Tranche_Date DESC ) idx,
    CONVERT ( DATE, CASE WHEN Effective_Interest_Date <> '' THEN Effective_Interest_Date ELSE Payment_Date END, 103 ) Payment_Date,
    Private_Investor,
    Interest_Calculation_Type,
    TermLoans_Table,
    Interest_Year_Basis,
    Interest_Rate_Type,
    CONVERT ( DATE, Redemption_Date_For_Reporting, 103 ) Redemption_Date_For_Reporting,
    Funder_Interest_Calculation_Type,
    Funder_Interest_Rate_Type,
    Funder_Margin_Rate,-- Scenario_Funder_Margin_Rate,
    Novellus_Share,
    ( CASE WHEN Scenario_Funder_Margin_Rate IS NULL OR Scenario_Funder_Margin_Rate = 0.00 THEN [dbo].[F_DATATYPE_CONVERSION_NUMERIC]( Funder_Margin_Rate ) ELSE Scenario_Funder_Margin_Rate END / 100 ) Cost_Of_Capital,
    Scenario_Funder_Margin_Rate --,-- Interest_Year_Basis
    
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
    AND TermLoans_Table = 'Yes' 
    AND ( CASE WHEN Scenario_Funder_Margin_Rate IS NULL OR Scenario_Funder_Margin_Rate = 0.00 THEN [dbo].[F_DATATYPE_CONVERSION_NUMERIC]( Funder_Margin_Rate ) ELSE Scenario_Funder_Margin_Rate END / 100 ) IS NOT NULL 
  ),
  fundingcstmday AS ( SELECT *, Cost_Of_Capital / Interest_Year_Basis Floor_Daily_Interest_Rate FROM fundingcstm ) SELECT
  fundingcstmday.*,
  convert(date,Effective_Period_Start_Date,103) Effective_Period_Start_Date,
  Effective_Period_End_Date,
  Funder_Rate_Per_Day
,CASE
    
    WHEN convert(date,Effective_Period_Start_Date,103) IS NOT NULL THEN
      convert(date,Effective_Period_Start_Date,103) ELSE payment_date 
    END payment_date2 
	, case when  CASE
    
    WHEN convert(date,Effective_Period_Start_Date,103) IS NOT NULL THEN
      convert(date,Effective_Period_Start_Date,103) ELSE payment_date 
    END<=convert(date,Effective_Period_Start_Date,103) then DATEDIFF(day,convert(date,Effective_Period_Start_Date,103),Effective_Period_End_Date) 
	when 
	CASE
    
    WHEN convert(date,Effective_Period_Start_Date,103) IS NOT NULL THEN
      convert(date,Effective_Period_Start_Date,103) ELSE payment_date 
    END<Effective_Period_End_Date then datediff(day,Effective_Period_End_Date,CASE
    
    WHEN convert(date,Effective_Period_Start_Date,103) IS NOT NULL THEN
      convert(date,Effective_Period_Start_Date,103) ELSE payment_date 
    END) 
	else 0 end Interest_Days
FROM
  fundingcstmday
  LEFT OUTER JOIN vw_tabletermloan vttl ON fundingcstmday.Loan_Reference = vttl.Loan_Reference 
WHERE
  amount IS NOT NULL 
  AND Funder_Rate_Per_Day IS NOT NULL 
  AND Payment_Date IS NOT NULL 
  AND Effective_Period_Start_Date IS NOT NULL 
  AND Effective_Period_End_Date IS NOT NULL
  --and  fundingcstmday.Loan_Reference='309'
 -- order by cashbook_tranche_date desc

GO
