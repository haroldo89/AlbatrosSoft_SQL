CREATE PROCEDURE dbo.sptInsertEmployee 
    @name VARCHAR(50),
	@lastname VARCHAR (50),
	@address  VARCHAR (250),
	@telephone1 VARCHAR (50),
	@telephone2 VARCHAR (50),
	@mobilePhone1 VARCHAR (50),
	@mobilePhone2 VARCHAR (50),
	@departmentId int,
	@document int,
	@resultMessage VARCHAR(200) OUTPUT
AS
   	
BEGIN
	SET NOCOUNT ON;
	SET @resultMessage = '';
	

	IF EXISTS (SELECT departmentId FROM Department WHERE DepartmentId != @departmentId )
		BEGIN
			SET @resultMessage = 'No es posible crear el Empleado, porque el departamento no existe en el sistema';
		END
	ELSE IF EXISTS (SELECT document FROM Employee WHERE document = @document )
		BEGIN
			SET @resultMessage = 'No es posible crear el Empleado, porque el documento ya existe en el sistema';
		END
	ELSE
		BEGIN

			INSERT INTO  Employee(Name,Lastname,Address,Telephone1,Telephone2,MobilePhone1,MobilePhone2,DepartmentId,document) 
				          VALUES (@name,@lastname,@address,@telephone1,@telephone2,@mobilePhone1,@mobilePhone2,@departmentId,@document)   
		END


END
