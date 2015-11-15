use AdventureWorks2014

drop procedure OutputParameter
go
create procedure OutputParameter
	@ProductID		int,
	@ProductName	nvarchar(40)	output,
	@Price			money			output
as
begin
	select @ProductName = Name, @Price = ListPrice
	from Production.Product
	where ProductID = @ProductID
end

go
declare @ID int, @Name nvarchar(40), @Price money
set @ID = 1

exec OutputParameter @ID, @Name output, @Price output
print 'Name = ' + @Name + ' costs $' + convert(varchar(10), @Price)

