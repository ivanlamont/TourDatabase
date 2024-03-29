
CREATE FUNCTION GetTourUpdatedDate(@id uniqueidentifier)
RETURNS datetimeoffset AS
BEGIN

	declare @result datetimeoffset
	
    select @result = UpdatedDate from Tours where ID = @id
    select @result = max(UpdatedDate) from Tours where ID = @id

    RETURN @result
END
GO
