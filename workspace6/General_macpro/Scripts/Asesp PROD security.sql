select * from Usuario u where userId = "medico" or userId = "enfermera";
select * from Usuario u where userId = "administrativo";
select * from InstanceApp;
select * from Usuario order by id desc;

select * from InstanceApp i where i.usuario_id = 2 ;
select * from Modulo m where m.nombre = "desarrollo";

select * from Aplicacion a ;
select * from Funcionalidad f ;

select * from Funcionalidad f where f.nombre like "%cuestionariosUser%";