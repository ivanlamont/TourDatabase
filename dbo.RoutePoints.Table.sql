
CREATE TABLE RoutePoints(
	ID uniqueidentifier NOT NULL,
	Point geography NOT NULL,
	Sequence int NOT NULL,
	IsMain bit NOT NULL,
	BearingTo int NULL,
	DistanceMetersTo bigint NULL,
	DirectionsTo nvarchar(max) NULL,
	RouteID uniqueidentifier NULL,
	RouteID1 uniqueidentifier NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_RoutePoints PRIMARY KEY CLUSTERED (	ID ASC))
GO
/****** Object:  Index IX_RoutePoints_RouteID ******/
CREATE NONCLUSTERED INDEX IX_RoutePoints_RouteID ON RoutePoints
(
	RouteID ASC
)
GO
/****** Object:  Index IX_RoutePoints_RouteID1 ******/
CREATE NONCLUSTERED INDEX IX_RoutePoints_RouteID1 ON RoutePoints
(
	RouteID1 ASC
)
GO
ALTER TABLE RoutePoints  WITH CHECK ADD  CONSTRAINT FK_RoutePoints_Routes_RouteID FOREIGN KEY(RouteID)
REFERENCES Routes (ID)
GO
ALTER TABLE RoutePoints CHECK CONSTRAINT FK_RoutePoints_Routes_RouteID
GO
ALTER TABLE RoutePoints  WITH CHECK ADD  CONSTRAINT FK_RoutePoints_Routes_RouteID1 FOREIGN KEY(RouteID1)
REFERENCES Routes (ID)
GO
ALTER TABLE RoutePoints CHECK CONSTRAINT FK_RoutePoints_Routes_RouteID1
GO
