
CREATE TABLE MediaFiles(
	ID uniqueidentifier NOT NULL,
	Size bigint NOT NULL,
	[File] nvarchar(max) NULL,
	DataID uniqueidentifier NULL,
	SourceApiID uniqueidentifier NULL,
	SourceUrl nvarchar(max) NULL,
	HostedUrl nvarchar(max) NULL,
	CopyrightHolder nvarchar(max) NULL,
	[Format] nvarchar(max) NOT NULL,
	Discriminator nvarchar(max) NOT NULL,
	Width int NULL,
	Height int NULL,
	LanguageID uniqueidentifier NULL,
	VoiceID uniqueidentifier NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_MediaFiles PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_MediaFiles_DataID ******/
CREATE NONCLUSTERED INDEX IX_MediaFiles_DataID ON MediaFiles
(
	DataID ASC
)
GO
/****** Object:  Index IX_MediaFiles_LanguageID ******/
CREATE NONCLUSTERED INDEX IX_MediaFiles_LanguageID ON MediaFiles
(
	LanguageID ASC
)
GO
/****** Object:  Index IX_MediaFiles_SourceApiID ******/
CREATE NONCLUSTERED INDEX IX_MediaFiles_SourceApiID ON MediaFiles
(
	SourceApiID ASC
)
GO
/****** Object:  Index IX_MediaFiles_VoiceID ******/
CREATE NONCLUSTERED INDEX IX_MediaFiles_VoiceID ON MediaFiles
(
	VoiceID ASC
)
GO
ALTER TABLE MediaFiles ADD  DEFAULT (N'') FOR Format
GO
ALTER TABLE MediaFiles  WITH CHECK ADD  CONSTRAINT FK_MediaFiles_Apis_SourceApiID FOREIGN KEY(SourceApiID)
REFERENCES Apis (ID)
GO
ALTER TABLE MediaFiles CHECK CONSTRAINT FK_MediaFiles_Apis_SourceApiID
GO
ALTER TABLE MediaFiles  WITH CHECK ADD  CONSTRAINT FK_MediaFiles_Blob_DataID FOREIGN KEY(DataID)
REFERENCES Blob (ID)
GO
ALTER TABLE MediaFiles CHECK CONSTRAINT FK_MediaFiles_Blob_DataID
GO
ALTER TABLE MediaFiles  WITH CHECK ADD  CONSTRAINT FK_MediaFiles_Languages_LanguageID FOREIGN KEY(LanguageID)
REFERENCES Languages (ID)
ON DELETE CASCADE
GO
ALTER TABLE MediaFiles CHECK CONSTRAINT FK_MediaFiles_Languages_LanguageID
GO
ALTER TABLE MediaFiles  WITH CHECK ADD  CONSTRAINT FK_MediaFiles_Voices_VoiceID FOREIGN KEY(VoiceID)
REFERENCES Voices (ID)
GO
ALTER TABLE MediaFiles CHECK CONSTRAINT FK_MediaFiles_Voices_VoiceID
GO
