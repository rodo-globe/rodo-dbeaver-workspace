use gssecurity_3_6_0;

select * from Empresa e order by e.id DESC ;
select * from Empresa_Aplicacion ea ;

-- ASESP ID 21


-- asespUSer 51
-- asespPrg 50
select * from Usuario u order by u.id DESC ;
update Usuario u set u.estado = 0 where u.id in (50,51);
update Usuario u set u.celular  = '+598 99 265 202' where u.id in (50,51);

select id, email, nombre, userId, celular from Usuario u where u.id in (50,51);

select * from Usuario u where u.celular != '';

use timetracker;

select * from Contract; -- 18;
select * from Contract c where c.id = 21;
select * from ContractApp ca where contract_id in (21,22,25,26,33);
select * from ContractApp ca where contract_id = 21;
select * from Contract_Product cp ;
select * from Product p where id  = 7;

select * from Client; -- 3 Microfin

select * from Aplicacion a ;

select * from Sesion s where token = 'tfp6vi86ju6b83ksoivql8kqgamnin0' ;

select * from Usuario where userId = 'ycosta';


select * from Aplicacion a where porEmpresa =true;
select * from Aplicacion a where porEmpresa =FALSE;

select * from Empresa_Aplicacion ea where ea.Empresa_id =21;
select * from Aplicacion a where id in (18, 22,23,24);

select * from Rol r where r.nombre like "%servidor%";
select * from Aplicacion a where a.id = 2;

select * from Usuario_Rol ur where ur.roles_id = 14;

select * from Usuario u where u.id in (11,17,25); 
select * from Aplicacion_Funcionalidad_RolAut afra where aplicacion_id = 2 ;
select * from Rol where id in(7,14);
select * from Funcionalidad f where id in (8,38);

select * from Aplicacion_RolAut ara where ara.Aplicacion_id = 2;

select * from Usuario_Rol ur where ur.roles_id = 14;

select * from Campos_Externos_Autoregistro cea;

