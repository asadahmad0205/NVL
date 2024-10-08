USE [PBITRANSFORMATION]
GO
/****** Object:  UserDefinedFunction [dbo].[F_DATATYPE_CONVERSION_DATE]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   FUNCTION [dbo].[F_DATATYPE_CONVERSION_DATE] (@varcharValue date)
RETURNS date
AS
BEGIN
    DECLARE @DateValue date
    SET @DateValue = convert(date,@varcharValue,103)
    RETURN @DateValue
END


GO
