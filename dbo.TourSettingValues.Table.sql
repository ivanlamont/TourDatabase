
CREATE TABLE TourSettingValues(
	ID uniqueidentifier NOT NULL,
	TourSettingID uniqueidentifier NOT NULL,
	Value nvarchar(max) NOT NULL,
	IsDefault bit NOT NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_TourSettingValues PRIMARY KEY CLUSTERED (	ID ASC))
/****** Object:  Index IX_TourSettingValues_TourSettingID ******/
CREATE NONCLUSTERED INDEX IX_TourSettingValues_TourSettingID ON TourSettingValues(	TourSettingID ASC)
GO
ALTER TABLE TourSettingValues  WITH CHECK ADD  CONSTRAINT FK_TourSettingValues_TourSettings_TourSettingID FOREIGN KEY(TourSettingID) REFERENCES TourSettings (ID)
ON DELETE CASCADE
GO
ALTER TABLE TourSettingValues CHECK CONSTRAINT FK_TourSettingValues_TourSettings_TourSettingID
GO
