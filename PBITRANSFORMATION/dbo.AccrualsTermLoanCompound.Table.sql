USE [PBITRANSFORMATION]
GO
/****** Object:  Table [dbo].[AccrualsTermLoanCompound]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccrualsTermLoanCompound](
	[Loan_Reference] [varchar](2000) NULL,
	[Interest_Type] [varchar](2000) NULL,
	[Interest_Rate_Type] [varchar](2000) NULL,
	[Amount] [numeric](38, 2) NULL,
	[Chasbook_Tranche] [varchar](2000) NULL,
	[Start_Date] [date] NULL,
	[Relevant_Date] [date] NULL,
	[Rate_Per_Month_Actual] [numeric](18, 2) NULL,
	[Bank_Rate_Actual] [numeric](18, 2) NULL,
	[Interest_Rate_Change_Frequency] [varchar](2000) NULL,
	[Contractual_Start_Date] [varchar](2000) NULL,
	[Novellus_Share] [float] NULL,
	[Cost_Of_Capital] [numeric](18, 2) NULL,
	[Interest_Year_Basis] [numeric](18, 2) NULL,
	[Interest_Calculation_Type] [varchar](2000) NULL,
	[Effective_Period_Start_Date] [date] NULL,
	[Effective_Period_End_Date] [date] NULL,
	[Rate_Per_Day] [numeric](26, 10) NULL,
	[interest_days] [int] NULL,
	[grouping] [varchar](4001) NULL,
	[DAY] [date] NULL,
	[Daily_Interest_Rate] [numeric](22, 6) NULL,
	[rnk] [bigint] NULL,
	[interest_day] [int] NULL,
	[Interest_Rate_Days] [numeric](37, 10) NULL,
	[Initial_Amount] [numeric](38, 2) NULL,
	[Compound_interest] [numeric](38, 2) NULL,
	[Compound_Monthly] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
