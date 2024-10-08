USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_vw_FundingCostMainTermSimple]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_vw_FundingCostMainTermSimple] as

with cte_initial as (
select *, [Amount]*[floor_Daily_Interest_Rate]*[Interest_Days] Total_Interest

from [dbo].[vw_FundingCostMainTerm]
where Funder_Interest_Calculation_Type=' Simple '
--and loan_reference='309'
), temp_table as
(select "Loan_Reference", "Effective_Period_Start_Date" Start_Date, "Effective_Period_End_Date" Relevant_Date, IDX grouping, "Total_Interest", "Interest_Days" from 
cte_initial
where Total_Interest is not null
and interest_days is not null
and "Effective_Period_End_Date" is not null)

select *,total_interest/interest_days Daily_Interest_Amount from temp_table
 , datecalendar where start_date<= convert(date,thedate,103) and Relevant_Date>=convert(date,thedate,103)


GO
