
create function MetersToDegrees(@meters float, @latitude float) returns float as begin 

	return @meters / (111320 * cos(@latitude * (PI() / 180)))
	
end 
GO
