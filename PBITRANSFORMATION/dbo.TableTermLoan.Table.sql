USE [PBITRANSFORMATION]
GO
/****** Object:  Table [dbo].[TableTermLoan]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableTermLoan](
	[Loan_Name] [nvarchar](max) NULL,
	[Loan_Reference] [nvarchar](max) NULL,
	[Loan_Type] [nvarchar](max) NULL,
	[Interest_Payments] [nvarchar](max) NULL,
	[Interest_Rate_Type] [nvarchar](max) NULL,
	[Interest_Year_Basis] [nvarchar](max) NULL,
	[Interest_Rate_Strike_Date] [date] NULL,
	[Effective_Period_Start_Date] [date] NULL,
	[Effective_Period_End_Date] [date] NULL,
	[Base_Rate] [nvarchar](max) NULL,
	[Margin] [nvarchar](max) NULL,
	[Extension_margin] [nvarchar](max) NULL,
	[Annual_Rate] [nvarchar](max) NULL,
	[Rate_Per_Day] [nvarchar](max) NULL,
	[Funder_Interest_Rate_Type] [nvarchar](max) NULL,
	[Funder_Bank_Rate] [nvarchar](max) NULL,
	[Funder_Margin_Rate] [nvarchar](max) NULL,
	[Cost_Of_Capital] [nvarchar](max) NULL,
	[Scenario_Funder_Margin_Rate] [nvarchar](max) NULL,
	[Funder_Rate_Per_Day] [nvarchar](max) NULL,
	[Exit_fee] [nvarchar](max) NULL,
	[Capital_Repayment] [nvarchar](max) NULL,
	[Serviced_Interest] [nvarchar](max) NULL,
	[Serviced_Interest_Amount] [nvarchar](max) NULL,
	[Novellus_Monitoring_Fees_AssetManagement] [nvarchar](max) NULL,
	[Contractual_Start_Date] [date] NULL,
	[TermLoanTable_1stPeriod_StartDate] [date] NULL,
	[Redemption_Date_for_Reporting] [date] NULL,
	[TermLoanTable_LastPeriod_EndDate] [date] NULL,
	[Errors] [nvarchar](max) NULL,
	[Lookup] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
