
CREATE TABLE TourLanguages(
	ID uniqueidentifier NOT NULL,
	TourID uniqueidentifier NOT NULL,
	LanguageID uniqueidentifier NOT NULL,
	PreferredVoiceID uniqueidentifier NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_TourLanguages PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_TourLanguages_LanguageID ******/
CREATE NONCLUSTERED INDEX IX_TourLanguages_LanguageID ON TourLanguages
(
	LanguageID ASC
)
GO
/****** Object:  Index IX_TourLanguages_PreferredVoiceID ******/
CREATE NONCLUSTERED INDEX IX_TourLanguages_PreferredVoiceID ON TourLanguages
(
	PreferredVoiceID ASC
)
GO
/****** Object:  Index IX_TourLanguages_TourID ******/
CREATE NONCLUSTERED INDEX IX_TourLanguages_TourID ON TourLanguages
(
	TourID ASC
)
GO
ALTER TABLE TourLanguages  WITH CHECK ADD  CONSTRAINT FK_TourLanguages_Languages_LanguageID FOREIGN KEY(LanguageID)
REFERENCES Languages (ID)
ON DELETE CASCADE
GO
ALTER TABLE TourLanguages CHECK CONSTRAINT FK_TourLanguages_Languages_LanguageID
GO
ALTER TABLE TourLanguages  WITH CHECK ADD  CONSTRAINT FK_TourLanguages_Tours_TourID FOREIGN KEY(TourID)
REFERENCES Tours (ID)
ON DELETE CASCADE
GO
ALTER TABLE TourLanguages CHECK CONSTRAINT FK_TourLanguages_Tours_TourID
GO
ALTER TABLE TourLanguages  WITH CHECK ADD  CONSTRAINT FK_TourLanguages_Voices_PreferredVoiceID FOREIGN KEY(PreferredVoiceID)
REFERENCES Voices (ID)
GO
ALTER TABLE TourLanguages CHECK CONSTRAINT FK_TourLanguages_Voices_PreferredVoiceID
GO
