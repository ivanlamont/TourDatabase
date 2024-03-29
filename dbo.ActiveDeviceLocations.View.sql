create view ActiveDeviceLocations as 

	with trails as (
		SELECT Id
		  ,EventID
		  ,Time
		  ,DeviceTime
		  ,SourceDeviceID
		  ,ObjectID
		  ,Latitude
		  ,Longitude
		  ,Velocity
		  ,Bearing
		  ,SignalStrength
		  ,BatteryCharging
		  ,BatteryStrength	
		  ,RANK() over (partition by SourceDeviceID order by Time desc) as MostRecent
	  FROM LogData
	  where EventID = 0
	)
	select * from Trails where MostRecent = 1

GO
