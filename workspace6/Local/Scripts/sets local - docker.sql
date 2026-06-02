use sets;

select count(*) from Afiliado a;

select * from Parametro p;
select p.id, p.fechaActual from Parametro p;

update Parametro set fechaActual = null where id = 1;


select * from Localidad where nombre like "%Paysandu%";


select * from Localidad order by nombre;

select * from Departamento;


update Afiliado set fechaNacimiento = null where id = 35528;

select * from Afiliado order by id desc;

select * from Afiliado a where a.numeroDocumento = "35138814";
select * from Afiliado a where a.id = 35528;


delete from EmpresaAfiliado where afiliado_id = 35525;
delete from Afiliado_Direccion where afiliado_id = 35525;
delete from Afiliado where id = 35525;

select * from EmpresaAfiliado where afiliado_id = 35524;
select * from Afiliado_Direccion where afiliado_id = 35524;

select * from Archivo where id = 706;

select * from LineaArchivo where archivo_id = 706;

select * from Direccion order by id DESC ;

SHOW VARIABLES LIKE 'max_allowed_packet';

INSERT INTO Archivo (error) VALUES ('Ya existe una relación con la empresa "A.ESPANOLA 1RA EN S.M." que no tiene fecha de egreso o tiene pero es igual o posterior a la fecha de ingreso.');

select * from Archivo order by id desc;




select * from SolicitudBeneficio sb;

select * from SolicitudBeneficio sb where sb.id = 12857;


select * from Concepto where lower(descripcion) like "%ajuste baja%";

select * from Concepto;
select id, descripcion from Concepto;
select * from Concepto c WHERE c.aplicaFixDiasAPagar = true;

select * from Certificacion order by id desc limit 11 ;

select * 
from Segmento s
where s.certificacionPorEmpresa_id = 165425
order  by s.desde, id desc;

select * from LineaMovimiento lm; 


select s.id, c.descripcion, s.desde , s.hasta , s.sueldoNominal, s.sueldoLiquido, s.montoPago, s.calculoBps, s.solicitud_id, s.generadoPorSolicitud_id 
from Segmento s 
join LineaMovimiento lm on lm.segmento_id = s.id 
join Concepto c on lm.concepto_id = c.id 
where s.certificacionPorEmpresa_id = 165547
order by s.desde, id desc;


select s.id, c.descripcion, s.desde , s.hasta , s.sueldoNominal, s.sueldoLiquido, s.montoPago, s.calculoBps, s.solicitud_id, s.generadoPorSolicitud_id,  spe.*
from Segmento s 
join LineaMovimiento lm on lm.segmento_id = s.id 
join Concepto c on lm.concepto_id = c.id
left join SimulacionPorEmpresa spe on s.simulacion_id = spe.id 
where s.certificacionPorEmpresa_id = 165601
order by s.desde, s.id;


select sum(s.calculoBps) as calculoBPS, sum(s.montoPago) as montoPago 
from Segmento s
where s.certificacionPorEmpresa_id = 165425
and s.id != 407848
order by id desc; -- 14134

select sum(s.calculoBps) as calculoBPS, sum(s.montoPago) as montoPago, sum(s.sueldoLiquido) as sueldoLiquido 
from Segmento s
where s.certificacionPorEmpresa_id = 165601
and s.id != 407848
order by id desc;

select sum(s.calculoBps) as calculoBPS, sum(s.montoPago) as montoPago 
from Segmento s
where s.certificacionPorEmpresa_id = 165425
order by id desc; -- 9571


-- 18.697 calculobps (seg alta) - total acumulado => se asigna al calculoBps del segmento negativo

-- antes de ingresar la operacion calculoBPS 21949 - montoPago 10211 
-- luego de ingresar la operacion calculoBPS 14134 - montoPago 17312 (antes del ultimo segmento que genera el problema)
-- el segmento que genera el probema calculoBPS -4563 (deberia ser cero)

select * from Pais where nombrePais = 'Uruguay';



