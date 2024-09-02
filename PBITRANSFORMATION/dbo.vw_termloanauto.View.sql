USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_termloanauto]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_termloanauto] as 
select Novellus_Ref, Contractual_Start_Date, Redemption_Date_For_Reporting, Total_Rate_Per_Month_Actual, Interest_Year_Basis


,Total_Rate_Per_Month_Actual*12/Interest_Year_Basis Rate_Per_Day

from vw_TableMasterLoanAll where TermLoans_Table='Auto'
and Exclude_From_BI='No'
GO
