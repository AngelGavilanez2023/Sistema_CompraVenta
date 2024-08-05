
--Listar todos los registros por Sucursal
CREATE PROCEDURE SP_L_CLIENTE_01
@EMP_ID INT
AS
BEGIN
	SELECT * FROM TM_CLIENTE
	WHERE
	EMP_ID = @EMP_ID
	AND EST=1
END

--Obtener registro por ID
CREATE PROCEDURE SP_L_CLIENTE_02
@CLI_ID INT
AS
BEGIN
	SELECT * FROM TM_CLIENTE
	WHERE
	CLI_ID = @CLI_ID
END

--Eliminar Registro
CREATE PROCEDURE SP_D_CLIENTE_01
@CLI_ID INT
AS
BEGIN
	UPDATE TM_CLIENTE
	SET
		EST= 0
	WHERE
		CLI_ID = @CLI_ID
END

--REGISTRAR NUEVO REGISTRO
CREATE PROCEDURE SP_I_CLIENTE_01  
@EMP_ID INT,  
@CLI_NOM VARCHAR(150),  
@CLI_RUC VARCHAR(15),  
@CLI_TELF VARCHAR(150),  
@CLI_DIRECC VARCHAR(150),  
@CLI_CORREO VARCHAR(100)  
AS  
BEGIN  
 INSERT INTO TM_CLIENTE  
 (CLI_NOM,EMP_ID,CLI_RUC,CLI_TELF,CLI_DIRECC,CLI_CORREO,FECH_CREA,EST)  
 VALUES  
 (@CLI_NOM,@EMP_ID,@CLI_RUC,@CLI_TELF,@CLI_DIRECC,@CLI_CORREO,GETDATE(),1)  
END  

--ACTUALIZAR REGISTRO
CREATE PROCEDURE SP_U_CLIENTE_01  
@CLI_ID INT,  
@CLI_NOM VARCHAR(150),  
@EMP_ID INT,  
@CLI_RUC VARCHAR(150),  
@CLI_TELF VARCHAR(150),  
@CLI_DIRECC VARCHAR(150),  
@CLI_CORREO VARCHAR(100)  
AS  
BEGIN  
 UPDATE TM_CLIENTE  
 SET  
  CLI_NOM = @CLI_NOM,  
  EMP_ID = @EMP_ID,  
  CLI_RUC = @CLI_RUC,  
  CLI_TELF = @CLI_TELF,  
  CLI_DIRECC = @CLI_DIRECC,  
  CLI_CORREO = @CLI_CORREO  
 WHERE  
  CLI_ID = @CLI_ID  
END