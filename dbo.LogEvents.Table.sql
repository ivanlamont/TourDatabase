
CREATE TABLE LogEvents(
	ID uniqueidentifier NOT NULL,
	TypeID uniqueidentifier NULL,
	Level tinyint NOT NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_LogEvents PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_LogEvents_TypeID ******/
CREATE NONCLUSTERED INDEX IX_LogEvents_TypeID ON LogEvents
(
	TypeID ASC
)
GO
ALTER TABLE LogEvents  WITH CHECK ADD  CONSTRAINT FK_LogEvents_LogEventTypes_TypeID FOREIGN KEY(TypeID)
REFERENCES LogEventTypes (ID)
GO
ALTER TABLE LogEvents CHECK CONSTRAINT FK_LogEvents_LogEventTypes_TypeID
GO
