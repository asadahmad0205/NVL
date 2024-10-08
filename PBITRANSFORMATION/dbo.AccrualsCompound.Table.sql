USE [PBITRANSFORMATION]
GO
/****** Object:  Table [dbo].[AccrualsCompound]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccrualsCompound](
	[Loan_Reference] [varchar](2000) NULL,
	[Interest_Type] [varchar](2000) NULL,
	[Interest_Rate_Type] [varchar](2000) NULL,
	[Interest_Rate_Change_Frequency] [varchar](2000) NULL,
	[Chasbook_Tranche] [varchar](2000) NULL,
	[Start_Date] [date] NULL,
	[Relevant_Date] [date] NULL,
	[Bank_Rate_Actual] [numeric](18, 2) NULL,
	[Rate_Per_Month_Actual] [numeric](18, 2) NULL,
	[Contractual_Start_Date] [date] NULL,
	[Novellus_Share] [float] NULL,
	[Cost_Of_Capital] [numeric](18, 2) NULL,
	[Interest_Year_Basis] [numeric](18, 2) NULL,
	[Interest_Calculation_Type] [varchar](2000) NULL,
	[amount] [numeric](38, 2) NULL,
	[Day] [date] NULL,
	[Floor_Daily_Interest_Rate] [numeric](38, 17) NULL,
	[Interest_Rate] [float] NULL,
	[Variable_Daily_Interest_Rate] [float] NULL,
	[Daily_Interest_Rate] [float] NULL,
	[sort_key] [bigint] NULL,
	[Grouping] [varchar](4000) NULL,
	[Initial_Amount] [numeric](38, 2) NULL,
	[Compount_interest] [numeric](38, 2) NULL,
	[Monthly_Interest] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
