
CREATE TABLE MediaLanguageItems(
	ID uniqueidentifier NOT NULL,
	ScriptID uniqueidentifier NULL,
	LanguageID uniqueidentifier NULL,
	ItemID uniqueidentifier NULL,
	MediaListNodeID uniqueidentifier NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_MediaLanguageItems PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_MediaLanguageItems_ItemID ******/
CREATE NONCLUSTERED INDEX IX_MediaLanguageItems_ItemID ON MediaLanguageItems
(
	ItemID ASC
)
GO
/****** Object:  Index IX_MediaLanguageItems_LanguageID ******/
CREATE NONCLUSTERED INDEX IX_MediaLanguageItems_LanguageID ON MediaLanguageItems
(
	LanguageID ASC
)
GO
/****** Object:  Index IX_MediaLanguageItems_MediaListNodeID ******/
CREATE NONCLUSTERED INDEX IX_MediaLanguageItems_MediaListNodeID ON MediaLanguageItems
(
	MediaListNodeID ASC
)
GO
/****** Object:  Index IX_MediaLanguageItems_ScriptID ******/
CREATE NONCLUSTERED INDEX IX_MediaLanguageItems_ScriptID ON MediaLanguageItems
(
	ScriptID ASC
)
GO
ALTER TABLE MediaLanguageItems  WITH CHECK ADD  CONSTRAINT FK_MediaLanguageItems_Languages_LanguageID FOREIGN KEY(LanguageID)
REFERENCES Languages (ID)
GO
ALTER TABLE MediaLanguageItems CHECK CONSTRAINT FK_MediaLanguageItems_Languages_LanguageID
GO
ALTER TABLE MediaLanguageItems  WITH CHECK ADD  CONSTRAINT FK_MediaLanguageItems_MediaFiles_ItemID FOREIGN KEY(ItemID)
REFERENCES MediaFiles (ID)
GO
ALTER TABLE MediaLanguageItems CHECK CONSTRAINT FK_MediaLanguageItems_MediaFiles_ItemID
GO
ALTER TABLE MediaLanguageItems  WITH CHECK ADD  CONSTRAINT FK_MediaLanguageItems_MediaListNodes_MediaListNodeID FOREIGN KEY(MediaListNodeID)
REFERENCES MediaListNodes (ID)
GO
ALTER TABLE MediaLanguageItems CHECK CONSTRAINT FK_MediaLanguageItems_MediaListNodes_MediaListNodeID
GO
ALTER TABLE MediaLanguageItems  WITH CHECK ADD  CONSTRAINT FK_MediaLanguageItems_ScriptItems_ScriptID FOREIGN KEY(ScriptID)
REFERENCES ScriptItems (ID)
GO
ALTER TABLE MediaLanguageItems CHECK CONSTRAINT FK_MediaLanguageItems_ScriptItems_ScriptID
GO
