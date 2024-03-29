create proc GetPendingTranslationsAndAudio
	@tourID uniqueidentifier
as
begin

	select 
		t.OwnerID as OwnerID,
		n.ID as MediaListNodeID,
		tli.ID as MediaLanguageItemID,
		ns.Script as NativeLanguageScript,
		nl.LanguageCode as NativeLanguageCode,
		n.ConditionID,
		tll.ID as TargetLanguageID,
		tll.LanguageCode as TargetLanguageCode,
		ts.Script as TargetLanguageScript,
		f.ID as TargetLanguageAudioFileID,
		b.ID as BlobID
	from Tours t 
		inner join Languages nl on t.NativeLanguageID = nl.ID
		inner join TourLanguages tlg on t.ID = tlg.TourID --and  tlg.LanguageID = li.LanguageID
		inner join Languages tll on tlg.LanguageID = tll.ID
		inner join TourLayers tl on tl.TourID = t.ID
		inner join Triggers g on g.TourLayerID = tl.ID
		inner join MediaLists ml on g.MediaListID = ml.ID
		inner join MediaListNodes n on n.MediaList = ml.ID
		left join Conditions c on n.ConditionID = c.ID
		left join MediaLanguageItems tli on tli.MediaListNodeID = n.ID and tli.LanguageID = tlg.LanguageID
		left join MediaLanguageItems nli on nli.MediaListNodeID = n.ID and nli.LanguageID = t.NativeLanguageID
		left join ScriptItems ns on nli.ScriptID = ns.ID
		left join ScriptItems ts on tli.ScriptID = ts.ID
		left join MediaFiles f on tli.ItemID = f.ID
		left join Blob b on f.DataID = b.ID
	where t.ID = @tourID
	and tll.LanguageCode != nl.LanguageCode	--no point translating to native language

end

GO
