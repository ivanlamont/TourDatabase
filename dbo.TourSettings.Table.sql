
CREATE TABLE TourSettings(
	ID uniqueidentifier NOT NULL,
	TourID uniqueidentifier NOT NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_TourSettings PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_TourSettings_TourID ******/
CREATE NONCLUSTERED INDEX IX_TourSettings_TourID ON TourSettings
(
	TourID ASC
)
GO
ALTER TABLE TourSettings  WITH CHECK ADD  CONSTRAINT FK_TourSettings_Tours_TourID FOREIGN KEY(TourID)
REFERENCES Tours (ID)
ON DELETE CASCADE
GO
ALTER TABLE TourSettings CHECK CONSTRAINT FK_TourSettings_Tours_TourID
GO
