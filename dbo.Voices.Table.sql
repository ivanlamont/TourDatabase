
/****** Object:  Table Voices ******/
CREATE TABLE Voices(
	ID uniqueidentifier NOT NULL,
	IsRealHuman bit NOT NULL,
	SourceID uniqueidentifier NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_Voices PRIMARY KEY CLUSTERED (	ID ASC))
GO
/****** Object:  Index IX_Voices_SourceID ******/
CREATE NONCLUSTERED INDEX IX_Voices_SourceID ON Voices(	SourceID ASC)
GO
ALTER TABLE Voices  WITH CHECK ADD  CONSTRAINT FK_Voices_Apis_SourceID FOREIGN KEY(SourceID)REFERENCES Apis (ID)
GO
ALTER TABLE Voices CHECK CONSTRAINT FK_Voices_Apis_SourceID
GO
