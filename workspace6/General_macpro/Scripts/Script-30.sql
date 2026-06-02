select * from Usuario order by id desc;



describe Usuario;

show index from Usuario;


select * from Usuario where userId = 37553393;

select * from Usuario_Aplicacion ua where ua.Usuario_id = 4121;
delete from Usuario_Aplicacion ua where ua.Usuario_id = 4121;

select * from Solicitud_Activacion sa where sa.usuario_id = 4121;
delete from Solicitud_Activacion sa where sa.usuario_id = 4121;

select * from Usuario_Rol ur where ur.Usuario_id = 4121;
delete from Usuario_Rol ur where ur.Usuario_id = 4121;

select * from Usuario_InstanciaCampoAutoregistro uica where uica.Usuario_id = 4121;
delete from Usuario_InstanciaCampoAutoregistro uica where uica.Usuario_id = 4121;

delete from Usuario where id = 4121;