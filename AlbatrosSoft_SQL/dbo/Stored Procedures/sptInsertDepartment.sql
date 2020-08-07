CREATE PROCEDURE dbo.sptInsertDepartment 
    @description VARCHAR(50),
    @resultMessage VARCHAR(200) OUTPUT
AS
   	
BEGIN
	SET NOCOUNT ON;
	SET @resultMessage = '';
	
	IF EXISTS (SELECT Description FROM Department WHERE Description = @description )
		BEGIN
			SET @resultMessage = 'No es posible crear Departamento, porque ya existe en el sistema';
		END
	ELSE
		BEGIN

		INSERT INTO  Department (Description) VALUES (@description)   
		
		END


END



