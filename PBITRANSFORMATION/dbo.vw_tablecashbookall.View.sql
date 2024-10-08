USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_tablecashbookall]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   view [dbo].[vw_tablecashbookall] as 
SELECT  cb.[Loan_Name]
      ,trim([Loan_Reference]) [Loan_Reference]
      ,cast(replace(case when amount='' then null else amount end,',','') as numeric(18,02))  as  [Amount]
      ,[Type]
      ,convert(varchar,[Payment_Date],103) [Payment_Date]
      ,convert(varchar,[Effective_Interest_Date],103) [Effective_Interest_Date]
      ,[Description]
      ,[Include_In_Redemption]
      ,[Interest_Bearing]
      ,[Tranche]
      ,cb.[Lender]
      ,cb.[Borrower]
      ,[Status]
      ,[Funds_Outstanding]
      ,[Month]
      ,[Your_Ref]
      ,[Xero_Code]
      ,[Xero_Date]
      ,[Xero_Code2]
      ,trim([Debtor Creditor]) [Debtor_or_Creditor]
      ,[Our_Ref]
      ,[Source],
	  ROW_NUMBER() over (order by cb.loan_name,[Payment_Date]) Indexn
	 -- , trim([Debtor Creditor]) [Debtor/Creditor],
	  ,Tranche tranche_keys
  FROM [PBITRANSFORMATION].[dbo].[Cashbook] cb left outer join [layer1].[TableMasterLoanAll] md on novellus_ref=Loan_Reference
  where Exclude_From_BI='Yes'
GO
