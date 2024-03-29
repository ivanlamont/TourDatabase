
CREATE TABLE Brands(
	ID uniqueidentifier NOT NULL,
	OwnerID uniqueidentifier NULL,
	MobileBackgroundImageID uniqueidentifier NULL,
	MapMarkerIconID uniqueidentifier NULL,
	BigLogoID uniqueidentifier NULL,
	MediumLogoID uniqueidentifier NULL,
	SmallLogoID uniqueidentifier NULL,
	TermsAndConditions nvarchar(max) NULL,
	AppTitle nvarchar(max) NULL,
	AppPromo nvarchar(max) NULL,
	ContactName nvarchar(max) NULL,
	ContactEmail nvarchar(max) NULL,
	ContactNumber nvarchar(max) NULL,
	ContactAddress nvarchar(max) NULL,
	ContactCopyright nvarchar(max) NULL,
	WebsiteURL nvarchar(max) NULL,
	MainFont nvarchar(max) NULL,
	SecondaryFont nvarchar(max) NULL,
	TeritaryFont nvarchar(max) NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_Brands PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_Brands_BigLogoID ******/
CREATE NONCLUSTERED INDEX IX_Brands_BigLogoID ON Brands
(
	BigLogoID ASC
)
GO
/****** Object:  Index IX_Brands_MapMarkerIconID ******/
CREATE NONCLUSTERED INDEX IX_Brands_MapMarkerIconID ON Brands
(
	MapMarkerIconID ASC
)
GO
/****** Object:  Index IX_Brands_MediumLogoID ******/
CREATE NONCLUSTERED INDEX IX_Brands_MediumLogoID ON Brands
(
	MediumLogoID ASC
)
GO
/****** Object:  Index IX_Brands_MobileBackgroundImageID ******/
CREATE NONCLUSTERED INDEX IX_Brands_MobileBackgroundImageID ON Brands
(
	MobileBackgroundImageID ASC
)
GO
/****** Object:  Index IX_Brands_OwnerID ******/
CREATE NONCLUSTERED INDEX IX_Brands_OwnerID ON Brands
(
	OwnerID ASC
)
GO
/****** Object:  Index IX_Brands_SmallLogoID ******/
CREATE NONCLUSTERED INDEX IX_Brands_SmallLogoID ON Brands
(
	SmallLogoID ASC
)
GO
ALTER TABLE Brands  WITH CHECK ADD  CONSTRAINT FK_Brands_MediaFiles_BigLogoID FOREIGN KEY(BigLogoID)
REFERENCES MediaFiles (ID)
GO
ALTER TABLE Brands CHECK CONSTRAINT FK_Brands_MediaFiles_BigLogoID
GO
ALTER TABLE Brands  WITH CHECK ADD  CONSTRAINT FK_Brands_MediaFiles_MapMarkerIconID FOREIGN KEY(MapMarkerIconID)
REFERENCES MediaFiles (ID)
GO
ALTER TABLE Brands CHECK CONSTRAINT FK_Brands_MediaFiles_MapMarkerIconID
GO
ALTER TABLE Brands  WITH CHECK ADD  CONSTRAINT FK_Brands_MediaFiles_MediumLogoID FOREIGN KEY(MediumLogoID)
REFERENCES MediaFiles (ID)
GO
ALTER TABLE Brands CHECK CONSTRAINT FK_Brands_MediaFiles_MediumLogoID
GO
ALTER TABLE Brands  WITH CHECK ADD  CONSTRAINT FK_Brands_MediaFiles_MobileBackgroundImageID FOREIGN KEY(MobileBackgroundImageID)
REFERENCES MediaFiles (ID)
GO
ALTER TABLE Brands CHECK CONSTRAINT FK_Brands_MediaFiles_MobileBackgroundImageID
GO
ALTER TABLE Brands  WITH CHECK ADD  CONSTRAINT FK_Brands_MediaFiles_SmallLogoID FOREIGN KEY(SmallLogoID)
REFERENCES MediaFiles (ID)
GO
ALTER TABLE Brands CHECK CONSTRAINT FK_Brands_MediaFiles_SmallLogoID
GO
ALTER TABLE Brands  WITH CHECK ADD  CONSTRAINT FK_Brands_Owners_OwnerID FOREIGN KEY(OwnerID)
REFERENCES Owners (ID)
GO
ALTER TABLE Brands CHECK CONSTRAINT FK_Brands_Owners_OwnerID
GO
