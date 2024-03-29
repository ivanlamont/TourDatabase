
CREATE TABLE Triggers(
	ID uniqueidentifier NOT NULL,
	OwnerID uniqueidentifier NULL,
	PlaceID uniqueidentifier NULL,
	MediaListID uniqueidentifier NOT NULL,
	ConditionID uniqueidentifier NULL,
	TypeFlags int NULL,
	TourLayerID uniqueidentifier NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_Triggers PRIMARY KEY CLUSTERED (	ID ASC))
GO
/****** Object:  Index IX_Triggers_ConditionID ******/
CREATE NONCLUSTERED INDEX IX_Triggers_ConditionID ON Triggers
(	ConditionID ASC)
GO
/****** Object:  Index IX_Triggers_MediaListID ******/
CREATE NONCLUSTERED INDEX IX_Triggers_MediaListID ON Triggers
(	MediaListID ASC)
GO
/****** Object:  Index IX_Triggers_OwnerID ******/
CREATE NONCLUSTERED INDEX IX_Triggers_OwnerID ON Triggers
(	OwnerID ASC)
GO
/****** Object:  Index IX_Triggers_PlaceID ******/
CREATE NONCLUSTERED INDEX IX_Triggers_PlaceID ON Triggers
(	PlaceID ASC)
GO
/****** Object:  Index IX_Triggers_TourLayerID ******/
CREATE NONCLUSTERED INDEX IX_Triggers_TourLayerID ON Triggers
(TourLayerID ASC)
GO
ALTER TABLE Triggers  WITH CHECK ADD  CONSTRAINT FK_Triggers_Conditions_ConditionID FOREIGN KEY(ConditionID)
REFERENCES Conditions (ID)
GO
ALTER TABLE Triggers CHECK CONSTRAINT FK_Triggers_Conditions_ConditionID
GO
ALTER TABLE Triggers  WITH CHECK ADD  CONSTRAINT FK_Triggers_MediaLists_MediaListID FOREIGN KEY(MediaListID)
REFERENCES MediaLists (ID)
ON DELETE CASCADE
GO
ALTER TABLE Triggers CHECK CONSTRAINT FK_Triggers_MediaLists_MediaListID
GO
ALTER TABLE Triggers  WITH CHECK ADD  CONSTRAINT FK_Triggers_Owners_OwnerID FOREIGN KEY(OwnerID)
REFERENCES Owners (ID)
GO
ALTER TABLE Triggers CHECK CONSTRAINT FK_Triggers_Owners_OwnerID
GO
ALTER TABLE Triggers  WITH CHECK ADD  CONSTRAINT FK_Triggers_Places_PlaceID FOREIGN KEY(PlaceID)
REFERENCES Places (ID)
GO
ALTER TABLE Triggers CHECK CONSTRAINT FK_Triggers_Places_PlaceID
GO
ALTER TABLE Triggers  WITH CHECK ADD  CONSTRAINT FK_Triggers_TourLayers_TourLayerID FOREIGN KEY(TourLayerID)
REFERENCES TourLayers (ID)
GO
ALTER TABLE Triggers CHECK CONSTRAINT FK_Triggers_TourLayers_TourLayerID
GO
