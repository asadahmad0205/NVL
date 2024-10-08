USE [PBITRANSFORMATION]
GO
/****** Object:  UserDefinedFunction [dbo].[F_DATATYPE_CONVERSION_NUMERIC]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   FUNCTION [dbo].[F_DATATYPE_CONVERSION_NUMERIC] (@varcharValue VARCHAR(500))
RETURNS NUMERIC(18, 2)
AS
BEGIN
    DECLARE @numericValue NUMERIC(18, 2)
    SET @numericValue = CAST(case when replace(replace(replace(replace(replace(trim(@varcharValue),',',''),'%',''),'x',''),'#REF!',''),' X â‚¬T45 ','')='' then null else replace(replace(replace(replace(replace(trim(@varcharValue),',',''),'%',''),'x',''),'#REF!',''),' X â‚¬T45 ','') end AS NUMERIC(18, 2))
    RETURN @numericValue
END


GO
