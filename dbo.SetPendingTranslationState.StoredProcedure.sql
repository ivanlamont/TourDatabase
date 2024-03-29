
create proc SetPendingTranslationState
	@TranslationsRequestID UNIQUEIDENTIFIER, @NewState int, @message varchar(max) = null
as
begin

	update AutoTranslationsWork 
	set		
		State = @NewState, 
		ErrorMessage = case @newState when -1 then @message else ErrorMessage end,
		ProcessStartTime = case @newState when 2 then getdate() else ProcessStartTime end,
		ProcessCompletionTime = case @newState when 100 then getdate() else ProcessCompletionTime end
	where TranslationsRequestID = @TranslationsRequestID

end
GO
