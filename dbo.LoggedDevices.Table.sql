
CREATE TABLE LoggedDevices(
	ID uniqueidentifier NOT NULL,
	SerialNumber nvarchar(max) NOT NULL,
	VehicleDescription nvarchar(max) NULL,
	InstalledAppVersion float NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_LoggedDevices PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
