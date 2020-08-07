CREATE PROCEDURE dbo.sptInsertCustomer 
    @name VARCHAR(50),
	@lastname VARCHAR (50),
	@address  VARCHAR (250),
	@telephone1 VARCHAR (50),
	@telephone2 VARCHAR (50),
	@mobilePhone1 VARCHAR (50),
	@mobilePhone2 VARCHAR (50),
	@document INT,
	@resultMessage VARCHAR(200) OUTPUT
AS
   	
BEGIN
	SET NOCOUNT ON;
	SET @resultMessage = '';
	IF EXISTS (SELECT document FROM Customer WHERE document = @document )
		BEGIN
			SET @resultMessage = 'No es posible crear el Cliente, porque el documento ya existe en el sistema';
		END
	ELSE
		BEGIN
			INSERT INTO  Customer(Name,Lastname,Address,Telephone1,Telephone2,MobilePhone1,MobilePhone2,document) 
			VALUES (@name,@lastname,@address,@telephone1,@telephone2,@mobilePhone1,@mobilePhone2,@document)   
	END
END
