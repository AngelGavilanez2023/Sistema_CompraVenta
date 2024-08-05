


--Listar todos los registros por USUARIO  
ALTER PROCEDURE SP_L_USUARIO_01  
@SUC_ID INT  
AS  
BEGIN  
SELECT        
TM_USUARIO.USU_ID, 
TM_USUARIO.SUC_ID, 
TM_USUARIO.USU_CORREO, 
TM_USUARIO.USU_NOM, 
TM_USUARIO.USU_APE, 
TM_USUARIO.USU_DNI, 
TM_USUARIO.USU_TELF, 
TM_USUARIO.USU_PASS, 
TM_USUARIO.ROL_ID, 
TM_USUARIO.FECH_CREA,
TM_ROL.ROL_NOM, 
TM_USUARIO.EST
FROM            
TM_USUARIO INNER JOIN
TM_ROL ON TM_USUARIO.ROL_ID = TM_ROL.ROL_ID
WHERE  
TM_USUARIO.SUC_ID = @SUC_ID  
AND TM_USUARIO.EST=1  
END

--Obtener registro por ID
CREATE PROCEDURE SP_L_USUARIO_02
@USU_ID INT
AS
BEGIN
	SELECT * FROM TM_USUARIO
	WHERE
	USU_ID = @USU_ID
END

--Eliminar Registro
CREATE PROCEDURE SP_D_USUARIO_01
@USU_ID INT
AS
BEGIN
	UPDATE TM_USUARIO
	SET
		EST= 0
	WHERE
		USU_ID = @USU_ID
END

--REGISTRAR NUEVO REGISTRO
CREATE PROCEDURE SP_I_USUARIO_01
@SUC_ID INT,
@USU_CORREO VARCHAR(150),
@USU_NOM VARCHAR(150),
@USU_APE VARCHAR(150),
@USU_DNI VARCHAR(150),
@USU_TELF VARCHAR(150),
@USU_PASS VARCHAR(150),
@ROL_ID INT
AS
BEGIN
	INSERT INTO TM_USUARIO
	(SUC_ID,USU_CORREO,USU_NOM,USU_APE,USU_DNI,USU_TELF,USU_PASS,ROL_ID,FECH_CREA,EST)
	VALUES
	(@SUC_ID,@USU_CORREO,@USU_NOM,@USU_APE,@USU_DNI,@USU_TELF,@USU_PASS,@ROL_ID,GETDATE(),1)
END

--ACTUALIZAR REGISTRO
CREATE PROCEDURE SP_U_USUARIO_01
@USU_ID INT,
@SUC_ID INT,
@USU_CORREO VARCHAR(150),
@USU_NOM VARCHAR(150),
@USU_APE VARCHAR(150),
@USU_DNI VARCHAR(150),
@USU_TELF VARCHAR(150),
@USU_PASS VARCHAR(150),
@ROL_ID INT
AS
BEGIN
	UPDATE TM_USUARIO
	SET
		SUC_ID = @SUC_ID,
		USU_CORREO = @USU_CORREO,
		USU_NOM = @USU_NOM,
		USU_APE = @USU_APE,
		USU_DNI = @USU_DNI,
		USU_TELF = @USU_TELF,
		USU_PASS = @USU_PASS,
		ROL_ID = @ROL_ID
	WHERE
		USU_ID = @USU_ID
END

--ACCESO DE USUARIO
CREATE PROCEDURE SP_L_USUARIO_03
@USU_CORREO VARCHAR(150),
@USU_PASS VARCHAR(50)
AS
BEGIN
	SELECT * FROM TM_USUARIO
	WHERE
	USU_CORREO = @USU_CORREO
	AND USU_PASS = @USU_PASS
	AND EST=1
END

--CAMBIO DE CONTRASE�A
CREATE PROCEDURE SP_U_USUARIO_02
@USU_ID INT,
@USU_PASS VARCHAR(50)
AS
BEGIN
	UPDATE TM_USUARIO
	SET
		USU_PASS = @USU_PASS
	WHERE
		USU_ID = @USU_ID
END