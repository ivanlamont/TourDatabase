CREATE TABLE ApiCallEvents(
	ID uniqueidentifier NOT NULL,
	TargetID uniqueidentifier NULL,
	CallerID uniqueidentifier NULL,
	CallUserID uniqueidentifier NULL,
	ByteCount int NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_ApiCallEvents PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_ApiCallEvents_CallerID ******/
CREATE NONCLUSTERED INDEX IX_ApiCallEvents_CallerID ON ApiCallEvents
(
	CallerID ASC
)
GO
/****** Object:  Index IX_ApiCallEvents_CallUserID ******/
CREATE NONCLUSTERED INDEX IX_ApiCallEvents_CallUserID ON ApiCallEvents
(
	CallUserID ASC
)
GO
/****** Object:  Index IX_ApiCallEvents_TargetID ******/
CREATE NONCLUSTERED INDEX IX_ApiCallEvents_TargetID ON ApiCallEvents
(
	TargetID ASC
)
GO
ALTER TABLE ApiCallEvents  WITH CHECK ADD  CONSTRAINT FK_ApiCallEvents_Apis_TargetID FOREIGN KEY(TargetID)
REFERENCES Apis (ID)
GO
ALTER TABLE ApiCallEvents CHECK CONSTRAINT FK_ApiCallEvents_Apis_TargetID
GO
ALTER TABLE ApiCallEvents  WITH CHECK ADD  CONSTRAINT FK_ApiCallEvents_Owners_CallerID FOREIGN KEY(CallerID)
REFERENCES Owners (ID)
GO
ALTER TABLE ApiCallEvents CHECK CONSTRAINT FK_ApiCallEvents_Owners_CallerID
GO
ALTER TABLE ApiCallEvents  WITH CHECK ADD  CONSTRAINT FK_ApiCallEvents_Users_CallUserID FOREIGN KEY(CallUserID)
REFERENCES Users (ID)
GO
ALTER TABLE ApiCallEvents CHECK CONSTRAINT FK_ApiCallEvents_Users_CallUserID
GO
