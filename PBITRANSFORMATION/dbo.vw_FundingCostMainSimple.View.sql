USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_FundingCostMainSimple]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_FundingCostMainSimple] as

select *,Daily_Interest_Rate*Amount Daily_Interest_Amount from vw_FundingCostMain
where Interest_Calculation_Type='Simple'
GO
