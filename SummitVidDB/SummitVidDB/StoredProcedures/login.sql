CREATE PROCEDURE [dbo].[login]
	@username nvarchar(50),
	@password nvarchar(max)
AS
	BEGIN
		BEGIN
			SELECT Id FROM users_t WHERE username = @username AND password_hash = HASHBYTES('SHA2_256', @password);
		END
	END
RETURN 0
