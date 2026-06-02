select * from Aplicacion a ; -- 3 App, 4 RRHH

select * from Funcionalidad f order by id ;

select * from Funcionalidad f where f.nombre like "%cuestionariosUser%";

select * from Funcionalidad f ;

select * from Modulo m ;

select * from Modulo m order by id desc;

select * from Modulo_Funcionalidad mf order by funcionalidad_id desc ;

SELECT * from Usuario u where u.userId = "24106" ;

SELECT * from Usuario u where u.email like "%lobe%";

update Funcionalidad set aplicacion_id  =


select * from Rol r  where aplicacion_id = 4;


select * from Usuario u where id in (40,42,37,34,33,15,17,13,28,111,14,27,10,26,18,25,105,102,104,21,103);

update Usuario set estado = 1 where id in (40,42,37,34,33,15,17,13,28,111,14,27,10,26,18,25,105,102,104,21,103);

select * from Usuario where idexterno = 24106;

select * from Usuario where userid = "jperez"; -- id 250, idExterno 19668

SELECT * from Usuario u where u.userId in ("Mlegnazzi", "Flegnazzi");

select * from Usuario u where u.email= "gcasas@asesp.com.uy";

select * from Usuario u;
select * from Usuario_InstanciaCampoAutoregistro uica where uica.Usuario_id = 255;
select * from InstanciaCampoAutoregistro ica where ica.id in (475,476);


select u.*
FROM Usuario u 
JOIN Usuario_InstanciaCampoAutoregistro uica on u.id = uica.Usuario_id 
JOIN InstanciaCampoAutoregistro ica on uica.camposAutoregistro_id = ica.id
WHERE ica.valor = "31205" 
and u.estado = 0;

delete from Modulo where id = 38;


select * from Usuario_Rol ur where ur.Usuario_id = 250;
select * from Rol ;

select * from SolicitudReseteo sr ;

select * from Usuario;
select * from Aplicacion; -- 3 Soy Española, 4 RRHH
select * from Usuario_Aplicacion ua ;

select * from Usuario where userid = "mvazquez" or userId = "vestefan";  -- estado 3 = borrado, estado 0 = activo



select * from  Usuario u
JOIN Usuario_Aplicacion ua ON ua.Usuario_id = u.id
where ua.aplicaciones_id in (3,4);

update Usuario u
JOIN Usuario_Aplicacion ua ON ua.Usuario_id = u.id
set u.password = "cdcb0fe5852536178b4c0fbbab8d96fd9c9553a66d3d28a442d20525c653c08e" 
where ua.aplicaciones_id in (3,4);


select u.* from Usuario u
join Usuario_Aplicacion ua on ua.Usuario_id = u.id
where ua.aplicaciones_id in (3,4) ;

select count(*) from Usuario u
join Usuario_Aplicacion ua on ua.Usuario_id = u.id
where ua.aplicaciones_id = 4 
and u.estado = 0;

UPDATE Usuario u
JOIN Usuario_Aplicacion ua ON ua.Usuario_id = u.id
SET u.fechaBaja = '2025-09-15 19:46:56'
WHERE ua.aplicaciones_id = 4
AND u.estado = 3;

UPDATE Usuario u
JOIN Usuario_Aplicacion ua ON ua.Usuario_id = u.id
SET u.estado = 0
WHERE u.fechaBaja = '2025-09-15 19:46:56' -- ua.aplicaciones_id = 4
and u.estado = 3 ;


alter table Campos_Externos_Autoregistro 
      add column esUnico bit not null;
     

select * from Campos_Externos_Autoregistro;
update Campos_Externos_Autoregistro set esUnico = true where id = 2;
     
select u from Usuario u JOIN u.camposAutoregistro ica
WHERE ica.clave = :clave AND ica.valor = :valor AND u.estado = com.globesoftware.gssecurity.common.enums.EstadoUsuario.ACTIVO

select u.*, ica.* from 
Usuario_InstanciaCampoAutoregistro uica 
join Usuario u on u.id = uica.Usuario_id 
join InstanciaCampoAutoregistro ica on ica.id = uica.camposAutoregistro_id 
where ica.clave = "Número cobro"
and ica.valor = "18394"; 

select u.*, ica.* from 
Usuario_InstanciaCampoAutoregistro uica 
join Usuario u on u.id = uica.Usuario_id 
join InstanciaCampoAutoregistro ica on ica.id = uica.camposAutoregistro_id
where u.estado = 0 and not isnull(ica.valor) ;

select u.*, ica.valor 
from Usuario u 
join Usuario_InstanciaCampoAutoregistro uica on   
join  on u.id = uica.Usuario_id 
join InstanciaCampoAutoregistro ica on ica.id = uica.camposAutoregistro_id 
where ica.clave = "Número cobro"
and ica.valor = "18394"; 

explain Select u.* from Usuario u 
Join Usuario_InstanciaCampoAutoregistro uica on u.id = uica.Usuario_id
Join InstanciaCampoAutoregistro ica on ica.id = uica.camposAutoregistro_id
where 
ica.valor = "25065" and 
ica.clave ="Número cobro";

CREATE INDEX idx_ica_clave_valor 
ON InstanciaCampoAutoregistro(clave, valor(50));

CREATE INDEX idx_uica_campo_usuario 
ON Usuario_InstanciaCampoAutoregistro(camposAutoregistro_id, Usuario_id);

select * from Usuario;

select * from Usuario u where u.userId = "25065" and u.password = "cdcb0fe5852536178b4c0fbbab8d96fd9c9553a66d3d28a442d20525c653c08e";

select * from Usuario u where u.userId = "25065";
select * from Usuario u where u.email = "rodolfo@globe-software.com";

select * from Usuario u where u.id in (9,93,96,97);

-- select * from Usuario u where u.userId = "medico";

update Usuario set fechaBaja = null where fechaBaja = '2026-02-09 19:48:01';

select * from Usuario u
where u.estado = 0 and ISNULL(u.fechaBaja); 

select * from Usuario u
where u.estado = 0 and not ISNULL(u.fechaBaja); 


select u.estado, count(*) from Usuario u
group by u.estado ;

select u.estado, u.userId, u.nombre from Usuario u
group by u.estado ; -- 0 activo, 1 pendiente, 2 inactivo, 3 eliminado



select u.estado, u.userId, u.nombre from Usuario u
where u.estado = 0 ;

select u.estado, u.userId, u.nombre, u.fechaBaja from Usuario u
where u.userId = 24106;






