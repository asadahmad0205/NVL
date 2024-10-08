USE [PBITRANSFORMATION]
GO
/****** Object:  Table [layer1].[AccrualsDefaultTermCompoundMonthly]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [layer1].[AccrualsDefaultTermCompoundMonthly](
	[Novellus_Ref] [varchar](2000) NULL,
	[period_start_date] [date] NULL,
	[period_end_date] [date] NULL,
	[daily_interest_rate] [numeric](38, 17) NULL,
	[days] [int] NULL,
	[Initial_amount] [numeric](18, 2) NULL,
	[rateforperiod] [numeric](38, 6) NULL,
	[months] [numeric](19, 2) NULL,
	[seq] [bigint] NULL,
	[Compound_Interest] [numeric](18, 2) NULL,
	[Monthly_Interest] [numeric](18, 2) NULL,
	[Daily_Interest] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
