
CREATE TABLE MapTileSource(
	ID int IDENTITY(1,1) NOT NULL,
	Source nvarchar(max) NULL,
	MobileMapID uniqueidentifier NULL,
 CONSTRAINT PK_MapTileSource PRIMARY KEY CLUSTERED 
(
	ID ASC
)
)
GO
/****** Object:  Index IX_MapTileSource_MobileMapID ******/
CREATE NONCLUSTERED INDEX IX_MapTileSource_MobileMapID ON MapTileSource
(
	MobileMapID ASC
)
GO
ALTER TABLE MapTileSource  WITH CHECK ADD  CONSTRAINT FK_MapTileSource_MobileMaps_MobileMapID FOREIGN KEY(MobileMapID)
REFERENCES MobileMaps (ID)
GO
ALTER TABLE MapTileSource CHECK CONSTRAINT FK_MapTileSource_MobileMaps_MobileMapID
GO
