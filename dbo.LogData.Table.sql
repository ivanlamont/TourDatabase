
CREATE TABLE LogData(
	Id int IDENTITY(1,1) NOT NULL,
	EventID int NOT NULL,
	Time datetimeoffset NOT NULL,
	DeviceTime datetimeoffset NULL,
	SourceDeviceID uniqueidentifier NULL,
	ObjectID int NULL,
	Latitude float NULL,
	Longitude float NULL,
	Velocity float NULL,
	Bearing float NULL,
	SignalStrength float NULL,
	BatteryCharging bit NULL,
	BatteryStrength float NULL,
 CONSTRAINT PK_LogData PRIMARY KEY CLUSTERED 
(
	Id ASC
)
)
GO
/****** Object:  Index IX_LogData_SourceDeviceID ******/
CREATE NONCLUSTERED INDEX IX_LogData_SourceDeviceID ON LogData
(
	SourceDeviceID ASC
)
GO
ALTER TABLE LogData  WITH CHECK ADD  CONSTRAINT FK_LogData_LoggedDevices_SourceDeviceID FOREIGN KEY(SourceDeviceID)
REFERENCES LoggedDevices (ID)
GO
ALTER TABLE LogData CHECK CONSTRAINT FK_LogData_LoggedDevices_SourceDeviceID
GO
