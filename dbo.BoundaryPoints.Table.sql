
CREATE TABLE BoundaryPoints(
	ID uniqueidentifier NOT NULL,
	PlaceID uniqueidentifier NOT NULL,
	Point geography NOT NULL,
	Sequence int NOT NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_BoundaryPoints PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_BoundaryPoints_PlaceID ******/
CREATE NONCLUSTERED INDEX IX_BoundaryPoints_PlaceID ON BoundaryPoints
(
	PlaceID ASC
)
GO
ALTER TABLE BoundaryPoints  WITH CHECK ADD  CONSTRAINT FK_BoundaryPoints_Places_PlaceID FOREIGN KEY(PlaceID)
REFERENCES Places (ID)
ON DELETE CASCADE
GO
ALTER TABLE BoundaryPoints CHECK CONSTRAINT FK_BoundaryPoints_Places_PlaceID
GO
