USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_tabletermloan]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view  [dbo].[vw_tabletermloan] as
SELECT  [Loan_Name]
      ,[Loan_Reference]
      ,[Loan_Type]
      ,[Interest_Payments]
      ,[Interest_Rate_Type]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Interest_Year_Basis]) [Interest_Year_Basis]
      ,[dbo].[F_DATATYPE_CONVERSION_DATE]([Interest_Rate_Strike_Date]) [Interest_Rate_Strike_Date]
      ,convert(date,[Effective_Period_Start_Date],103) [Effective_Period_Start_Date]
      ,[dbo].[F_DATATYPE_CONVERSION_DATE]([Effective_Period_End_Date]) [Effective_Period_End_Date]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Base_Rate]) [Base_Rate]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Margin]) [Margin]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Extension_margin]) [Extension_margin]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Annual_Rate]) [Annual_Rate]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC](Annual_rate)/365 [Rate_Per_Day]
      ,[Funder_Interest_Rate_Type]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Funder_Bank_Rate]) [Funder_Bank_Rate]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Funder_Margin_Rate]) [Funder_Margin_Rate]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Cost_Of_Capital]) [Cost_Of_Capital]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Scenario_Funder_Margin_Rate]) [Scenario_Funder_Margin_Rate]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Funder_Rate_Per_Day]) [Funder_Rate_Per_Day]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Exit_fee]) [Exit_fee]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Capital_Repayment]) [Capital_Repayment]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Serviced_Interest]) [Serviced_Interest]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Serviced_Interest_Amount]) [Serviced_Interest_Amount]
      ,[dbo].[F_DATATYPE_CONVERSION_NUMERIC]([Novellus_Monitoring_Fees_AssetManagement]) [Novellus_Monitoring_Fees_AssetManagement]
      ,[dbo].[F_DATATYPE_CONVERSION_DATE]([Contractual_Start_Date]) [Contractual_Start_Date]
      ,[dbo].[F_DATATYPE_CONVERSION_DATE]([TermLoanTable_1stPeriod_StartDate]) [TermLoanTable_1stPeriod_StartDate]
      ,[dbo].[F_DATATYPE_CONVERSION_DATE]([Redemption_Date_for_Reporting]) [Redemption_Date_for_Reporting]
      ,[dbo].[F_DATATYPE_CONVERSION_DATE]([TermLoanTable_LastPeriod_EndDate]) [TermLoanTable_LastPeriod_EndDate]
      ,[Lookup]
  FROM [PBITRANSFORMATION].[dbo].[TableTermLoan]
GO
