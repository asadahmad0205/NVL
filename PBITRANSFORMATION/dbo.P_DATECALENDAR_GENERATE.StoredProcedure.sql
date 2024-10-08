USE [PBITRANSFORMATION]
GO
/****** Object:  StoredProcedure [dbo].[P_DATECALENDAR_GENERATE]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_DATECALENDAR_GENERATE]

AS
BEGIN
IF EXISTS (SELECT * FROM information_schema.tables WHERE Table_Name = 'datecalendar' AND Table_Type = 'BASE TABLE')
BEGIN
DROP TABLE datecalendar
END

CREATE TABLE datecalendar
(
    thedate DATE
)

DECLARE @StartDate DATE
DECLARE @EndDate DATE
SET @StartDate = convert(date,'01/01/1990',103)
SET @EndDate = DATEADD(d, 100000, @StartDate)

WHILE @StartDate <= @EndDate
      BEGIN
             INSERT INTO datecalendar
             (
                  thedate
             )
             SELECT
                   @StartDate

             SET @StartDate = DATEADD(dd, 1, @StartDate)
      END


END
GO
