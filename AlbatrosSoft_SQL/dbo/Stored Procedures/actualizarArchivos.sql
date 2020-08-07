/*
EXEC master.dbo.sp_configure 'show advanced options', 1
RECONFIGURE
EXEC master.dbo.sp_configure 'xp_cmdshell', 1
RECONFIGURE
-------------------------------//-------------------------
actualizarArchivos 'C:\ActualizarSp\' ,'123456','ArionBD'
*/
CREATE  PROCEDURE actualizarArchivos (@PathName VARCHAR(512), @Clave VARCHAR(20), @BaseDatos VARCHAR(50))
AS 
BEGIN
	IF OBJECT_ID('tempdb..#CommandShell') IS NOT NULL 
	BEGIN
		DROP TABLE #CommandShell
	END
	-- List all files in a directory - T-SQL parse string for date and filename
	-- Microsoft SQL Server command shell statement - xp_cmdshell
	DECLARE @CMD VARCHAR(512)
	CREATE TABLE #CommandShell (Line VARCHAR(512))
	SET @CMD = 'DIR ' + @PathName + '*.sql'
	--PRINT @CMD
	-- MSSQL insert exec - insert table from stored procedure execution
	INSERT  INTO #CommandShell
	EXEC MASTER..xp_cmdshell @CMD
	-- Delete lines not containing filename
	DELETE  FROM #CommandShell
	WHERE   Line NOT LIKE '[0-9][0-9]/[0-9][0-9]/[0-9][0-9][0-9][0-9] %' OR
			Line LIKE '%<DIR>%' OR
			Line IS NULL
	-- SQL reverse string function - charindex string function
	SELECT  FileName = REVERSE(LEFT(REVERSE(Line), CHARINDEX(' ', REVERSE(line)) - 1)),
			CreateDate = LEFT(Line, 10)
	FROM  #CommandShell
	ORDER BY FILENAME
	--Declaracion de cursor para archivos a actualizar sobre la base de datos.
	DECLARE fileCursor CURSOR LOCAL FOR 
		SELECT  FileName = REVERSE(LEFT(REVERSE(Line), CHARINDEX(' ', REVERSE(line)) - 1))
		FROM #CommandShell
	OPEN fileCursor 
	DECLARE @file VARCHAR(255)
	FETCH NEXT FROM fileCursor INTO @file
	WHILE @@FETCH_STATUS = 0 
	BEGIN
		--DECLARE #Bases TABLE (NAME VARCHAR(512))
		DECLARE @database AS VARCHAR(512)
		IF OBJECT_ID('tempdb..#Bases') IS NOT NULL 
		BEGIN
			DROP TABLE #Bases
		END
		CREATE TABLE #Bases (name VARCHAR(512))
		--Base de datos es declarada explicitamente
		IF NOT @BaseDatos = ''
		BEGIN
			INSERT INTO #Bases   
			SELECT name FROM master..sysdatabases WHERE   dbid > 4 and name = @BaseDatos
		END
		--Hace cambios en todas las bases de datos disponibles en servidor
		ELSE
		BEGIN
			INSERT INTO #Bases   
			SELECT name FROM master..sysdatabases WHERE   dbid > 4 
		END		
		--Ejecuta comando shell mientras exista bases de datos
		WHILE (SELECT COUNT(1) FROM #Bases) > 0 
		BEGIN
			SELECT TOP 1 @database = name
			FROM    #Bases
			----------------- Ojooooo ----------------------------
			---- Aqui deben ir cada una de las bases de datos --DB_NAME() 
			SET @CMD = 'osql -S ' + @@SERVERNAME + ' -U sa -P ' + @Clave + ' -d ' + @database + ' -i ' + @PathName + @file --+ ' >> ' + @PathName + 'out.txt'
			PRINT @CMD
			EXEC MASTER.dbo.xp_cmdshell @CMD
			---- Aqui deben ir cada una de las bases de datos
			----------------- Ojooooo ----------------------------
			DELETE  FROM #Bases
			WHERE   name = @database
		END 
	FETCH NEXT FROM fileCursor INTO @file        
	END 

	IF CURSOR_STATUS('local', 'fileCursor') > 0 
	BEGIN
		CLOSE fileCursor ;
		DEALLOCATE fileCursor ;
	END
END
 