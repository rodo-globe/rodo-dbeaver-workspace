
use gs_security_3_6_2;


-- select * from Aplicacion;
-- select * from Otra_Empresa_Aplicacion oea ;
-- select * from Rol;
-- select * from Usuario;
-- select * from Usuario_Aplicacion ua;
-- select * from Empresa;
-- select * from Empresa_Aplicacion ea ;
-- select * from Rol;
-- select * from Usuario_Rol ur;
-- select * from Aplicacion_RolAut ara ;
-- select * from Modulo m ;
-- select * from Funcionalidad;
-- select * from Modulo_RolAut;
-- SELECT * from Aplicacion_Funcionalidad_RolAut afra ;


INSERT INTO Aplicacion 
(id, version, cantidadSesionesConcurrentes, duracionSesion, etiqueta, nombre, habilitada, porEmpresa)
VALUES (0,1,1,3600,'seguridad','Seguridad',1,0);

INSERT INTO Empresa 
(id, version, idExterno, nombre, politica_id, fechaBaja)
VALUES (1,1,'7','Globe',NULL,NULL);

insert into Empresa_Aplicacion 
(captcha, captchaSecretKey, notificationSecretKey, siteKey, version, aplicacion_id, empresa_id)
values
(false, NULL, NULL, NULL, 1, 1, 1);

insert into Otra_Empresa_Aplicacion 
(Empresa_id, aplicaciones_id) 
values
(1,1);

insert into Rol 
(id, version, nombre, codigo, aplicacion_id)
values
(1, 1, "Administrador Seguridad", "admin", 1);

insert into Rol 
(id, version, nombre, codigo, aplicacion_id)
values
(2, 1, "Servidor cliente de GSSec", "servidores", 1);

INSERT INTO Usuario
(id, version, celular, email, estado, fechaBaja, idExterno, imagen, loginFallidos, loginLDAP, nombre, password, userId, empresa_id, supervisor_id)
VALUES 
(1,1,'','info@globe-software.com',0,NULL,NULL,NULL,0,0,'Admin Security','692a7b1fb448d71aaa0da971559f55eacdd514cef99b402e9be501502d5ec30d','globe',1,NULL);

INSERT INTO Usuario_Aplicacion  
(usuario_id, aplicaciones_id)
VALUES 
(1,1);

insert into Usuario_Rol 
(Usuario_id, roles_id)
values(1,1);

insert into Aplicacion_RolAut
(Aplicacion_id, rolesAutorizados_id)
values(1,1);

insert into Aplicacion_RolAut
(Aplicacion_id, rolesAutorizados_id)
values(1,2);

INSERT INTO Modulo
VALUES (1,1,'AdminSeguridad','AdminSeguridad',1),
(2,7,'RolesSeguridad','RolesSeguridad',1),
(3,22,'UsuariosSeguridad','UsuariosSeguridad',1),
(4,1,'EmpresasSeguridad','EmpresasSeguridad',1),
(5,1,'PoliticasSeguridad','PoliticasSeguridad',1),
(6,1,'SimuladorSeguridad','SimuladorSeguridad',1),
(7,1,'LicenciaSeguridad','LicenciaSeguridad',1),
(8,1,'FuncionalidadesSeguridad','FuncionalidadesSeguridad',1);

INSERT INTO `Funcionalidad` VALUES 
(1,1,'Listado de usuarios','listado-usuarios',1),
(2,1,'ObtenerLicencia','ObtenerLicencia',1);

INSERT INTO `Modulo_RolAut` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1);

INSERT INTO `Aplicacion_Funcionalidad` VALUES (1,1),(2,1);

insert into Aplicacion_Funcionalidad_RolAut 
(aplicacion_id, funcionalidad_id, rolesAutorizados_id)
values
(1, 1, 2),
(1, 2, 1);


