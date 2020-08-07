CREATE PROCEDURE dbo.sptInsertAppUser 
    @UserName VARCHAR(50),
    @Password VARCHAR(10),
	@resultMessage VARCHAR(200) OUTPUT
AS
   	
BEGIN
	SET NOCOUNT ON;
	SET @resultMessage = '';
	
	IF EXISTS (SELECT UserName FROM AppUser WHERE Username = @UserName )
		BEGIN
			SET @resultMessage = 'El Usuario  '+@UserName+' Ya Existe, pruebe otro Nombre de Usuario';
		END
	ELSE
		BEGIN

		INSERT INTO  AppUser(UserName,Password) VALUES (@UserName,@Password)   
		SET @resultMessage = 'El Usuario Fue Creado Satisfactoriamente';
		END


END