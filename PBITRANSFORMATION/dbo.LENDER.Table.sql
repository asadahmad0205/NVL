USE [PBITRANSFORMATION]
GO
/****** Object:  Table [dbo].[LENDER]    Script Date: 29/08/2024 16:00:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LENDER](
	[name] [nvarchar](255) NULL,
	[lender_type] [nvarchar](255) NULL,
	[lender_code] [nvarchar](255) NULL,
	[novellus_share] [float] NULL
) ON [PRIMARY]
GO
