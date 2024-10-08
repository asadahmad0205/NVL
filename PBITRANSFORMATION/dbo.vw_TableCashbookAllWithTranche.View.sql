USE [PBITRANSFORMATION]
GO
/****** Object:  View [dbo].[vw_TableCashbookAllWithTranche]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [dbo].[vw_TableCashbookAllWithTranche] as
SELECT  [Loan_Name]
      ,[Loan_Reference]
      ,cast(case when replace(Amount,',','')='' then '0' else replace(Amount,',','') end as numeric(18,02))  as  [Amount]
      ,[Type]
      ,convert(varchar,[Payment_Date],103) [Payment_Date]
      ,convert(varchar,[Effective_Interest_Date],103) [Effective_Interest_Date]
      ,[Description]
      ,[Include_In_Redemption]
      ,[Interest_Bearing]
      ,[Tranche]
      ,[Lender]
      ,[Borrower]
      ,[Status]
      ,[Funds_Outstanding]
      ,[Month]
      ,[Your_Ref]
      ,[Xero_Code]
      ,[Xero_Date]
      ,[Xero_Code2]
      ,[Debtor Creditor] [Debtor_or_Creditor]
      ,[Our_Ref]
      ,[Source]
      ,1 [Indexn]
      ,[Tranche] [tranche_keys]
	  , case when effective_interest_date<>'' then effective_interest_date else payment_date end tranche_date
	  , tranche Chasbook_Tranche
	  ,case when effective_interest_date<>'' then effective_interest_date else payment_date end  cashbook_tranche_date
  FROM dbo.[Cashbook]
GO
