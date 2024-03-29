
CREATE TABLE Places(
	ID uniqueidentifier NOT NULL,
	OwnerID uniqueidentifier NOT NULL,
	Center geography NOT NULL,
	NorthEastBoundaryCorner geography NULL,
	SouthWestBoundaryCorner geography NULL,
	StreetNumber nvarchar(max) NULL,
	StreetName nvarchar(max) NULL,
	Neighborhood nvarchar(max) NULL,
	BoundaryShapeID uniqueidentifier NULL,
	Size int NULL,
	LastEditTime datetimeoffset NOT NULL,
	ImageID uniqueidentifier NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_Places PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_Places_BoundaryShapeID ******/
CREATE NONCLUSTERED INDEX IX_Places_BoundaryShapeID ON Places
(
	BoundaryShapeID ASC
)
GO
/****** Object:  Index IX_Places_ImageID ******/
CREATE NONCLUSTERED INDEX IX_Places_ImageID ON Places
(
	ImageID ASC
)
GO
/****** Object:  Index IX_Places_OwnerID ******/
CREATE NONCLUSTERED INDEX IX_Places_OwnerID ON Places
(
	OwnerID ASC
)
GO
ALTER TABLE Places  WITH CHECK ADD  CONSTRAINT FK_Places_MediaFiles_ImageID FOREIGN KEY(ImageID)
REFERENCES MediaFiles (ID)
GO
ALTER TABLE Places CHECK CONSTRAINT FK_Places_MediaFiles_ImageID
GO
ALTER TABLE Places  WITH CHECK ADD  CONSTRAINT FK_Places_Owners_OwnerID FOREIGN KEY(OwnerID)
REFERENCES Owners (ID)
ON DELETE CASCADE
GO
ALTER TABLE Places CHECK CONSTRAINT FK_Places_Owners_OwnerID
GO
ALTER TABLE Places  WITH CHECK ADD  CONSTRAINT FK_Places_Shapes_BoundaryShapeID FOREIGN KEY(BoundaryShapeID)
REFERENCES Shapes (ID)
GO
ALTER TABLE Places CHECK CONSTRAINT FK_Places_Shapes_BoundaryShapeID
GO
