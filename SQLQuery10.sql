create PROCEDURE [dbo].[SP_L_USUARIO_04]    
@SUC_ID INT,    
@USU_CORREO VARCHAR(50),    
@USU_PASS VARCHAR(30)    
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
 TM_SUCURSAL.EMP_ID,     
 TM_SUCURSAL.SUC_NOM,    
 TM_EMPRESA.EMP_ID,    
 TM_EMPRESA.EMP_NOM,     
 TM_EMPRESA.EMP_RUC,     
 TM_EMPRESA.COM_ID,     
 TM_COMPANIA.COM_NOM    
 FROM      
 TM_USUARIO INNER JOIN    
 TM_SUCURSAL ON TM_USUARIO.SUC_ID = TM_SUCURSAL.SUC_ID INNER JOIN    
 TM_EMPRESA ON TM_SUCURSAL.EMP_ID = TM_EMPRESA.EMP_ID INNER JOIN    
 TM_COMPANIA ON TM_EMPRESA.COM_ID = TM_COMPANIA.COM_ID    
 WHERE    
 TM_USUARIO.SUC_ID = @SUC_ID     
 AND TM_USUARIO.USU_CORREO = @USU_CORREO    
 AND TM_USUARIO.USU_PASS = @USU_PASS    
 AND TM_USUARIO.EST = 1    
END 