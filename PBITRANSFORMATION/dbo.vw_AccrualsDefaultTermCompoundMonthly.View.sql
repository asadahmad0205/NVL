USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_AccrualsDefaultTermCompoundMonthly]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   view [dbo].[vw_AccrualsDefaultTermCompoundMonthly] as
SELECT  [Novellus_Ref]
      ,[period_start_date]
      ,[period_end_date]
      ,[daily_interest_rate]
      ,[days]
      ,[Initial_amount]
      ,[rateforperiod]
      ,[months]
      ,[seq]
      ,[Compound_Interest]
      ,[Monthly_Interest]
      ,[Daily_Interest]
	  ,TheDate
  FROM [PBITRANSFORMATION].[layer1].[AccrualsDefaultTermCompoundMonthly]
  , datecalendar where [period_start_date]<= convert(date,thedate,103) and [period_end_date]>=convert(date,thedate,103)

GO
