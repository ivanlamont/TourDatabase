
CREATE TABLE MediaListNodes(
	ID uniqueidentifier NOT NULL,
	MediaList uniqueidentifier NOT NULL,
	ItemTypeFlag int NULL,
	ItemOrder int NULL,
	BreakAfterItem bit NOT NULL,
	ConditionID uniqueidentifier NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_MediaListNodes PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_MediaListNodes_ConditionID ******/
CREATE NONCLUSTERED INDEX IX_MediaListNodes_ConditionID ON MediaListNodes
(
	ConditionID ASC
)
GO
/****** Object:  Index IX_MediaListNodes_MediaList ******/
CREATE NONCLUSTERED INDEX IX_MediaListNodes_MediaList ON MediaListNodes
(
	MediaList ASC
)
GO
ALTER TABLE MediaListNodes  WITH CHECK ADD  CONSTRAINT FK_MediaListNodes_Conditions_ConditionID FOREIGN KEY(ConditionID)
REFERENCES Conditions (ID)
GO
ALTER TABLE MediaListNodes CHECK CONSTRAINT FK_MediaListNodes_Conditions_ConditionID
GO
ALTER TABLE MediaListNodes  WITH CHECK ADD  CONSTRAINT FK_MediaListNodes_MediaLists_MediaList FOREIGN KEY(MediaList)
REFERENCES MediaLists (ID)
ON DELETE CASCADE
GO
ALTER TABLE MediaListNodes CHECK CONSTRAINT FK_MediaListNodes_MediaLists_MediaList
GO
