
CREATE TABLE Layers(
	ID uniqueidentifier NOT NULL,
	OwnerID uniqueidentifier NULL,
	LayerNumber int NOT NULL,
	TypeFlags int NOT NULL,
	NormalColor int NOT NULL,
	MarkerIcon nvarchar(max) NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_Layers PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_Layers_OwnerID ******/
CREATE NONCLUSTERED INDEX IX_Layers_OwnerID ON Layers
(
	OwnerID ASC
)
GO
ALTER TABLE Layers  WITH CHECK ADD  CONSTRAINT FK_Layers_Owners_OwnerID FOREIGN KEY(OwnerID)
REFERENCES Owners (ID)
GO
ALTER TABLE Layers CHECK CONSTRAINT FK_Layers_Owners_OwnerID
GO
