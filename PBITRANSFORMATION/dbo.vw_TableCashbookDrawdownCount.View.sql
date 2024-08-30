USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_TableCashbookDrawdownCount]    Script Date: 29/08/2024 16:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[vw_TableCashbookDrawdownCount] as
SELECT 
      [Loan_Reference]
	  ,	  count(*) Drawdown_count

  FROM [PBITRANSFORMATION].[dbo].[vw_tablecashbookall]
  where type in ('Drawdown','Initial advance')
  group by [Loan_Reference]

GO
