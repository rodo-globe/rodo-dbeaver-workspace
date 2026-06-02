use hsbc-releases;


select * from Aplicacion;

INSERT INTO [hsbc-releases].dbo.Aplicacion (activo,version,nombre,packageBase) VALUES
	 (1,SYSDATETIME(),N'app',N'com.app');
INSERT INTO [hsbc-releases].dbo.GrupoUsuarios (activo,version,descripcion,nombre) VALUES
	 (1,SYSDATETIME(),N'SoliDes',N'SoliDes'),
	 (1,SYSDATETIME(),N'SoliTest',N'SoliTest'),
	(1,SYSDATETIME(),N'AprobDev',N'AprobDev');
INSERT INTO [hsbc-releases].dbo.Ambiente (activo,version,esProduccion,keepAlive,nombre,aprobantes_id,solicitantes_id, admiteSinOrigen, aplicacion_id) VALUES
	 (1,SYSDATETIME(),0,1,N'Desarrollo',NULL,1,1,1),
	 (1,SYSDATETIME(),0,1,N'Testing',NULL,2,0,1),
	(1,SYSDATETIME(),0,1,N'Desarrollo mantenimiento',3,1,1,1);
INSERT INTO [hsbc-releases].dbo.Servidor (activo,version,contrasenia,ip,nombre,pathArchivos,pathBackup,pathServicio,puerto,sistemaOperativo,usuario,ambiente_id) VALUES
	 (1,SYSDATETIME(),N'98989',N'192.168.2.2',N'servidor desarrollo',N'/var/www/archivos',N'/var/backup',N'/var/www/servicios',N'22',N'LINUX',N'admin',1),
	 (1,SYSDATETIME(),N'pass',N'192.168.2.2',N'serv testing',N'/var/www/archivos',N'/var/backup',N'/var/www/servicios',N'22',N'WINDOWS',N'admin',2),
	(1,SYSDATETIME(),N'pass',N'192.168.2.2',N'serv dev mantenimiento',N'/home/globe/Servidores/Mantenimiento/',N'/var/backup',N'/var/www/servicios',N'22',N'WINDOWS',N'admin',3),
	(1,SYSDATETIME(),N'98989',N'192.168.2.5',N'servidor desarrollo 2',N'/home/globe/Servidores/Mantenimiento-aux/',N'/var/backup',N'/var/www/servicios',N'22',N'LINUX',N'admin',3);

INSERT INTO [hsbc-releases].dbo.RutaExtension (activo,version,destRelativePath,extension,uploadRelativePath) VALUES
	 (1,SYSDATETIME(),N'ruta',N'.png',N'ruta'),
	 (1,SYSDATETIME(),N'r',N'.jpg',N'r'),
	 (1,SYSDATETIME(),N'Application/WEB-INF/classes/',N'.txt',N'Application/WEB-INF/classes/'),
	 (1,SYSDATETIME(),N'Application/WEB-INF/resources/',N'.py',N'Application/WEB-INF/resources/'),
	 (1,SYSDATETIME(),N'Application/WEB-INF/otrosResources/',N'.py',N'Application/WEB-INF/otrosResources/');
INSERT INTO [hsbc-releases].dbo.Rol (activo,version,accesoElevado,descripcion,nombre) VALUES
	 (1,SYSDATETIME(),1,N'Rol',N'solicitante desarrollo'),
	 (1,SYSDATETIME(),1,N'Rol',N'solicitante testing'),
	(1,SYSDATETIME(),1,N'Rol',N'aprobador desarrollo');
INSERT INTO [hsbc-releases].dbo.Usuario (activo,version,apellidos,email,idUsuario,nombres) VALUES
	 (1,SYSDATETIME(),NULL,NULL,N'2',N'Desarrollo'),
	 (1,SYSDATETIME(),NULL,NULL,N'3',N'Testing'),
	 (1,SYSDATETIME(),NULL,NULL,N'4',N'soli mantenimiento');
INSERT INTO [hsbc-releases].dbo.Ambiente_Ambiente (Ambiente_id,origenesPermitido_id) VALUES
	 (2,1),
	(3,2);
INSERT INTO [hsbc-releases].dbo.Aplicacion_RutaExtension (Aplicacion_id,extensionesAdmitidas_id) VALUES
	 (1,1),
	 (1,2),
	 (1,3),
	 (1,4),
	 (1, 5);
INSERT INTO [hsbc-releases].dbo.Aplicacion_admitidasER (Aplicacion_id,admitidasER) VALUES
	 (1,N'[a-zA-Z]+'),
	 (1,N'\\d+');
INSERT INTO [hsbc-releases].dbo.GrupoUsuarios_Rol (GrupoUsuarios_id,roles_id) VALUES
	 (1,1),
	 (2,2),
	 (3,3);
INSERT INTO [hsbc-releases].dbo.GrupoUsuarios_Usuario (GrupoUsuarios_id,usuarios_id) VALUES
	 (1,1),
	 (2,2),
	 (3,1),
	 (1,3);