USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_AccrualsDefaultCompound]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[vw_AccrualsDefaultCompound] as
SELECT "Novellus_Ref", case when "Interest_Year_Basis" is null then 365 else "Interest_Year_Basis" end "Interest_Year_Basis" 
, "Total_Rate_Per_Month_Actual", "Default_Interest_Calculation_Type", 
"Default_Interest_Percentage_Actual", "Default_Loan_Amount", 
"Default_Interest_Actual", convert(date,"Contractual_Start_Date",103) "Contractual_Start_Date",
"Default_Start_Date", "Default_End_Date"
  FROM [PBITRANSFORMATION].[layer1].[TableMasterLoanAll]
  where "Default_Start_Date" <>''
  and "Default_End_Date"<>''
  and Default_Loan_Amount is not null
  and Default_Interest_Percentage_Actual is not null
  and "Default_Interest_Calculation_Type"=' Compounding  Monthly '
GO
