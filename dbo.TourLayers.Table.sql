
CREATE TABLE TourLayers(
	ID uniqueidentifier NOT NULL,
	TourID uniqueidentifier NOT NULL,
	LayerID uniqueidentifier NOT NULL,
	LayerColor int NOT NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_TourLayers PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_TourLayers_LayerID ******/
CREATE NONCLUSTERED INDEX IX_TourLayers_LayerID ON TourLayers
(
	LayerID ASC
)
GO
/****** Object:  Index IX_TourLayers_TourID ******/
CREATE NONCLUSTERED INDEX IX_TourLayers_TourID ON TourLayers
(
	TourID ASC
)
GO
ALTER TABLE TourLayers  WITH CHECK ADD  CONSTRAINT FK_TourLayers_Layers_LayerID FOREIGN KEY(LayerID)
REFERENCES Layers (ID)
ON DELETE CASCADE
GO
ALTER TABLE TourLayers CHECK CONSTRAINT FK_TourLayers_Layers_LayerID
GO
ALTER TABLE TourLayers  WITH CHECK ADD  CONSTRAINT FK_TourLayers_Tours_TourID FOREIGN KEY(TourID)
REFERENCES Tours (ID)
ON DELETE CASCADE
GO
ALTER TABLE TourLayers CHECK CONSTRAINT FK_TourLayers_Tours_TourID
GO
