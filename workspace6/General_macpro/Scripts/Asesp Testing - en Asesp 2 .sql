use gs_security_3_6_2;

Select * from Usuario u where u.nombre like "%Bianca%";
select * from Usuario_InstanciaCampoAutoregistro ia where usuario_id = 2;

select * from Usuario_InstanciaCampoAutoregistro ia where Usuario_id = 2;

Select * from Usuario u where id > 75; -- 76,77,78,79,8

select * from Usuario where email = "veronica3485@gmail.com";

select * from Campos_Externos_Autoregistro cea ;
select * from InstanciaCampoAutoregistro ica ;



select * from Usuario_InstanciaCampoAutoregistro uica  where uica.Usuario_id = 3;

ALTER TABLE `Usuario` ADD UNIQUE (`userId`);

Select * from Usuario u where id > 75;
select * from Usuario_Aplicacion ua where Usuario_id > 75;
SELECT * from Usuario_GrupoRolesAutoregistro ugra where Usuario_id > 75;
select * from Usuario_InstanciaCampoAutoregistro uica where Usuario_id > 75;
select * from Usuario_Rol ur where Usuario_id > 75;
select * from Solicitud_Activacion sa where usuario_id > 75;
select * from RegistroTrafico rt where usuario_id > 75;
select * from Sesion s where s.usuario_id > 75;
select * from InstanceApp ia where usuario_id = 2;

delete from Usuario where id >= 76;
delete from Usuario_Aplicacion ua where Usuario_id > 75;
delete from Usuario_GrupoRolesAutoregistro ugra where Usuario_id > 75;
delete from Usuario_InstanciaCampoAutoregistro uica where Usuario_id > 75;
delete from Usuario_Rol ur where Usuario_id > 75;
delete from Solicitud_Activacion where Usuario_id > 75;
delete from RegistroTrafico rt where usuario_id > 75;
delete from Sesion s where s.usuario_id > 75;
delete from  InstanceApp ia where usuario_id > 75;


select userId, idExterno, nombre from Usuario where estado = 0;