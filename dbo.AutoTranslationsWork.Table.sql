
CREATE TABLE AutoTranslationsWork(
	TranslationsRequestID uniqueidentifier NOT NULL,
	SubscriptionID uniqueidentifier NOT NULL,
	OwnerID uniqueidentifier NOT NULL,
	TourID uniqueidentifier NOT NULL,
	MediaListNodeID uniqueidentifier NOT NULL,
	NativeLanguageScript varchar(max) NULL,
	TargetLanguageScript varchar(max) NULL,
	NativeLanguageCode varchar(100) NOT NULL,
	TargetLanguageCode varchar(100) NOT NULL,
	NativeLanguageID uniqueidentifier NOT NULL,
	TargetLanguageID uniqueidentifier NOT NULL,
	SourceScriptID uniqueidentifier NOT NULL,
	TranslatedScriptID uniqueidentifier NULL,
	EntryTime datetimeoffset NOT NULL,
	ProcessStartTime datetimeoffset NULL,
	ProcessCompletionTime datetimeoffset NULL,
	State int NOT NULL,
	Cost decimal(18, 8) NULL,
	ErrorMessage varchar(max) NULL,
PRIMARY KEY CLUSTERED 
(
	TranslationsRequestID ASC
)
)
GO
ALTER TABLE AutoTranslationsWork ADD  DEFAULT (newid()) FOR TranslationsRequestID
GO
ALTER TABLE AutoTranslationsWork ADD  DEFAULT (getdate()) FOR EntryTime
GO
ALTER TABLE AutoTranslationsWork ADD  DEFAULT ((0)) FOR State
GO
