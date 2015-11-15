use AdventureWorks2014

drop procedure IncreasePrice
go
create procedure IncreasePrice
	@ProductName nvarchar(40) = '%'
as
begin
	set NoCount on

	update Production.Product
	set ListPrice = ListPrice + 1
	where Name like @ProductName

	declare @RowsAffected int
	set @RowsAffected = @@RowCount
	print 'Number of Prices Increased = ' + convert(varchar(10), @RowsAffected)
	return @RowsAffected
end

go
declare @Results int
exec @Results = IncreasePrice '%Red%'

if @Results = 0			print 'Houston we have a problem...'
else					select * from Production.Product
