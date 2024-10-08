USE [PBITRANSFORMATION]
GO
/****** Object:  StoredProcedure [dbo].[P_CompoundInterest_AccrualFundingCostTermCompound]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_CompoundInterest_AccrualFundingCostTermCompound]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- assume this is your table
select * into #tmp from (SELECT  [Loan_Reference]
      ,[Interest_Type]
      ,[Interest_Rate_Type]
      ,[Amount]
      ,[Chasbook_Tranche]
      ,[Start_Date]
      ,[Relevant_Date]
      ,[Rate_Per_Month_Actual]
      ,[Bank_Rate_Actual]
      ,[Interest_Rate_Change_Frequency]
      ,[Contractual_Start_Date]
      ,[Novellus_Share]
      ,[Cost_Of_Capital]
      ,[Interest_Year_Basis]
      ,[Interest_Calculation_Type]
      ,[Effective_Period_Start_Date]
      ,[Effective_Period_End_Date]
      ,[Rate_Per_Day]
      ,[interest_days]
      ,[grouping]
      ,[DAY]
      ,[Daily_Interest_Rate]
      ,[rnk]
      ,[interest_day]
	  ,[interest_day]*[Daily_Interest_Rate]/100 Interest_Rate_Days
	   ,[Initial_Amount]
	    ,[Initial_Amount] Compound_interest
		 ,[Initial_Amount] Compound_Monthly
  FROM [PBITRANSFORMATION].[dbo].[vw_TableTermLoanAccrual]
  where Interest_Calculation_Type in ('Compounding  Monthly','Compounding Quarterly')
  and   1=2) tmp

-- you need to have a variable for each field. 
DECLARE @Loan_Reference  varchar(500)
DECLARE @Interest_Type varchar(500)
DECLARE @Interest_Rate_Type varchar(500)
DECLARE @Amount numeric(18,4)
DECLARE @Chasbook_Tranche  varchar(500)
DECLARE @Start_Date date
DECLARE @Relevant_Date date
DECLARE @Rate_Per_Month_Actual numeric(18,4)
DECLARE @Bank_Rate_Actual numeric(18,4)
DECLARE @Interest_Rate_Change_Frequency  varchar(500)
DECLARE @Contractual_Start_Date date
DECLARE @Novellus_Share numeric(18,4)
DECLARE @Cost_Of_Capital numeric(18,4)
DECLARE @Interest_Year_Basis numeric(18,4)
DECLARE @Interest_Calculation_Type  varchar(500)
DECLARE @Effective_Period_Start_Date  date
DECLARE @Effective_Period_End_Date date
DECLARE @Rate_Per_Day numeric(18,4)
DECLARE @interest_days numeric(18,4)
DECLARE @grouping  varchar(500)
DECLARE @DAY  date
DECLARE @Daily_Interest_Rate numeric(18,4)
DECLARE @rnk numeric(18,4)
DECLARE @interest_day numeric(18,4)
DECLARE @Interest_Rate_Days numeric(18,4)
DECLARE @Initial_Amount numeric(18,4)
DECLARE @Compound_Interest numeric(18,4)


DECLARE db_cursor CURSOR FOR  
SELECT [Loan_Reference]
      ,[Interest_Type]
      ,[Interest_Rate_Type]
      ,[Amount]
      ,[Chasbook_Tranche]
      ,convert(date,[Start_Date],103) [Start_Date]
      ,convert(date,[Relevant_Date],103) [Relevant_Date]
      ,[Rate_Per_Month_Actual]
      ,[Bank_Rate_Actual]
      ,[Interest_Rate_Change_Frequency]
      ,convert(date,[Contractual_Start_Date],103) [Contractual_Start_Date]
      ,[Novellus_Share]
      ,[Cost_Of_Capital]
      ,[Interest_Year_Basis]
      ,[Interest_Calculation_Type]
      ,convert(date,[Effective_Period_Start_Date],103) [Effective_Period_Start_Date]
      ,convert(date,[Effective_Period_End_Date],103) [Effective_Period_End_Date]
      ,[Rate_Per_Day]
      ,[interest_days]
      ,[grouping]
      ,convert(date,[DAY],103) [DAY]
      ,[Daily_Interest_Rate]
      ,[rnk]
      ,[interest_day]
	  ,[interest_day]*[Daily_Interest_Rate]/100 Interest_Rate_Days
	   ,[Initial_Amount]
  FROM [PBITRANSFORMATION].[dbo].[vw_TableTermLoanAccrual]
  where Interest_Calculation_Type in ('Compounding  Monthly','Compounding Quarterly');


OPEN db_cursor   
FETCH NEXT FROM db_cursor INTO        @Loan_Reference
      ,@Interest_Type
      ,@Interest_Rate_Type
      ,@Amount
      ,@Chasbook_Tranche
      ,@Start_Date
      ,@Relevant_Date
      ,@Rate_Per_Month_Actual
      ,@Bank_Rate_Actual
      ,@Interest_Rate_Change_Frequency
      ,@Contractual_Start_Date
      ,@Novellus_Share
      ,@Cost_Of_Capital
      ,@Interest_Year_Basis
      ,@Interest_Calculation_Type
      ,@Effective_Period_Start_Date
      ,@Effective_Period_End_Date
      ,@Rate_Per_Day
      ,@interest_days
      ,@grouping
      ,@DAY
      ,@Daily_Interest_Rate
      ,@rnk
      ,@interest_day
	  ,@Interest_Rate_Days
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
      ,[Amount]
      ,[Chasbook_Tranche]
      ,[Start_Date]
      ,[Relevant_Date]
      ,[Rate_Per_Month_Actual]
      ,[Bank_Rate_Actual]
      ,[Interest_Rate_Change_Frequency]
      ,[Contractual_Start_Date]
      ,[Novellus_Share]
      ,[Cost_Of_Capital]
      ,[Interest_Year_Basis]
      ,[Interest_Calculation_Type]
      ,[Effective_Period_Start_Date]
      ,[Effective_Period_End_Date]
      ,[Rate_Per_Day]
      ,[interest_days]
      ,[grouping]
      ,[DAY]
      ,[Daily_Interest_Rate]
      ,[rnk]
      ,[interest_day]
	  , Interest_Rate_Days
	   ,[Initial_Amount]
	  , Compound_interest
	  ,Compound_Monthly)
    values (       @Loan_Reference
      ,@Interest_Type
      ,@Interest_Rate_Type
      ,@Amount
      ,@Chasbook_Tranche
      ,@Start_Date
      ,@Relevant_Date
      ,@Rate_Per_Month_Actual
      ,@Bank_Rate_Actual
      ,@Interest_Rate_Change_Frequency
      ,@Contractual_Start_Date
      ,@Novellus_Share
      ,@Cost_Of_Capital
      ,@Interest_Year_Basis
      ,@Interest_Calculation_Type
      ,@Effective_Period_Start_Date
      ,@Effective_Period_End_Date
      ,@Rate_Per_Day
      ,@interest_days
      ,@grouping
      ,@DAY
      ,@Daily_Interest_Rate
      ,@rnk
      ,@interest_day
	  ,@Interest_Rate_Days
	  ,@Initial_Amount  ,@Compound_Interest,@Compound_Interest-@Initial_amount)

  -- fetch next row from cursor
	--set @Compound_Interest=(@Initial_amount*@rateforperiod)+@Initial_amount
    FETCH NEXT FROM db_cursor INTO        @Loan_Reference
      ,@Interest_Type
      ,@Interest_Rate_Type
      ,@Amount
      ,@Chasbook_Tranche
      ,@Start_Date
      ,@Relevant_Date
      ,@Rate_Per_Month_Actual
      ,@Bank_Rate_Actual
      ,@Interest_Rate_Change_Frequency
      ,@Contractual_Start_Date
      ,@Novellus_Share
      ,@Cost_Of_Capital
      ,@Interest_Year_Basis
      ,@Interest_Calculation_Type
      ,@Effective_Period_Start_Date
      ,@Effective_Period_End_Date
      ,@Rate_Per_Day
      ,@interest_days
      ,@grouping
      ,@DAY
      ,@Daily_Interest_Rate
      ,@rnk
      ,@interest_day
	  ,@Interest_Rate_Days
	  ,@Initial_Amount     
END   

CLOSE db_cursor   
DEALLOCATE db_cursor
delete from dbo.AccrualsTermLoanCompound;
insert into dbo.AccrualsTermLoanCompound
select *   from  #tmp;
END
GO
