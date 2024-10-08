USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_TableCashbookInitialAdvanceDate]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   view [dbo].[vw_TableCashbookInitialAdvanceDate]
as
select loan_reference,type,payment_date as initial_advance_date from [dbo].[vw_TableCashbookAllWithTranche] 
where type ='Initial advance'
GO
