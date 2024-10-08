USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_AccrualsMain1]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   view [dbo].[vw_AccrualsMain1] as
WITH cte AS (
  SELECT
    tcawt.[Loan_Name],[Loan_Reference],[Amount],[Type],[Payment_Date],[Effective_Interest_Date],[Description],[Include_In_Redemption],[Interest_Bearing],[Tranche],
    tcawt.[Lender],
    tcawt.[Borrower],[STATUS],[Funds_Outstanding],[MONTH],[Your_Ref],[Xero_Code],[Xero_Date],[Xero_Code2],[Debtor_or_Creditor],[Our_Ref],[Source],[Indexn],[tranche_keys],[tranche_date],[Chasbook_Tranche],[cashbook_tranche_date],
    TableMasterLoanAll.Bank_Rate_Actual,
    TableMasterLoanAll.Contractual_End_Date,
    TableMasterLoanAll.Contractual_Start_Date,
    cast(
    TableMasterLoanAll.Cost_Of_Capital AS NUMERIC ( 18, 2 )) Cost_Of_Capital,
    TableMasterLoanAll.Exclude_From_BI,
    TableMasterLoanAll.Include_In_CSX_BI,
    TableMasterLoanAll.Interest_Calculation_Type,
    TableMasterLoanAll.Interest_Rate_Change_Frequency,
    TableMasterLoanAll.Interest_Rate_Type,
    TableMasterLoanAll.Interest_Type,
    TableMasterLoanAll.Interest_Year_Basis,
    TableMasterLoanAll.Novellus_Share,
    cast(
    TableMasterLoanAll.Rate_Per_Month_Actual AS NUMERIC ( 18, 2 )) Rate_Per_Month_Actual,
    TableMasterLoanAll.Redemption_Date,
    TableMasterLoanAll.Redemption_Date_For_Reporting,
    TableMasterLoanAll.TermLoans_Table,
    TableMasterLoanAll.Total_Rate_Per_Month_Actual,
  CASE
      
      WHEN tranche_keys LIKE 'R%' THEN
      dateadd (
        DAY,
        1,
      CONVERT ( DATE, CASE WHEN Effective_Interest_Date <> '' THEN Effective_Interest_Date ELSE Payment_Date END, 103 )) ELSE CONVERT ( DATE, CASE WHEN Effective_Interest_Date <> '' THEN Effective_Interest_Date ELSE Payment_Date END, 103 ) 
    END start_date,
CASE
    
    WHEN Bank_Rate_Actual IS NOT NULL 
    AND Bank_Rate_Actual > 0 THEN
      Bank_Rate_Actual * 12 / Interest_Year_Basis ELSE 0.0 
    END Daily_Bank_Rate_Actual,
CASE
    
    WHEN Redemption_Date_For_Reporting IS NOT NULL THEN
    CONVERT ( DATE, Redemption_Date_For_Reporting, 103 ) ELSE cast( getdate () AS DATE ) 
  END Relevant_Date 
FROM
  [PBITRANSFORMATION].[dbo].[vw_TableCashbookAllWithTranche] tcawt
  LEFT OUTER JOIN [dbo].[vw_TableMasterLoanAll] AS TableMasterLoanAll ON loan_reference = TableMasterLoanAll.novellus_ref 
WHERE
  Chasbook_Tranche IS NOT NULL 
  AND Interest_Bearing = 'Yes' 
  AND ( TableMasterLoanAll.TermLoans_Table = 'No' ) 
  AND ( TableMasterLoanAll.Exclude_From_BI = 'No' ) 
  AND Interest_Calculation_Type IN ( 'Simple', 'Compounding  Daily' ) 
  AND Contractual_Start_Date <> '' 
AND
CASE
    
    WHEN Effective_Interest_Date <> '' THEN
    Effective_Interest_Date ELSE Payment_Date 
END IS NOT NULL 
  AND Interest_Rate_Type <> '' 
  ),
  removed_columns AS (
  SELECT
    Loan_Reference,
    Interest_Type,
    Interest_Rate_Type,
    Amount,
    Chasbook_Tranche,
    Start_Date,
    Relevant_Date,
    Rate_Per_Month_Actual,
    Bank_Rate_Actual,
    Interest_Rate_Change_Frequency,
    Contractual_Start_Date,
    Novellus_Share,
    Cost_Of_Capital,
    Interest_Year_Basis,
    Interest_Calculation_Type 
  FROM
    cte 
  ),
  aggregated_cte AS (
  SELECT
    Loan_Reference,
    Interest_Type,
    Interest_Rate_Type,
    Interest_Rate_Change_Frequency,
    Chasbook_Tranche,
     CONVERT (DATE,Start_Date,103) Start_Date,
    CONVERT (DATE,Relevant_Date,103) Relevant_Date,
    Bank_Rate_Actual,
    Rate_Per_Month_Actual,
    CONVERT (DATE,Contractual_Start_Date,103) Contractual_Start_Date,
    Novellus_Share,
    Cost_Of_Capital,
    Interest_Year_Basis,
    Interest_Calculation_Type,
    sum( amount ) amount 
  FROM
    removed_columns 
  GROUP BY
    Loan_Reference,
    Interest_Type,
    Interest_Rate_Type,
    Interest_Rate_Change_Frequency,
    Chasbook_Tranche,
    Start_Date,
     Relevant_Date,
    Bank_Rate_Actual,
    Rate_Per_Month_Actual,
    Contractual_Start_Date,
    Novellus_Share,
    Cost_Of_Capital,
    Interest_Year_Basis,
    Interest_Calculation_Type 
  )
  select aggregated_cte.*,datecalendar.TheDate Day from aggregated_cte
  , datecalendar where Start_Date<= thedate and Relevant_Date>=thedate;



GO
