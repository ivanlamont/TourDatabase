
CREATE TABLE UserPreferences(
	ID uniqueidentifier NOT NULL,
	UserID uniqueidentifier NOT NULL,
	Value nvarchar(max) NOT NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_UserPreferences PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_UserPreferences_UserID ******/
CREATE NONCLUSTERED INDEX IX_UserPreferences_UserID ON UserPreferences
(
	UserID ASC
)
GO
ALTER TABLE UserPreferences  WITH CHECK ADD  CONSTRAINT FK_UserPreferences_Users_UserID FOREIGN KEY(UserID)
REFERENCES Users (ID)
ON DELETE CASCADE
GO
ALTER TABLE UserPreferences CHECK CONSTRAINT FK_UserPreferences_Users_UserID
GO
