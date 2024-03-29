
CREATE TABLE MobileMaps(
	ID uniqueidentifier NOT NULL,
	OwnerID uniqueidentifier NULL,
	StorageID int NOT NULL,
	Engine nvarchar(max) NOT NULL,
	AccessToken nvarchar(max) NULL,
	MinZoom int NULL,
	MaxZoom int NULL,
	TourID uniqueidentifier NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
	Area geography NULL,
 CONSTRAINT PK_MobileMaps PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_MobileMaps_OwnerID ******/
CREATE NONCLUSTERED INDEX IX_MobileMaps_OwnerID ON MobileMaps
(
	OwnerID ASC
)
GO
/****** Object:  Index IX_MobileMaps_TourID ******/
CREATE NONCLUSTERED INDEX IX_MobileMaps_TourID ON MobileMaps
(
	TourID ASC
)
GO
ALTER TABLE MobileMaps  WITH CHECK ADD  CONSTRAINT FK_MobileMaps_Owners_OwnerID FOREIGN KEY(OwnerID)
REFERENCES Owners (ID)
GO
ALTER TABLE MobileMaps CHECK CONSTRAINT FK_MobileMaps_Owners_OwnerID
GO
ALTER TABLE MobileMaps  WITH CHECK ADD  CONSTRAINT FK_MobileMaps_Tours_TourID FOREIGN KEY(TourID)
REFERENCES Tours (ID)
GO
ALTER TABLE MobileMaps CHECK CONSTRAINT FK_MobileMaps_Tours_TourID
GO
