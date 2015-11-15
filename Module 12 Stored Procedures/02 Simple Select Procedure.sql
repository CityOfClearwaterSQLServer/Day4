use AdventureWorks2014

drop procedure SelectProc
go
create procedure SelectProc
as
begin
	select * from Production.Product
	select * from Production.ProductSubcategory
end

go
exec SelectProc


