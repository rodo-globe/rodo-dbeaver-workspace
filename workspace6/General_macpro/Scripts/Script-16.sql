select * from Funcionalidad f where f.nombre = "datosIniciales";
update Funcionalidad set nombre = "datos-iniciales" where nombre = "datosIniciales";	

select * from Usuario u where u.idExterno = 898;


select * from Usuario u where u.idExterno = 8;
select * from Usuario_GrupoRolesAutoregistro ugra ;

select gra.*, u.* from Usuario_GrupoRolesAutoregistro ugra 
join Usuario u on u.id = ugra.Usuario_id 
join GrupoRolesAutoregistro gra on gra.id = ugra.gruposAutoregistro_id
where u.userId = 898;


select r.* from Usuario_Rol ur
join Usuario u on u.id = ur.Usuario_id
join Rol r on ur.roles_id = r.id  
where u.userId = 999;

select * from Rol;
select * from GrupoRolesAutoregistro gra ;


select * from Aplicacion a ;


select * from Sesion s where s.usuario_id = 304 order by creacion desc;

select * from Usuario u; -- where u.userId = "101";
select * from Usuario u where u.idExterno = "26914"; -- 294

select * from Usuario u where u.nombre like "%gandini%"; 

select * from Usuario_GrupoRolesAutoregistro ugra 
where ugra.Usuario_id = 294;

-- CASO PROD PUNTO 18
select u.id, u.idExterno, u.nombre, u.estado, gra.nombre 
from Usuario u
join Usuario_GrupoRolesAutoregistro ugra on ugra.Usuario_id = u.id 
join GrupoRolesAutoregistro gra on gra.id = ugra.gruposAutoregistro_id 
where u.idExterno = "26914";

select u.id, u.idExterno, u.nombre, u.estado, r.codigo, r.nombre, r.aplicacion_id, a.etiqueta from Usuario_Rol ur 
join Usuario u on u.id  = ur.Usuario_id 
join Rol r on r.id = ur.roles_id 
join Aplicacion a on r.aplicacion_id = a.id 
where u.idExterno = "26914";


-- CASO PROD PUNTO 21 - Alejandra Gandini es superusuario
select u.id, u.idExterno, u.nombre, u.estado, gra.nombre 
from Usuario u
join Usuario_GrupoRolesAutoregistro ugra on ugra.Usuario_id = u.id 
join GrupoRolesAutoregistro gra on gra.id = ugra.gruposAutoregistro_id 
where u.userId = "agandini";

select u.id, u.idExterno, u.nombre, u.estado, r.codigo, r.nombre, r.aplicacion_id, a.etiqueta from Usuario_Rol ur 
join Usuario u on u.id  = ur.Usuario_id 
join Rol r on r.id = ur.roles_id 
join Aplicacion a on r.aplicacion_id = a.id 
where u.userId = "agandini";

 

