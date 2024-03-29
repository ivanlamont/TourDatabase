
CREATE TABLE ScriptItems(
	ID uniqueidentifier NOT NULL,
	LanguageID uniqueidentifier NOT NULL,
	ChangeDate datetimeoffset NOT NULL,
	RecordDate datetimeoffset NOT NULL,
	Script nvarchar(max) NOT NULL,
	MediaFileUploadDate datetimeoffset NOT NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_ScriptItems PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_ScriptItems_LanguageID ******/
CREATE NONCLUSTERED INDEX IX_ScriptItems_LanguageID ON ScriptItems
(
	LanguageID ASC
)
GO
ALTER TABLE ScriptItems  WITH CHECK ADD  CONSTRAINT FK_ScriptItems_Languages_LanguageID FOREIGN KEY(LanguageID)
REFERENCES Languages (ID)
ON DELETE CASCADE
GO
ALTER TABLE ScriptItems CHECK CONSTRAINT FK_ScriptItems_Languages_LanguageID
GO
