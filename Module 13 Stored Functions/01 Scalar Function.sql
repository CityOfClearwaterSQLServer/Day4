use AdventureWorks2014

drop function GetDateVarChar
go
create function GetDateVarChar(@Style varchar(5) = 'Short')
	returns varchar(25)
as
begin
	declare @DateStyle int
	set @DateStyle = 101

	if Lower(@Style) = 'long' or Lower(@Style) = 'l'
		set @DateStyle = 107

	declare @Results varchar(25)
	set @Results = convert(varchar(25), GetDate(), @DateStyle)
	return @Results
end

go
select dbo.GetDateVarChar(default)			as [Short Format]
	 , dbo.GetDateVarChar('Long')			as [Long Format]
	 , dbo.GetDateVarChar('Short')			as [Short Format]
	 , dbo.GetDateVarChar('L')				as [Long Format]









