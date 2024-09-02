USE [PBITRANSFORMATION]
GO
/****** Object:  StoredProcedure [dbo].[P_PBI_TO_DB_DATALOAD_ALL]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_PBI_TO_DB_DATALOAD_ALL]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Table Load TableMasterLoanAll


	select * into [PBITRANSFORMATION].Layer1.TableMasterLoanAll from vw_TableMasterLoanAll;

	select * into [PBITRANSFORMATION].Layer1.TableCashbookAll from vw_tablecashbookall;
END
GO
