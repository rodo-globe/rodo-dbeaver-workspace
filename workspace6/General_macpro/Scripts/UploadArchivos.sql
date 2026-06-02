select * from Rol;

select * from Usuario u;
select * from GrupoUsuarios gu ;

select gu.*, r.* from GrupoUsuarios_Rol gur
join GrupoUsuarios gu on gur.GrupoUsuarios_id = gu.id
join Rol r on gur.roles_id = r.id;

select gu.*, r.* from GrupoUsuarios_Rol gur
join GrupoUsuarios gu on gur.GrupoUsuarios_id = gu.id
join Rol r on gur.roles_id = r.id
join GrupoUsuarios_Usuario guu on guu.GrupoUsuarios_id = gu.id 
join Usuario u on u.id = guu.usuarios_id
where u.id = 1;


select * from GrupoUsuarios_Usuario guu 
join Usuario u on u.id = guu.usuarios_id
where u.id = 1;

select * from Origen o ;
SELECT * from HistoricoUpload hu ;