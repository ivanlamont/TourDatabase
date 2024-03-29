
CREATE TABLE Tours(
	ID uniqueidentifier NOT NULL,
	OwnerID uniqueidentifier NULL,
	HomeID uniqueidentifier NULL,
	PromotionalImageID uniqueidentifier NULL,
	PromotionalDescription nvarchar(max) NULL,
	NativeLanguageID uniqueidentifier NULL,
	IsChallenge bit NULL,
	Transport nvarchar(max) NULL,
	Theme nvarchar(max) NULL,
	LengthInMeters float NULL,
	CentralLocation geography NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_Tours PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_Tours_HomeID ******/
CREATE NONCLUSTERED INDEX IX_Tours_HomeID ON Tours
(
	HomeID ASC
)
GO
/****** Object:  Index IX_Tours_NativeLanguageID ******/
CREATE NONCLUSTERED INDEX IX_Tours_NativeLanguageID ON Tours
(
	NativeLanguageID ASC
)
GO
/****** Object:  Index IX_Tours_OwnerID ******/
CREATE NONCLUSTERED INDEX IX_Tours_OwnerID ON Tours
(
	OwnerID ASC
)
GO
/****** Object:  Index IX_Tours_PromotionalImageID ******/
CREATE NONCLUSTERED INDEX IX_Tours_PromotionalImageID ON Tours
(
	PromotionalImageID ASC
)
GO
ALTER TABLE Tours  WITH CHECK ADD  CONSTRAINT FK_Tours_Languages_NativeLanguageID FOREIGN KEY(NativeLanguageID)
REFERENCES Languages (ID)
GO
ALTER TABLE Tours CHECK CONSTRAINT FK_Tours_Languages_NativeLanguageID
GO
ALTER TABLE Tours  WITH CHECK ADD  CONSTRAINT FK_Tours_MediaFiles_PromotionalImageID FOREIGN KEY(PromotionalImageID)
REFERENCES MediaFiles (ID)
GO
ALTER TABLE Tours CHECK CONSTRAINT FK_Tours_MediaFiles_PromotionalImageID
GO
ALTER TABLE Tours  WITH CHECK ADD  CONSTRAINT FK_Tours_Owners_OwnerID FOREIGN KEY(OwnerID)
REFERENCES Owners (ID)
GO
ALTER TABLE Tours CHECK CONSTRAINT FK_Tours_Owners_OwnerID
GO
ALTER TABLE Tours  WITH CHECK ADD  CONSTRAINT FK_Tours_Places_HomeID FOREIGN KEY(HomeID)
REFERENCES Places (ID)
GO
ALTER TABLE Tours CHECK CONSTRAINT FK_Tours_Places_HomeID
GO
