
CREATE TABLE Languages(
	ID uniqueidentifier NOT NULL,
	OwnerID uniqueidentifier NULL,
	Flags int NULL,
	LanguageCode nvarchar(max) NOT NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_Languages PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_Languages_OwnerID ******/
CREATE NONCLUSTERED INDEX IX_Languages_OwnerID ON Languages
(
	OwnerID ASC
)
GO
ALTER TABLE Languages  WITH CHECK ADD  CONSTRAINT FK_Languages_Owners_OwnerID FOREIGN KEY(OwnerID)
REFERENCES Owners (ID)
GO
ALTER TABLE Languages CHECK CONSTRAINT FK_Languages_Owners_OwnerID
GO
