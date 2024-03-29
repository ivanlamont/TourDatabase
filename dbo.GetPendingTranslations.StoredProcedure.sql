
create proc GetPendingTranslations
	@tourid uniqueidentifier = null, @nediaListNodeID uniqueidentifier = null, @targetLanguageID  uniqueidentifier = null
as
begin

	select 
		j.*
		--s.*
	from AutoTranslationsWork j		
		inner join AutoContentSubscription z on j.SubscriptionID = z.SubscriptionID and z.Balance > 0
		inner join ScriptItems s on j.SourceScriptID = s.ID
	where State = 1
		and (@tourid is null or j.TourID = @tourid)
		and (@targetLanguageID is null or TargetLanguageID = @targetLanguageID)
		and (@nediaListNodeID is null or MediaListNodeID = @nediaListNodeID)
	order by SubscriptionID
		,OwnerID
		,TourID
		,SourceScriptID

end
GO
