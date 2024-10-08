USE [PBITRANSFORMATION]
GO
/****** Object:  StoredProcedure [dbo].[P_CompoundInterest_Default]    Script Date: 02/09/2024 17:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[P_CompoundInterest_Default]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- assume this is your table
select * into #tmp from (SELECT  [Novellus_Ref]
      ,[period_start_date]
      ,[period_end_date]
      ,[daily_interest_rate]
      ,[days]
      ,[Initial_amount]
      ,[rateforperiod]
      ,[totalmonths]+1 months
	  ,ROW_NUMBER() over (partition by novellus_ref order by period_start_date) seq
	  ,[Initial_amount] Compound_Interest
	  	  ,[Initial_amount] Monthly_interest
	  ,[Initial_amount] daily_interest
  FROM [PBITRANSFORMATION].[dbo].[vw_AccrualsDefaultTermCompoundbase]
  where 1=2) tmp

-- you need to have a variable for each field. 
DECLARE @Novellus_ref varchar(500)
declare @period_start_date date
declare @period_end_date date
declare @daily_interest_rate numeric(18,4)
declare @days numeric(18,4)
declare @Initial_amount numeric(18,4)
DECLARE @months numeric(18,4)
DECLARE @rateforperiod numeric(18,6)
DECLARE @seq numeric(18,4)
DECLARE @Compound_Interest numeric(18,4)
DECLARE @Compound_Interestt numeric(18,4)



DECLARE db_cursor CURSOR FOR  
    SELECT  [Novellus_Ref]
      ,[period_start_date]
      ,[period_end_date]
      ,[daily_interest_rate]
      ,[days]
      ,[Initial_amount]
      ,[rateforperiod]
      ,[totalmonths]+1 months
	  ,ROW_NUMBER() over (partition by novellus_ref order by period_start_date) seq

  FROM [PBITRANSFORMATION].[dbo].[vw_AccrualsDefaultTermCompoundbase] order by Novellus_Ref,seq

OPEN db_cursor   
FETCH NEXT FROM db_cursor INTO @Novellus_ref,@period_start_date ,@period_end_date ,@daily_interest_rate ,@days ,@Initial_amount,  @rateforperiod ,@months  ,@seq 

WHILE @@FETCH_STATUS = 0   
BEGIN   
    -- insert data into your table using variables
	if @Initial_amount=0
	set @Initial_amount=round(@Compound_Interest,4)

	

	
	set @Compound_Interest=(@Initial_amount*@rateforperiod)+@Initial_amount

		print convert(varchar(500),@Novellus_ref)+ 'Inital Amount'+ convert(varchar(500),@Initial_amount) + 'Compound Amount'+ convert(varchar(500),@Compound_Interest) + '@rateforperiod  '+ convert(varchar(500),@rateforperiod)
  insert into #tmp ([Novellus_Ref]
      ,[period_start_date]
      ,[period_end_date]
      ,[daily_interest_rate]
      ,[days]
      ,[Initial_amount]
      ,[rateforperiod]
	  ,months
	  ,seq
	  ,Compound_Interest
	  ,Monthly_Interest
	  ,Daily_Interest)
    values (@Novellus_ref,@period_start_date ,@period_end_date ,@daily_interest_rate ,@days ,@Initial_amount ,@rateforperiod ,@months ,@seq ,@Compound_Interest,@Compound_Interest-@Initial_amount,(@Compound_Interest-@Initial_amount)/@days)

  -- fetch next row from cursor
	--set @Compound_Interest=(@Initial_amount*@rateforperiod)+@Initial_amount
    FETCH NEXT FROM db_cursor INTO @Novellus_ref,@period_start_date ,@period_end_date ,@daily_interest_rate ,@days ,@Initial_amount ,@rateforperiod,@months  ,@seq      
END   

CLOSE db_cursor   
DEALLOCATE db_cursor
delete from layer1.[AccrualsDefaultTermCompoundmonthly];
insert into layer1.[AccrualsDefaultTermCompoundmonthly]
select * from   #tmp;
END
GO
