
CREATE TABLE MediaLists(
	ID uniqueidentifier NOT NULL,
	OwnerID uniqueidentifier NOT NULL,
	IsMapped bit NULL,
	WebPage nvarchar(max) NULL,
	Summary nvarchar(max) NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_MediaLists PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_MediaLists_OwnerID ******/
CREATE NONCLUSTERED INDEX IX_MediaLists_OwnerID ON MediaLists
(
	OwnerID ASC
)
GO
ALTER TABLE MediaLists  WITH CHECK ADD  CONSTRAINT FK_MediaLists_Owners_OwnerID FOREIGN KEY(OwnerID)
REFERENCES Owners (ID)
ON DELETE CASCADE
GO
ALTER TABLE MediaLists CHECK CONSTRAINT FK_MediaLists_Owners_OwnerID
GO
