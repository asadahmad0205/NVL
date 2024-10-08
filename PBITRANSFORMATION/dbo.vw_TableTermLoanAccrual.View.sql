USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_TableTermLoanAccrual]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vw_TableTermLoanAccrual] as
WITH cte AS (
  SELECT
    tcawt.*,
    Bank_Rate_Actual,
    Contractual_End_Date,
    Contractual_Start_Date,
    Cost_Of_Capital,
    Exclude_From_BI,
    Include_In_CSX_BI,
    Interest_Calculation_Type,
    Interest_Rate_Change_Frequency,
    Interest_Rate_Type,
    Interest_Type,
    Interest_Year_Basis,
    Novellus_Share,
    Rate_Per_Month_Actual,
    Redemption_Date,
    Redemption_Date_For_Reporting,
    TermLoans_Table,
    Total_Rate_Per_Month_Actual,
  CASE
      
      WHEN Effective_Interest_Date IS NOT NULL THEN
      Effective_Interest_Date ELSE payment_date 
    END Start_Date2,
CASE
    
    WHEN Bank_Rate_Actual IS NOT NULL 
    AND Bank_Rate_Actual > 0 THEN
      Bank_Rate_Actual * 12 / Interest_Year_Basis ELSE 0 
    END Daily_Bank_Rate_Actual,
CASE
    
    WHEN CONVERT ( DATE, Redemption_Date_For_Reporting, 103 ) <> '' THEN
    CONVERT ( DATE, Redemption_Date_For_Reporting, 103 ) ELSE cast( getdate () AS DATE ) 
  END Relevant_Date,
  Effective_Interest_Date efid,
  payment_date pd,
CASE
    
    WHEN Tranche LIKE 'R%' THEN
    DATEADD (
      DAY,
      1,
    CONVERT ( DATE, CASE WHEN Effective_Interest_Date <> '' THEN Effective_Interest_Date ELSE payment_date END, 103 )) ELSE CONVERT ( DATE, CASE WHEN Effective_Interest_Date <> '' THEN Effective_Interest_Date ELSE payment_date END, 103 ) 
  END Start_Date 
FROM
  vw_TableCashbookAllWithTranche tcawt
  LEFT OUTER JOIN vw_TableMasterLoanAll ON Novellus_Ref = loan_reference 
WHERE
  Chasbook_Tranche IS NOT NULL 
  AND Interest_Bearing = 'Yes' 
  AND Interest_Calculation_Type IN ( 'Simple', 'Compounding  Daily', 'Compounding  Monthly', 'Compounding  Quarterly' ) 
  AND TermLoans_Table IN ( 'Yes', 'Auto' ) 
  AND Exclude_From_BI = 'No' 
  AND Contractual_Start_Date IS NOT NULL 
  AND Start_Date <> '' 
  AND Interest_Rate_Type IS NOT NULL 
  ),
  cte_aggregated AS (
  SELECT
    Loan_Reference,
    Interest_Type,
    Interest_Rate_Type,
    sum( Amount ) Amount,
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
  GROUP BY
    Loan_Reference,
    Interest_Type,
    Interest_Rate_Type,
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
  ),
  cte_agg_logic AS (
  SELECT
    ca.*,
    Effective_Period_Start_Date,
    Effective_Period_End_Date,
    Rate_Per_Day/100 Rate_Per_Day,
  case when Start_Date<=CONVERT ( DATE, Effective_Period_Start_Date, 103 ) then DATEDIFF(day,CONVERT ( DATE, Effective_Period_Start_Date, 103 ),CONVERT ( DATE, Effective_Period_End_Date, 103 ))
  when Start_Date<CONVERT ( DATE, Effective_Period_End_Date, 103 ) then DATEDIFF(day,CONVERT ( DATE, Start_Date, 103 ),CONVERT ( DATE, Effective_Period_End_Date, 103 )) end interest_days,
CASE
    
    WHEN start_date >= CONVERT ( DATE, Effective_Period_Start_Date, 103 ) 
    AND start_date <= CONVERT ( DATE, Effective_Period_End_Date, 103 ) THEN
      amount ELSE 0 
    END Initial_Amount,
  ca.Loan_Reference + ' ' + chasbook_Tranche grouping,
CASE
    
  WHEN
  CASE
      
      WHEN start_date = CONVERT ( DATE, Effective_Period_Start_Date, 103 ) 
      AND start_date <= CONVERT ( DATE, Effective_Period_End_Date, 103 ) THEN
        amount ELSE 0 
        END <> 0 THEN
        Start_Date ELSE CONVERT ( DATE, Effective_Period_Start_Date, 103 ) 
      END DAY,
      Rate_Per_Day Daily_Interest_Rate 
    FROM
      cte_aggregated ca
      LEFT OUTER JOIN vw_tabletermloan ttl ON ca.Loan_Reference = ttl.Loan_Reference 
    WHERE
      Effective_Period_Start_Date IS NOT NULL 
      AND Effective_Period_End_Date IS NOT NULL 
      --AND ca.Loan_Reference = '309' 
    ) SELECT
    *,
    ROW_NUMBER() over (
      PARTITION BY Loan_Reference 
    ORDER BY
    CASE
        
        WHEN chasbook_tranche = 'Day 1 Advance' THEN
        0 
        WHEN chasbook_tranche LIKE 'R%' THEN
        REPLACE ( chasbook_tranche, 'R', '1' ) ELSE chasbook_tranche 
      END,
    DAY 
    ) rnk ,
	case when interest_days=0 and Initial_Amount=0 then interest_days else interest_days+1 end interest_day
  FROM
    cte_agg_logic 
WHERE
  Interest_Days <> 0
GO
