select * from Usuario u where u.userId = "globe";

select e.nombre, a.nombre from Empresa_Aplicacion ea 
join Empresa e on e.id = ea.Empresa_id 
join Aplicacion a on a.id = ea.aplicacion_id ;

select * from InvoiceConfiguration ic ;
select * from NumberGenerator ng ;

select * from Document d order by id DESC ;

select * from Company c;

select * from BusinessLine bl;
select * from Company_BusinessLine cbl ;

select * from Mail_AttachedFile maf ;
select * from Minuta;

select * From Proforma ;
select * From ProformaLine pl ;
select * from Resource r ;
select * from TimeOff to2 ;
select * from UserCosts uc ;