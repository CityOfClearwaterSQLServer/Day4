use SQLClass

drop trigger InsertSimpleTwoTableView
go
create trigger InsertSimpleTwoTableView
on SimpleTwoTableView
instead of Insert
as
begin
	insert Sales.Customers (FirstName, LastName, Email)
		select FirstName, LastName, EmailAddress from Inserted

	insert Sales.Sales (InvoiceNum, OrderDate)
		select InvoiceNum, OrderDate from Inserted
end

insert SimpleTwoTableView 
values ('Wilma', 'Flintstone', 'wilma2@bedrock.com', 'INV20151211', GetDate())

