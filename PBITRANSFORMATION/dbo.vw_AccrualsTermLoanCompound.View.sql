USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_AccrualsTermLoanCompound]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_AccrualsTermLoanCompound] as
SELECT  [Loan_Reference]
      ,[Interest_Type]
      ,[Interest_Rate_Type]
      ,[Amount]
      ,[Chasbook_Tranche]
      ,[Rate_Per_Month_Actual]
      ,[Bank_Rate_Actual]
      ,[Interest_Rate_Change_Frequency]
      ,[Contractual_Start_Date]
      ,[Novellus_Share]
      ,[Cost_Of_Capital]
      ,[Interest_Year_Basis]
      ,[Interest_Calculation_Type]
      ,[Effective_Period_Start_Date]
      ,[Effective_Period_End_Date]
      ,[Rate_Per_Day]
      ,[interest_days]
      ,[grouping]
      ,[DAY]
      ,[Daily_Interest_Rate]
      ,[rnk]
      ,[interest_day]
      ,[Interest_Rate_Days]
      ,[Initial_Amount]
      ,[Compound_interest]
      ,[Compound_Monthly]
	  ,DATEADD(day,interest_day-1,convert(date,Day,103)) Relevant_Dates
	  , [Compound_Monthly]/interest_day Daily_Interest
  FROM [PBITRANSFORMATION].[dbo].[AccrualsTermLoanCompound]
    , datecalendar where convert(date,Day,103)<= convert(date,thedate,103) and DATEADD(day,interest_day-1,convert(date,Day,103))>=convert(date,thedate,103)

GO
