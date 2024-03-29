
CREATE TABLE Users(
	ID uniqueidentifier NOT NULL,
	EmailAddress nvarchar(max) NOT NULL,
	FirstName nvarchar(max) NOT NULL,
	LastName nvarchar(max) NOT NULL,
	OwnerID uniqueidentifier NOT NULL,
	IsService bit NOT NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_Users PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_Users_OwnerID ******/
CREATE NONCLUSTERED INDEX IX_Users_OwnerID ON Users
(
	OwnerID ASC
)
GO
ALTER TABLE Users  WITH CHECK ADD  CONSTRAINT FK_Users_Owners_OwnerID FOREIGN KEY(OwnerID)
REFERENCES Owners (ID)
ON DELETE CASCADE
GO
ALTER TABLE Users CHECK CONSTRAINT FK_Users_Owners_OwnerID
GO
