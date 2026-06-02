
use gs_security_3_6_2;


select * from Aplicacion;


INSERT INTO Aplicacion 
(id, version, cantidadSesionesConcurrentes, duracionSesion, etiqueta, nombre, habilitada, porEmpresa)
VALUES (0,1,1,3600,'seguridad','Seguridad',1,0);


select * from Empresa;

INSERT INTO Empresa 
(id, version, idExterno, nombre, politica_id, fechaBaja)
VALUES (1,1,'7','Globe',NULL,NULL);

select * from Empresa_Aplicacion ea ;

insert into Empresa_Aplicacion 
(captcha, captchaSecretKey, notificationSecretKey, siteKey, version, aplicacion_id, empresa_id)
values
(false, NULL, NULL, NULL, 1, 1, 1);

select * from Otra_Empresa_Aplicacion oea ;

insert into Otra_Empresa_Aplicacion 
(Empresa_id, aplicaciones_id) 
values
(1,1);

select * from Rol;

insert into Rol 
(id, version, nombre, codigo, aplicacion_id)
values
(1, 1, "Administrador Seguridad", "admin", 1);

insert into Rol 
(id, version, nombre, codigo, aplicacion_id)
values
(2, 1, "Servidor cliente de GSSec", "servidores", 1);


select * from Usuario;

INSERT INTO Usuario
(id, version, celular, email, estado, fechaBaja, idExterno, imagen, loginFallidos, loginLDAP, nombre, password, userId, empresa_id, supervisor_id)
VALUES 
(1,1,'','info@globe-software.com',0,NULL,NULL,NULL,0,0,'Admin Security','692a7b1fb448d71aaa0da971559f55eacdd514cef99b402e9be501502d5ec30d','globe',1,NULL);

select * from Usuario_Aplicacion ua;


INSERT INTO Usuario_Aplicacion  
(usuario_id, aplicaciones_id)
VALUES 
(1,1);

select * from Rol;
select * from Usuario_Rol ur;

insert into Usuario_Rol 
(Usuario_id, roles_id)
values(1,1);

select * from Aplicacion_RolAut ara ;
insert into Aplicacion_RolAut
(Aplicacion_id, rolesAutorizados_id)
values(1,1);

insert into Aplicacion_RolAut
(Aplicacion_id, rolesAutorizados_id)
values(1,2);

select * from Modulo m ;

INSERT INTO Modulo
VALUES (1,1,'AdminSeguridad','AdminSeguridad',1),
(2,7,'RolesSeguridad','RolesSeguridad',1),
(3,22,'UsuariosSeguridad','UsuariosSeguridad',1),
(4,1,'EmpresasSeguridad','EmpresasSeguridad',1),
(5,1,'PoliticasSeguridad','PoliticasSeguridad',1),
(6,1,'SimuladorSeguridad','SimuladorSeguridad',1),
(7,1,'LicenciaSeguridad','LicenciaSeguridad',1),
(8,1,'FuncionalidadesSeguridad','FuncionalidadesSeguridad',1);


select * from Funcionalidad;

select * from Funcionalidad f where f.aplicacion_id in (3,4);

INSERT INTO `Funcionalidad` VALUES 
(1,1,'Listado de usuarios','listado-usuarios',1),
(2,1,'ObtenerLicencia','ObtenerLicencia',1);

select * from Modulo_RolAut;

INSERT INTO `Modulo_RolAut` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1);

INSERT INTO `Aplicacion_Funcionalidad` VALUES (1,1),(2,1);

SELECT * from Aplicacion_Funcionalidad_RolAut afra ;

insert into Aplicacion_Funcionalidad_RolAut 
(aplicacion_id, funcionalidad_id, rolesAutorizados_id)
values
(1, 1, 2),
(1, 2, 1);

select * from Modulo m where aplicacion_id = 3;
select * from Funcionalidad f where f.aplicacion_id = 3;
select * from Modulo_Funcionalidad mf where mf.funcionalidad_id = 8;
select * from Modulo_RolAut mra where mra.Modulo_id = 12;
select * from Modulo_Funcionalidad_RolAut mfra where mfra.funcionalidad_id = 8;
select * from Rol r where r.id = 7;

select * from Empresa_GrupoRolesAutoregistro egra ;
select * from GrupoRolesAutoregistro gra ;

select * from Modulo_Funcionalidad_RolAut mfra;

select * from Funcionalidad f;

select * from Funcionalidad f where f.aplicacion_id in (3,4);

INSERT INTO `Funcionalidad` VALUES 
(0,0,'Licencia por estudio','7',3),
(0,0,'Licencia por estudio','7',4),
(0,0,'Licencia por matrimonio','8',3),
(0,0,'Licencia por matrimonio','8',4),
(0,0,'Licencia por maternidad','9',3),
(0,0,'Licencia por maternidad','9',4),
(0,0,'Licencia por paternidad','10',3),
(0,0,'Licencia por paternidad','10',4);

INSERT INTO `Funcionalidad` VALUES 
(0,0,'Medio horario por maternidad / paternidad - no medico','11',3),
(0,0,'Medio horario por maternidad / paternidad - no medico','11',4),
(0,0,'Reduccion de horario por amamantamiento','12',3),
(0,0,'Reduccion de horario por amamantamiento','12',4),
(0,0,'Cambio de horario','13',3),
(0,0,'Cambio de horario','13',4),
(0,0,'Cambio de tareas','14',3),
(0,0,'Cambio de tareas','14',4),
(0,0,'Problemática Social','15',3),
(0,0,'Problemática Social','15',4),
(0,0,'Licencia con o sin goce de sueldo','16',3),
(0,0,'Licencia con o sin goce de sueldo','16',4),
(0,0,'Carné de salud','17',3),
(0,0,'Carné de salud','17',4),
(0,0,'Constancia de domicilio en el interior','18',3),
(0,0,'Constancia de domicilio en el interior','18',4),
(0,0,'Adelanto de sueldo, aguinaldo o licencia','19',3),
(0,0,'Adelanto de sueldo, aguinaldo o licencia','19',4),
(0,0,'Licencia por cursos o congresos no medicos','20',3),
(0,0,'Licencia por cursos o congresos no medicos','20',4),
(0,0,'Devolucion de uniforme o materiales','21',3),
(0,0,'Devolucion de uniforme o materiales','21',4),
(0,0,'Licencia por congreso médicos','22',3),
(0,0,'Licencia por congreso médicos','22',4),
(0,0,'Actualización de domicilio','23',3),
(0,0,'Actualización de domicilio','23',4),
(0,0,'Actualización de domicilio - copy','24',3),
(0,0,'Actualización de domicilio - copy','24',4),
(0,0,'Solicitud de constancias laborales','25',3),
(0,0,'Solicitud de constancias laborales','25',4),
(0,0,'Regularización de cargos','26',3),
(0,0,'Regularización de cargos','26',4),
(0,0,'Cambio de régimen','27',3),
(0,0,'Cambio de régimen','27',4),
(0,0,'Cambio de sector','28',3),
(0,0,'Cambio de sector','28',4),
(0,0,'Medio horario por maternidad / paternidad - medico','29',3),
(0,0,'Medio horario por maternidad / paternidad - medico','29',4),
(0,0,'Hijo enfermo','30',3),
(0,0,'Hijo enfermo','30',4),
(0,0,'Certificación médica','31',3),
(0,0,'Certificación médica','31',4),
(0,0,'Falta con y sin aviso','32',3),
(0,0,'Falta con y sin aviso','32',4),
(0,0,'Papanicolau y Mamografía','33',3),
(0,0,'Papanicolau y Mamografía','33',4),
(0,0,'Citación judicial','34',3),
(0,0,'Citación judicial','34',4);


select * from Rol;

select * from Usuario where isnull(idExterno);

select idExterno, nombre from Usuario where userId = 'ycosta';

select * from Usuario; 

select * from Empresa_Aplicacion ea ;

select * from Modulo m ;
select * from Aplicacion a ;

select * from Funcionalidad f where nombre = 'datos-iniciales';

select * from Funcionalidad f where aplicacion_id = 4;
select * from Funcionalidad f where aplicacion_id = 3;
select * from Funcionalidad f where f.nombre = "24" or f.nombre = "22";
select * from Funcionalidad f where f.nombre = "47" or f.nombre = "51";



select *
from
	Funcionalidad funcionali0_ 
inner join
	Aplicacion aplicacion1_ 
	on funcionali0_.aplicacion_id=aplicacion1_.id 
where
aplicacion1_.id=4 ;



select
* 
from
	Funcionalidad funcionali0_ 
inner join
	Aplicacion aplicacion1_ 
	on funcionali0_.aplicacion_id=aplicacion1_.id 
where
aplicacion1_.id=4
and  not (exists (select
	modulofunc2_.funcionalidad_id 
	from
	Modulo_Funcionalidad modulofunc2_ 
	where
	modulofunc2_.funcionalidad_id=funcionali0_.id));


select
	modulofunc2_.funcionalidad_id 
	from
	Modulo_Funcionalidad modulofunc2_ 
	where
	modulofunc2_.funcionalidad_id=22;

select * from Solicitud_Activacion sa ;

select * from Empresa_GrupoRolesAutoregistro egra ;
select * from GrupoRolesAutoregistro gra order by nombre ;
select * from Usuario;


select * from Usuario u where u.userId = "abcdefgh";
select * from Aplicacion a ;

ALTER TABLE `Usuario` ADD UNIQUE (`userId`);
