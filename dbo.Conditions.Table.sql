
CREATE TABLE Conditions(
	ID uniqueidentifier NOT NULL,
	ConditionTypeFlags int NOT NULL,
	ConditionMinValue int NOT NULL,
	ConditionMaxValue int NOT NULL,
	IsMapping bit NOT NULL,
	CreatedDate datetimeoffset NOT NULL,
	CreatedBy nvarchar(max) NOT NULL,
	UpdatedDate datetimeoffset NOT NULL,
	UpdatedBy nvarchar(max) NOT NULL,
	Name nvarchar(max) NOT NULL,
	Description nvarchar(max) NULL,
	SuggestedName nvarchar(max) NULL,
	SuggestedDescription nvarchar(max) NULL,
 CONSTRAINT PK_Conditions PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
