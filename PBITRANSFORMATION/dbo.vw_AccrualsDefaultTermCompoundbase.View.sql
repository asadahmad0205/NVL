USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_AccrualsDefaultTermCompoundbase]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_AccrualsDefaultTermCompoundbase] as SELECT [Novellus_Ref]
      ,[Interest_Year_Basis]
      ,[Total_Rate_Per_Month_Actual]
      ,[Default_Interest_Calculation_Type]
      ,[Default_Interest_Percentage_Actual]
      ,[Default_Loan_Amount]
      ,[Default_Interest_Actual]
      ,[Contractual_Start_Date]
      ,[Default_Start_Date]
      ,[Default_End_Date]
      ,[period_start_date]
      ,[period_end_date]
      ,[daily_interest_rate]
      ,[days]
      ,[Initial_amount]
	  ,days*daily_interest_rate/100 rateforperiod
	  ,days*daily_interest_rate/100 *[Initial_amount] interest_amount_initial
	  ,days*daily_interest_rate/100 *[Initial_amount] +[Initial_amount] principal
	  , cast(datediff(month,[Default_Start_Date],[Default_End_Date]) as numeric(18,2)) totalmonths
	  ,lead(days*daily_interest_rate/100 *[Initial_amount] +[Initial_amount]) over (partition by [Novellus_Ref] order by period_start_date asc) principalamaount
  FROM [PBITRANSFORMATION].[dbo].[vw_DefaultMainTerm]
GO
