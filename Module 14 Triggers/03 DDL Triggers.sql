use SQLClass

drop trigger ServerDDLTrigger
on all server
go
create trigger ServerDDLTrigger
on all server
for ddl_login_events
as
begin
	declare @data			xml
	declare @EventType		sysname
	declare @ObjectName		sysname

	set @data = EventData()
	-- print convert(varchar(8000), @data)
	set @EventType = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname')
	set @ObjectName = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname')

	print @EventType
	print @ObjectName
	print 'Server DDL Login Event Detected'
end

go
create login [TestDDLTrigger] 
with password = 'password', default_database=SQLClass
drop login [TestDDLTrigger]


drop trigger DatabaseDDLTrigger
on database
go
create trigger DatabaseDDLTrigger
on database
for create_view, drop_view
as
begin
	declare @data			xml
	declare @EventType		sysname
	declare @ObjectName		sysname

	set @data = EventData()
	-- print convert(varchar(8000), @data)
	set @EventType = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname')
	set @ObjectName = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname')

	print @EventType
	print @ObjectName
	print 'Database DDL Event Detected'
end

go
create view DDLTriggerTestView
as
select * from Manufacturing.Products
go
drop view DDLTriggerTestView