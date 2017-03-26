CREATE PROCEDURE [dbo].[addUser]
	@username nvarchar(50),
	@password nvarchar(max)
AS
	BEGIN
		IF NOT EXISTS(SELECT * FROM users_t WHERE username = @username)
		BEGIN
			INSERT INTO users_t(username, password_hash)
			VALUES (@username, HASHBYTES('SHA2_256', @password));
		END
	END
RETURN 0
