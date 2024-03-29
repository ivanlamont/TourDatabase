
CREATE TABLE Routes(
	ID uniqueidentifier NOT NULL,
	TourID uniqueidentifier NOT NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,	
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_Routes PRIMARY KEY CLUSTERED (	ID ASC))
GO
/****** Object:  Index IX_Routes_TourID ******/
CREATE NONCLUSTERED INDEX IX_Routes_TourID ON Routes
(
	TourID ASC
)
GO
ALTER TABLE Routes  WITH CHECK ADD  CONSTRAINT FK_Routes_Tours_TourID FOREIGN KEY(TourID)
REFERENCES Tours (ID)
ON DELETE CASCADE
GO
ALTER TABLE Routes CHECK CONSTRAINT FK_Routes_Tours_TourID
GO
