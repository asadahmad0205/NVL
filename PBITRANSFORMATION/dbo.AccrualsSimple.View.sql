USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[AccrualsSimple]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AccrualsSimple] as 
select *, amount*Daily_Interest_Rate  Daily_Interest_Amount from vw_AccrualsMain2
where Interest_Calculation_Type='Simple'
GO
