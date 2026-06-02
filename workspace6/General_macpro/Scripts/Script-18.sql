select * from Usuario u ;

select * from Cuenta ;
select * from Profile;
select * From Permiso p ;
select * from Cuenta_Permiso cp ;

select * from Revision r ;
select * from Revision_Revisor rr ;
select * from Revision_Revisor rr where rr.Revision_id = 35;
select * from Revisor; -- cabezal del paquete de datos a revisar, puntero al manager

-- integracion del paquete
select * from Revisor_CuentaRevision rcr ; 
select * from CuentaRevision cr ; -- detalle de las cuentas
select * from LineaRevision lr ; -- detalle de permisos (dejar redundante Permisos y Profile)

select * from ProfileRevisionDetalle;