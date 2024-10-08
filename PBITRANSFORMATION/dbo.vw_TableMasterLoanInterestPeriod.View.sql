USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_TableMasterLoanInterestPeriod]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[vw_TableMasterLoanInterestPeriod] as 
select * from (
SELECT [Novellus_Ref]
      ,[Loan_Name]
    
      ,convert(date,[Interest_Period_1_Start],103) [Interest_Period_1_Start]
      ,convert(date,[Interest_Period_1_end],103) [Interest_Period_1_End]
      ,cast(replace([Interest_Period_1_Rate],'%','') as numeric(18,2)) Period_Interest_Rate
      FROM [PBITRANSFORMATION].[layer1].[TableMasterLoanAll]
  where interest_period_1_rate is not null
  and interest_period_1_rate <>''
  and [Interest_Period_1_Start] is not null
  and [Interest_Period_1_Start] <>''
    and [Interest_Period_1_End] is not null
  and [Interest_Period_1_end] <>'') tmlip 

 , datecalendar where [Interest_Period_1_Start]<= convert(date,thedate,103) and [Interest_Period_1_end]>=convert(date,thedate,103)


GO
