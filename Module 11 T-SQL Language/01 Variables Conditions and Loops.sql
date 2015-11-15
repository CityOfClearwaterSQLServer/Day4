use AdventureWorks2014

-- Variables
declare @ProductID int
set @ProductID = 10
-- select @ProductID = 20

declare @BiggestQuantity int
select @BiggestQuantity = Max(OrderQty) from Sales.SalesOrderDetail

select @ProductID = ProductID 
from Sales.SalesOrderDetail
where OrderQty = @BiggestQuantity

select * from Production.Product where ProductID = @ProductID

select @ProductID as ProductID
print 'ProductID = ' + convert(varchar(10), @ProductID)

-- Conditions
declare @myVar int
set @myVar = 100

if @myVar > 100				print 'My Var is greater than 100.'
else if @myVar = 100		print 'My Var is equal to 100.'
else						print 'My Var is less than 100.'

select
	case
		 when @myVar > 100 then 'My Var is greater than 100.'
		 when @myVar = 100 then 'My Var is equal to 100.'
		 else 'My Var is less than 100.'
	end 

declare @bit bit
set @bit = 0

select
	case @bit
		when 1 then 'True'
		else 'False'
	end

-- Loops
declare @RowNum		int
declare @TotalRows	int
set		@RowNum = 1
select  @TotalRows = count(*) from Production.Product

while @RowNum <= @TotalRows
begin
	-- Display Something
	declare @ProductName varchar(40), @Discontinued Bit
	select 	@ProductName = Name, @Discontinued = MakeFlag
	from Production.Product where ProductID = @RowNum

	if @Discontinued = 0
		print 'Product ' + @ProductName + ' is discontinued.'
	else 
		print 'Product ' + @ProductName + ' is not discontinued.'

	-- Don't Forget to Increment
	set @RowNum = @RowNum + 1
end
