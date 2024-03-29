

create proc LoadPendingTranslations
as
begin

	with allTranslations as (
	select 
		SubscriptionID,
		at.OwnerID,
		t.ID as TourID,
		n.ID as MediaListNodeID,
		tli.ID as MediaLanguageItemID,
		ns.ID as NativeLanguageScriptID,
		ns.Script as NativeLanguageScript,
		ts.Script as TargetLanguageScript,
		nl.LanguageCode as NativeLanguageCode,
		nl.ID as NativeLanguageID,
		tll.LanguageCode as TargetLanguageCode,
		tll.ID as TargetLanguageID
	from AutoContentSubscription at
		inner join Tours t on at.OwnerID = t.OwnerID and at.TourID = t.ID 
		inner join Languages nl on t.NativeLanguageID = nl.ID
		inner join TourLanguages tlg on t.ID = tlg.TourID --and  tlg.LanguageID = li.LanguageID
		inner join Languages tll on tlg.LanguageID = tll.ID
		inner join TourLayers tl on tl.TourID = t.ID
		inner join Triggers g on g.TourLayerID = tl.ID
		inner join MediaLists ml on g.MediaListID = ml.ID
		inner join MediaListNodes n on n.MediaList = ml.ID
		left join MediaLanguageItems tli on tli.MediaListNodeID = n.ID and tli.LanguageID = tlg.LanguageID
		left join MediaLanguageItems nli on nli.MediaListNodeID = n.ID and nli.LanguageID = t.NativeLanguageID
		left join ScriptItems ns on nli.ScriptID = ns.ID
		left join ScriptItems ts on tli.ScriptID = ts.ID
		left join MediaFiles f on tli.ItemID = f.ID
		left join Blob b on f.DataID = b.ID
	where at.IsActive = 1
		and at.Balance > 0
		and tll.LanguageCode != nl.LanguageCode	--no point translating to native language
	), unknown as (
	select 
		n.SubscriptionID,
		n.OwnerID,
		n.TourID,
		n.MediaListNodeID,
		n.NativeLanguageScript,
		n.TargetLanguageScript,
		n.NativeLanguageCode,
		n.TargetLanguageCode,
		n.NativeLanguageID,
		n.TargetLanguageID,
		n.NativeLanguageScriptID,
		TranslatedScriptID,
		EntryTime,
		ProcessStartTime,
		ProcessCompletionTime,
		State,
		Cost,
		ErrorMessage
	from allTranslations n
		left join  AutoTranslationsWork ok
		on ok.TourID = n.TourID
		and ok.SourceScriptID = n.NativeLanguageScriptID
		where ok.TranslationsRequestID is null-- not already there
	)
	INSERT INTO AutoTranslationsWork
		(SubscriptionID
		,OwnerID
		,TourID
		,MediaListNodeID
		,NativeLanguageScript
		,TargetLanguageScript
		,NativeLanguageCode
		,TargetLanguageCode
		,NativeLanguageID
		,TargetLanguageID
		,SourceScriptID
		,TranslatedScriptID
		,EntryTime
		,State
	)
	select
		SubscriptionID
		,OwnerID
		,TourID
		,MediaListNodeID
		,NativeLanguageScript
		,TargetLanguageScript
		,NativeLanguageCode
		,TargetLanguageCode
		,NativeLanguageID
		,TargetLanguageID
		,NativeLanguageScriptID
		,TranslatedScriptID
		,GETDATE()
		,1
	from unknown


end

GO
