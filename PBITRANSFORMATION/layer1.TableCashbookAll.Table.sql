USE [PBITRANSFORMATION]
GO
/****** Object:  Table [layer1].[TableCashbookAll]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [layer1].[TableCashbookAll](
	[Loan_Name] [varchar](2000) NULL,
	[Loan_Reference] [varchar](2000) NULL,
	[Amount] [varchar](2000) NULL,
	[Type] [varchar](2000) NULL,
	[Payment_Date] [varchar](30) NULL,
	[Effective_Interest_Date] [varchar](30) NULL,
	[Description] [varchar](2000) NULL,
	[Include_In_Redemption] [varchar](2000) NULL,
	[Interest_Bearing] [varchar](2000) NULL,
	[Tranche] [varchar](2000) NULL,
	[Lender] [varchar](2000) NULL,
	[Borrower] [varchar](2000) NULL,
	[Status] [varchar](2000) NULL,
	[Funds_Outstanding] [varchar](2000) NULL,
	[Month] [varchar](2000) NULL,
	[Your_Ref] [varchar](2000) NULL,
	[Xero_Code] [varchar](2000) NULL,
	[Xero_Date] [varchar](2000) NULL,
	[Xero_Code2] [varchar](2000) NULL,
	[Debtor_or_Creditor] [varchar](2000) NULL,
	[Our_Ref] [varchar](2000) NULL,
	[Source] [varchar](2000) NULL,
	[Indexn] [bigint] NULL,
	[tranche_keys] [varchar](2000) NULL
) ON [PRIMARY]
GO
