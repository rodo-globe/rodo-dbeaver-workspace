select * from Ambiente a ;
select * from Servidor s ;

select * from Ambiente_GrupoUsuarios;

select * from Ambiente_GrupoUsuarios agu where agu.Ambiente_id = 1;


select * from Liberacion l ;
select * from Envio e ;
select * from Version v ;
select * from Archivo a;

select v.*, a.nombre from Version v join Archivo a on v.archivo_id  = a.id;

-- liberados
select a.*, v.*, e.id, e.estado  from Envio e join
envio_version_liberados evl on e.id = evl.envio_id
join Version v on evl.version_id = v.id  
join Archivo a on a.id = v.archivo_id  ;
 
-- solicitados
select a.*, v.*, e.id, e.estado from Envio e join
envio_version_solicitados evs on e.id = evs.envio_id
join Version v on evs.version_id = v.id  
join Archivo a on a.id = v.archivo_id  ;

-- pre aprobacion
select a.* from Envio e join
envio_version_pre_apro evpa on e.id = evpa.envio_id
join Version v on evpa.version_id = v.id  
join Archivo a on a.id = v.archivo_id  ;

-- pre solicitud
select a.* from Envio e join
envio_version_pre_sol evps on e.id = evps.envio_id
join Version v on evps.version_id = v.id  
join Archivo a on a.id = v.archivo_id  ;


----------------------
 -- SETUP 
 ----------------------
INSERT INTO [hsbc-releases].dbo.Aplicacion (activo,version,nombre,packageBase) VALUES
	 (1,SYSDATETIME(),N'app',N'com.app');
INSERT INTO [hsbc-releases].dbo.GrupoUsuarios (activo,version,descripcion,nombre) VALUES
	 (1,SYSDATETIME(),N'SoliDes',N'SoliDes'),
	 (1,SYSDATETIME(),N'SoliTest',N'SoliTest'),
	(1,SYSDATETIME(),N'AprobDev',N'AprobDev');
INSERT INTO [hsbc-releases].dbo.Ambiente (activo,version,esProduccion,keepAlive,nombre,solicitantes_id, admiteSinOrigen, aplicacion_id) VALUES
	 (1,SYSDATETIME(),0,1,N'Desarrollo',1,1,1),
	 (1,SYSDATETIME(),0,1,N'Testing',2,0,1),
	(1,SYSDATETIME(),0,1,N'Desarrollo mantenimiento',1,1,1);
INSERT INTO [hsbc-releases].dbo.Servidor (activo,version,contrasenia,ip,nombre,pathArchivos,pathBackup,pathServicio,puerto,sistemaOperativo,usuario,ambiente_id) VALUES
	 (1,SYSDATETIME(),N'98989',N'192.168.2.2',N'servidor desarrollo',N'/Users/rodo/tmp/hsbc-releases-files/servidores/Dev',N'/var/backup',N'/var/www/servicios',N'22',N'LINUX',N'admin',1),
	 (1,SYSDATETIME(),N'pass',N'192.168.2.2',N'serv testing',N'/Users/rodo/tmp/hsbc-releases-files/servidores/Testing',N'/var/backup',N'/var/www/servicios',N'22',N'WINDOWS',N'admin',2),
	(1,SYSDATETIME(),N'pass',N'192.168.2.2',N'serv dev mantenimiento',N'/Users/rodo/tmp/hsbc-releases-files/servidores/Mantenimiento/',N'/var/backup',N'/var/www/servicios',N'22',N'WINDOWS',N'admin',3),
	(1,SYSDATETIME(),N'98989',N'192.168.2.5',N'servidor desarrollo 2',N'/Users/rodo/tmp/hsbc-releases-files/servidores/Mantenimiento-aux/',N'/var/backup',N'/var/www/servicios',N'22',N'LINUX',N'admin',3);

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
	
	
	
INSERT INTO [hsbc-releases].dbo.Envio (activo,version,estado,fechaHoraEnvio,uuidArchivos,enviadoPor_id) VALUES
	 (1,NULL,N'PENDIENTE',NULL,N'arch',1);
INSERT INTO [hsbc-releases].dbo.Archivo (activo,version,extension,nombre,qualifiedName,uploadRelativePath,versionActual_id) VALUES
	 (1,NULL,N'.exe',N'exe',N'com.ej.exe',N'ruta',NULL),
	 (1,NULL,N'.exe',N'exe',N'com.ej.exe',N'ruta',NULL),
	 (1,NULL,N'.py',N'py',N'com.ej.py',N'ruta',NULL),
	 (1,NULL,N'.py',N'py',N'com.ej.py',N'ruta',NULL),
	 (1,NULL,N'.js',N'js',N'com.ej.js',N'ruta',NULL);
INSERT INTO [hsbc-releases].dbo.Version (activo,version,causaEliminado,checksum,eliminado,fecha,tamanio,archivo_id,envioEnDestinoPreAprobacion_id,envioEnDestinoPreSolicitud_id,envioLiberados_id,envioSolicitados_id) VALUES
	 (1,NULL,NULL,N'aa2',0,NULL,13,1,NULL,NULL,NULL,1),
	 (1,NULL,NULL,N'aa4',0,NULL,18,2,NULL,NULL,NULL,1),
	 (1,NULL,NULL,N'a',0,NULL,1,3,NULL,NULL,NULL,1),
	 (1,NULL,NULL,N'a',0,NULL,1,4,NULL,NULL,NULL,1),
	 (1,NULL,NULL,N'ooo323',0,NULL,12,5,NULL,NULL,NULL,1);
UPDATE [hsbc-releases].dbo.Archivo SET versionActual_id = 1 WHERE id = 1
UPDATE [hsbc-releases].dbo.Archivo SET versionActual_id = 2 WHERE id = 2
UPDATE [hsbc-releases].dbo.Archivo SET versionActual_id = 3 WHERE id = 3
UPDATE [hsbc-releases].dbo.Archivo SET versionActual_id = 4 WHERE id = 4
UPDATE [hsbc-releases].dbo.Archivo SET versionActual_id = 5 WHERE id = 5




INSERT INTO [hsbc-releases].dbo.Ambiente_Ambiente (Ambiente_id,origenesPermitido_id) VALUES
	 (2,1),
	(3,2);
INSERT INTO [hsbc-releases].dbo.Ambiente_GrupoUsuarios (Ambiente_id,aprobantes_id) VALUES
	 (3,3);
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

