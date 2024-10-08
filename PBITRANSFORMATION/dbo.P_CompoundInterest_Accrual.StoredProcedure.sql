USE [PBITRANSFORMATION]
GO
/****** Object:  StoredProcedure [dbo].[P_CompoundInterest_Accrual]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_CompoundInterest_Accrual]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- assume this is your table
select * into #tmp from (SELECT  [Loan_Reference]
      ,[Interest_Type]
      ,[Interest_Rate_Type]
      ,[Interest_Rate_Change_Frequency]
      ,[Chasbook_Tranche]
      ,[Start_Date]
      ,[Relevant_Date]
      ,[Bank_Rate_Actual]
      ,[Rate_Per_Month_Actual]
      ,[Contractual_Start_Date]
      ,[Novellus_Share]
      ,[Cost_Of_Capital]
      ,[Interest_Year_Basis]
      ,[Interest_Calculation_Type]
      ,[amount]
      ,[Day]
      ,[Floor_Daily_Interest_Rate]
      ,[Interest_Rate]
      ,[Variable_Daily_Interest_Rate]
      ,[Daily_Interest_Rate]
      ,[sort_key]
      ,[Grouping]
      ,[Initial_Amount]
	  ,[Initial_Amount] Compount_interest
	  ,[Initial_Amount] Monthly_Interest

  FROM [PBITRANSFORMATION].[dbo].[vw_AccrualsMain2]
  where   1=2) tmp

-- you need to have a variable for each field. 
DECLARE @Loan_Reference varchar(500)
DECLARE @Interest_Type varchar(500)
DECLARE @Interest_Rate_Type varchar(500)
DECLARE @Interest_Rate_Change_Frequency varchar(500)
DECLARE @Chasbook_Tranche varchar(500)
DECLARE @Start_Date date
DECLARE @Relevant_Date date
DECLARE @Bank_Rate_Actual numeric(18,4)
DECLARE @Rate_Per_Month_Actual numeric(18,4)
DECLARE @Contractual_Start_Date date
DECLARE @Novellus_Share numeric(18,4)
DECLARE @Cost_Of_Capital numeric(18,4)
DECLARE @Interest_Year_Basis numeric(18,4)
DECLARE @Interest_Calculation_Type varchar(500)
DECLARE @amount numeric(18,4)
DECLARE @Day date
DECLARE @Floor_Daily_Interest_Rate numeric(18,4)
DECLARE @Interest_Rate numeric(18,4)
DECLARE @Variable_Daily_Interest_Rate numeric(18,4)
DECLARE @Daily_Interest_Rate numeric(18,4)
DECLARE @sort_key int
DECLARE @Grouping varchar(500)
DECLARE @Initial_Amount numeric(18,4)
DECLARE @Compound_Interest numeric(18,4)



DECLARE db_cursor CURSOR FOR  
    SELECT [Loan_Reference]
      ,[Interest_Type]
      ,[Interest_Rate_Type]
      ,[Interest_Rate_Change_Frequency]
      ,[Chasbook_Tranche]
      ,[Start_Date]
      ,[Relevant_Date]
      ,[Bank_Rate_Actual]
      ,[Rate_Per_Month_Actual]
      ,[Contractual_Start_Date]
      ,[Novellus_Share]
      ,[Cost_Of_Capital]
      ,[Interest_Year_Basis]
      ,[Interest_Calculation_Type]
      ,[amount]
      ,[Day]
      ,[Floor_Daily_Interest_Rate]
      ,[Interest_Rate]
      ,[Variable_Daily_Interest_Rate]
      ,[Daily_Interest_Rate]
      ,[sort_key]
      ,[Grouping]
      ,[Initial_Amount]
  FROM [PBITRANSFORMATION].[dbo].[vw_AccrualsMain2]
  where Interest_Calculation_Type='Compounding  Daily';


OPEN db_cursor   
FETCH NEXT FROM db_cursor INTO @Loan_Reference
,@Interest_Type
,@Interest_Rate_Type
,@Interest_Rate_Change_Frequency
,@Chasbook_Tranche
,@Start_Date
,@Relevant_Date
,@Bank_Rate_Actual
,@Rate_Per_Month_Actual
,@Contractual_Start_Date
,@Novellus_Share
,@Cost_Of_Capital
,@Interest_Year_Basis
,@Interest_Calculation_Type
,@amount
,@Day
,@Floor_Daily_Interest_Rate
,@Interest_Rate
,@Variable_Daily_Interest_Rate
,@Daily_Interest_Rate
,@sort_key
,@Grouping
,@Initial_Amount 

WHILE @@FETCH_STATUS = 0   
BEGIN   
    -- insert data into your table using variables
	if @Initial_amount=0
	set @Initial_amount=round(@Compound_Interest,4)

	

	
	set @Compound_Interest=(@Initial_amount*@Daily_Interest_Rate/100)+@Initial_amount

		print convert(varchar(500),@Loan_Reference)+ 'Inital Amount'+ convert(varchar(500),@Initial_amount) + 'Compound Amount'+ convert(varchar(500),@Compound_Interest) + '@@Daily_Interest_Rate  '+ convert(varchar(500),@Daily_Interest_Rate)
  insert into #tmp ([Loan_Reference]
      ,[Interest_Type]
      ,[Interest_Rate_Type]
      ,[Interest_Rate_Change_Frequency]
      ,[Chasbook_Tranche]
      ,[Start_Date]
      ,[Relevant_Date]
      ,[Bank_Rate_Actual]
      ,[Rate_Per_Month_Actual]
      ,[Contractual_Start_Date]
      ,[Novellus_Share]
      ,[Cost_Of_Capital]
      ,[Interest_Year_Basis]
      ,[Interest_Calculation_Type]
      ,[amount]
      ,[Day]
      ,[Floor_Daily_Interest_Rate]
      ,[Interest_Rate]
      ,[Variable_Daily_Interest_Rate]
      ,[Daily_Interest_Rate]
      ,[sort_key]
      ,[Grouping]
      ,[Initial_Amount]
	  , Compount_interest
	  ,Monthly_Interest)
    values (@Loan_Reference
,@Interest_Type
,@Interest_Rate_Type
,@Interest_Rate_Change_Frequency
,@Chasbook_Tranche
,@Start_Date
,@Relevant_Date
,@Bank_Rate_Actual
,@Rate_Per_Month_Actual
,@Contractual_Start_Date
,@Novellus_Share
,@Cost_Of_Capital
,@Interest_Year_Basis
,@Interest_Calculation_Type
,@amount
,@Day
,@Floor_Daily_Interest_Rate
,@Interest_Rate
,@Variable_Daily_Interest_Rate
,@Daily_Interest_Rate
,@sort_key
,@Grouping
,@Initial_Amount  ,@Compound_Interest,@Compound_Interest-@Initial_amount)

  -- fetch next row from cursor
	--set @Compound_Interest=(@Initial_amount*@rateforperiod)+@Initial_amount
    FETCH NEXT FROM db_cursor INTO @Loan_Reference
,@Interest_Type
,@Interest_Rate_Type
,@Interest_Rate_Change_Frequency
,@Chasbook_Tranche
,@Start_Date
,@Relevant_Date
,@Bank_Rate_Actual
,@Rate_Per_Month_Actual
,@Contractual_Start_Date
,@Novellus_Share
,@Cost_Of_Capital
,@Interest_Year_Basis
,@Interest_Calculation_Type
,@amount
,@Day
,@Floor_Daily_Interest_Rate
,@Interest_Rate
,@Variable_Daily_Interest_Rate
,@Daily_Interest_Rate
,@sort_key
,@Grouping
,@Initial_Amount     
END   

CLOSE db_cursor   
DEALLOCATE db_cursor
delete from dbo.AccrualsCompound;
insert into dbo.AccrualsCompound
select * from  #tmp;
END
GO
