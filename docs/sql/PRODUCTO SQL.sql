--Listar todos los registros por Sucursal
create procedure SP_L_PRODUCTO_01
@SUC_ID INT
AS
BEGIN
	SELECT * FROM TM_PRODUCTO
	WHERE
	SUC_ID = @SUC_ID
	AND EST = 1
END

--VIDEO Listar todos los registros por Sucursal
/*
ALTER PROCEDURE SP_L_PRODUCTO_01  
@SUC_ID INT  
AS  
BEGIN  
SELECT        
TM_PRODUCTO.PROD_ID, 
TM_PRODUCTO.SUC_ID, 
TM_PRODUCTO.CAT_ID, 
TM_PRODUCTO.PROD_NOM, 
TM_PRODUCTO.PROD_DESCRIP, 
TM_PRODUCTO.UND_ID, 
TM_PRODUCTO.MON_ID, 
TM_PRODUCTO.PROD_PCOMPRA, 
TM_PRODUCTO.PROD_PVENTA, 
TM_PRODUCTO.PROD_STOCK, 
TM_PRODUCTO.PROD_FECHAVEN, 
TM_PRODUCTO.PROD_IMG, 
TM_PRODUCTO.FECH_CREA, 
TM_PRODUCTO.EST, 
TM_CATEGORIA.CAT_NOM, 
TM_MONEDA.MON_NOM, 
TM_UNIDAD.UND_NOM
FROM            
TM_PRODUCTO INNER JOIN
TM_CATEGORIA ON TM_PRODUCTO.CAT_ID = TM_CATEGORIA.CAT_ID INNER JOIN
TM_MONEDA ON TM_PRODUCTO.MON_ID = TM_MONEDA.MON_ID INNER JOIN
TM_UNIDAD ON TM_PRODUCTO.UND_ID = TM_UNIDAD.UND_ID
 WHERE  
 TM_PRODUCTO.SUC_ID = @SUC_ID  
 AND TM_PRODUCTO.EST=1  
END  
*/
--Obtener registro por ID
CREATE PROCEDURE SP_L_PRODUCTO_02
@PROD_ID INT
AS
BEGIN
	SELECT * FROM TM_PRODUCTO
	WHERE
	PROD_ID = @PROD_ID
END

--Eliminar Registro
CREATE PROCEDURE SP_D_PRODUCTO_01
@PROD_ID INT
AS
BEGIN
	UPDATE TM_PRODUCTO
	SET
		EST= 0
	WHERE
		PROD_ID = @PROD_ID
END

--REGISTRAR NUEVO REGISTRO
CREATE PROCEDURE SP_I_PRODUCTO_01
@SUC_ID INT,
@CAT_ID INT,
@PROD_NOM VARCHAR(150),
@PROD_DESCRIP VARCHAR(150),
@UND_ID INT,
@MON_ID INT,
@PROD_PCOMPRA NUMERIC(18,2),
@PROD_PVENTA NUMERIC(18,2),
@PROD_STOCK INT,
@PROD_FECHAVEN DATE,
@PROD_IMG VARCHAR(MAX)
AS
BEGIN
	INSERT INTO TM_PRODUCTO
	(SUC_ID,CAT_ID,PROD_NOM,PROD_DESCRIP,UND_ID,MON_ID,PROD_PCOMPRA,PROD_PVENTA,PROD_STOCK,PROD_FECHAVEN,PROD_IMG,FECH_CREA,EST)
	VALUES
	(@SUC_ID,@CAT_ID,@PROD_NOM,@PROD_DESCRIP,@UND_ID,@MON_ID,@PROD_PCOMPRA,@PROD_PVENTA,@PROD_STOCK,@PROD_FECHAVEN,@PROD_IMG,GETDATE(),1)
END

--ACTUALIZAR REGISTRO
CREATE PROCEDURE SP_U_PRODUCTO_01
@PROD_ID INT,
@SUC_ID INT,
@CAT_ID INT,
@PROD_NOM VARCHAR(150),
@PROD_DESCRIP VARCHAR(150),
@UND_ID INT,
@MON_ID INT,
@PROD_PCOMPRA NUMERIC(18,2),
@PROD_PVENTA NUMERIC(18,2),
@PROD_STOCK INT,
@PROD_FECHAVEN DATE,
@PROD_IMG VARCHAR(MAX)
AS
BEGIN
	UPDATE TM_PRODUCTO
	SET
		SUC_ID = @SUC_ID,
		CAT_ID = @CAT_ID,
		PROD_NOM = @PROD_NOM,
		PROD_DESCRIP = @PROD_DESCRIP,
		UND_ID = @UND_ID,
		MON_ID = @MON_ID,
		PROD_PCOMPRA = @PROD_PCOMPRA,
		PROD_PVENTA = @PROD_PVENTA,
		PROD_STOCK = @PROD_STOCK,
		PROD_FECHAVEN = @PROD_FECHAVEN,
		PROD_IMG = @PROD_IMG
	WHERE
		PROD_ID = @PROD_ID
END



CREATE PROCEDURE SP_L_PRODUCTO_03    
@CAT_ID INT    
AS    
BEGIN    
SELECT          
TM_PRODUCTO.PROD_ID,   
TM_PRODUCTO.SUC_ID,   
TM_PRODUCTO.CAT_ID,   
TM_PRODUCTO.PROD_NOM,   
TM_PRODUCTO.PROD_DESCRIP,   
TM_PRODUCTO.UND_ID,   
TM_PRODUCTO.MON_ID,   
TM_PRODUCTO.PROD_PCOMPRA,   
TM_PRODUCTO.PROD_PVENTA,   
TM_PRODUCTO.PROD_STOCK,   
TM_PRODUCTO.PROD_FECHAVEN,   
TM_PRODUCTO.PROD_IMG,   
TM_PRODUCTO.FECH_CREA,   
TM_PRODUCTO.EST,   
TM_CATEGORIA.CAT_NOM,   
TM_MONEDA.MON_NOM,   
TM_UNIDAD.UND_NOM  
FROM              
TM_PRODUCTO INNER JOIN  
TM_CATEGORIA ON TM_PRODUCTO.CAT_ID = TM_CATEGORIA.CAT_ID INNER JOIN  
TM_MONEDA ON TM_PRODUCTO.MON_ID = TM_MONEDA.MON_ID INNER JOIN  
TM_UNIDAD ON TM_PRODUCTO.UND_ID = TM_UNIDAD.UND_ID  
 WHERE    
 TM_PRODUCTO. CAT_ID = @CAT_ID    
 AND TM_PRODUCTO.EST=1    
END 


--Obtener registro por ID  
ALTER PROCEDURE SP_L_PRODUCTO_02  
@PROD_ID INT  
AS  
BEGIN  
 SELECT          
TM_PRODUCTO.PROD_ID,   
TM_PRODUCTO.SUC_ID,   
TM_PRODUCTO.CAT_ID,   
TM_PRODUCTO.PROD_NOM,   
TM_PRODUCTO.PROD_DESCRIP,   
TM_PRODUCTO.UND_ID,   
TM_PRODUCTO.MON_ID,   
TM_PRODUCTO.PROD_PCOMPRA,   
TM_PRODUCTO.PROD_PVENTA,   
TM_PRODUCTO.PROD_STOCK,   
TM_PRODUCTO.PROD_FECHAVEN,   
TM_PRODUCTO.PROD_IMG,   
TM_PRODUCTO.FECH_CREA,   
TM_PRODUCTO.EST,   
TM_CATEGORIA.CAT_NOM,   
TM_MONEDA.MON_NOM,   
TM_UNIDAD.UND_NOM  
FROM              
TM_PRODUCTO INNER JOIN  
TM_CATEGORIA ON TM_PRODUCTO.CAT_ID = TM_CATEGORIA.CAT_ID INNER JOIN  
TM_MONEDA ON TM_PRODUCTO.MON_ID = TM_MONEDA.MON_ID INNER JOIN  
TM_UNIDAD ON TM_PRODUCTO.UND_ID = TM_UNIDAD.UND_ID  
 WHERE  
 TM_PRODUCTO.PROD_ID = @PROD_ID  
END