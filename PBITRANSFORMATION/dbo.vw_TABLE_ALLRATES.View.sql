USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_TABLE_ALLRATES]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_TABLE_ALLRATES] as
SELECT [Date]
      ,[Next_rate_update_quarterly]
      ,[Next_rate_update_monthly] 
      ,[Attribute] Interest_rate_type
      ,[Value] Interest_rate
	  ,value/365 daily_interest_rate
  FROM [PBITRANSFORMATION].[dbo].[TABLE_ALLRATES_load]
GO
