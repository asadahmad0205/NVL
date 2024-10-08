USE [PBITRANSFORMATION]
GO
/****** Object:  Table [dbo].[TABLE_ALLRATES_load]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TABLE_ALLRATES_load](
	[Date] [date] NOT NULL,
	[Next_rate_update_quarterly] [date] NOT NULL,
	[Next_rate_update_monthly] [date] NOT NULL,
	[Attribute] [nvarchar](500) NOT NULL,
	[Value] [float] NOT NULL
) ON [PRIMARY]
GO
