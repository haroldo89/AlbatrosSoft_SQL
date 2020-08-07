CREATE PROCEDURE dbo.sptUpdateCustomer 
(
    @name VARCHAR(50),
	@lastname VARCHAR (50),
	@address  VARCHAR (250),
	@telephone1 VARCHAR (50),
	@telephone2 VARCHAR (50),
	@mobilePhone1 VARCHAR (50),
	@mobilePhone2 VARCHAR (50),
	@document INT,
	@resultMessage VARCHAR(200) OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;
	SET @resultMessage = '';
	IF NOT EXISTS (SELECT document FROM Customer WHERE document = @document )
		BEGIN
			SET @resultMessage = 'No es posible crear el Cliente, porque el documento ya existe en el sistema';
		END
	ELSE
		BEGIN
			UPDATE Customer
				SET  Name = ISNULL(@name,Name)
					,Lastname = ISNULL(@lastname, LastName)
					,Address = ISNULL(@address, Address)
					,Telephone1 = ISNULL(@telephone1,Telephone1)
					,Telephone2 = ISNULL(@telephone2, Telephone2)
					,MobilePhone1 = ISNULL(@mobilePhone1,MobilePhone1)
					,MobilePhone2 = ISNULL(@mobilePhone2, MobilePhone2)
					,Document = ISNULL(@document, Document)
			 WHERE LTRIM(RTRIM(Document)) = LTRIM(RTRIM(@document))
	END
END
