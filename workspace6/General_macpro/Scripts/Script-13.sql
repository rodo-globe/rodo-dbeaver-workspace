select a.nombre, e.nombre from Empresa_Aplicacion ea 
join Empresa e on e.id = ea.Empresa_id 
join Aplicacion a on a.id = ea.aplicaciones_id ;


select * from Usuario u where ISNULL(empresa_id) ;

select * from Sprint s order by id desc; -- 219

select * from Task t where t.id = 11493;