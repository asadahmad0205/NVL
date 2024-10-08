USE [PBITRANSFORMATION]
GO
/****** Object:  Table [dbo].[Cashbook]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cashbook](
	[Loan_Name] [varchar](2000) NULL,
	[Loan_Reference] [varchar](2000) NULL,
	[Amount] [varchar](2000) NULL,
	[Type] [varchar](2000) NULL,
	[Payment_Date] [varchar](2000) NULL,
	[Effective_Interest_Date] [varchar](2000) NULL,
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
	[Debtor Creditor] [varchar](2000) NULL,
	[Our_Ref] [varchar](2000) NULL,
	[Source] [varchar](2000) NULL
) ON [PRIMARY]
GO
