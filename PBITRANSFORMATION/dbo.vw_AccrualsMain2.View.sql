USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_AccrualsMain2]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vw_AccrualsMain2] as
select am1.*
,Rate_Per_Month_Actual*12 /Interest_Year_Basis Floor_Daily_Interest_Rate
,tar."Interest_Rate"
, case when Interest_Year_Basis is not null and tar.Interest_Rate is not null then tar.Interest_Rate/Interest_Year_Basis else 0 end   Variable_Daily_Interest_Rate
,(Rate_Per_Month_Actual*12 /Interest_Year_Basis)+(case when Interest_Year_Basis is not null and tar.Interest_Rate is not null then tar.Interest_Rate/Interest_Year_Basis else 0 end) Daily_Interest_Rate
,row_number() over (partition by am1.loan_reference order by am1.start_date,am1.day) sort_key
,loan_reference+chasbook_tranche Grouping
,case when start_date=day then amount else 0 end Initial_Amount
from vw_AccrualsMain1 am1 left outer join vw_TABLE_ALLRATES tar on tar.date=am1.day and tar.interest_rate_type=am1.interest_rate_type
GO
