USE [PBITRANSFORMATION]
GO
/****** Object:  Table [layer1].[TableMasterLoanInterestPeriod]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [layer1].[TableMasterLoanInterestPeriod](
	[Novellus_Ref] [varchar](2000) NULL,
	[Loan_Name] [varchar](2000) NULL,
	[Interest_Period_1_Start] [date] NULL,
	[Interest_Period_1_End] [date] NULL,
	[Period_Interest_Rate] [numeric](18, 2) NULL,
	[TheDate] [date] NULL
) ON [PRIMARY]
GO
