use SQLClass

-- DML After Trigger
drop trigger Manufacturing.InsertProducts
go
create trigger InsertProducts
	on Manufacturing.Products
after Insert, Update, Delete								-- or For Insert
as
begin
	declare @RowsInserted int
	select  @RowsInserted = count(*) from Inserted
	print 'Rows in Inserted Table = ' + convert(varchar(10), @RowsInserted)
	select * from Inserted

	declare @RowsDeleted int
	select  @RowsDeleted = count(*) from Deleted
	print 'Rows in Deleted Table = ' + convert(varchar(10), @RowsDeleted)
	select * from Deleted

	--rollback
end
go

insert Manufacturing.Products
(SKU, ProductName, Price, ShortDescription, [Description])
values 
('SKU000001', 'BrontoBurger', 123.45, 'Brontosaurus Burger', 'Yummy Burger...')

update Manufacturing.Products Set ProductName = ProductName

delete Manufacturing.Products where ProductName = 'BrontoBurger'

select * from Manufacturing.Products
