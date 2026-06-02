select * from SolicitudBeneficio sb order by sb.id desc limit 10 ;

select * from SolicitudBeneficio sb where sb.id = 384840;

select * from TipoSolicitud ts ; -- 3 y 4

select sb.id as SolicitudId, dc.fechaDesde as FechaDesdeSolcitud, dc.fechaHasta as FechaHastaSolicitud, 
dc.certificacion_id as CertificacionId,
a.id as AfiliadoId, a.primerNombre as AfiliadoNombre, a.primerApellido as AfiliadoApellido, a.numeroDocumento as ci,
e.razonSocial as RazonSocial
from SolicitudBeneficio sb 
join DatosCertificacion dc on sb.datosCertificacion_id = dc.id 
join Afiliado a on a.id = sb.afiliado_id
join EmpresaAfiliado ea on ea.afiliado_id = a.id 
join Empresa e on e.id = ea.empresa_id 
where 
sb.resolucion = 0 and 
sb.tipoSolicitud_id in(3,4) AND
dc.fechaHasta >= '2025-01-01'
and isnull(ea.fechaEgreso) ;


select count(*)
from SolicitudBeneficio sb 
join DatosCertificacion dc on sb.datosCertificacion_id = dc.id 
join Afiliado a on a.id = sb.afiliado_id
join EmpresaAfiliado ea on ea.afiliado_id = a.id 
join Empresa e on e.id = ea.empresa_id 
where 
sb.resolucion = 0 and 
sb.tipoSolicitud_id in(3,4) AND
dc.fechaHasta >= '2025-01-01'
and (isnull(ea.fechaEgreso) or ea.fechaEgreso >= '2025-01-01' ); 




select ea.id
from EmpresaAfiliado ea
where id in (select 
a.id as AfiliadoId
from SolicitudBeneficio sb 
join DatosCertificacion dc on sb.datosCertificacion_id = dc.id 
join Afiliado a on a.id = sb.afiliado_id
join EmpresaAfiliado ea on ea.afiliado_id = a.id 
join Empresa e on e.id = ea.empresa_id 
where 
sb.resolucion = 0 and 
sb.tipoSolicitud_id in(3,4) AND
dc.fechaHasta >= '2025-01-01'
and isnull(ea.fechaEgreso))
group by ea.id 
having count(*) > 1;





select * from EmpresaAfiliado ea limit 1;


select count(*) from SolicitudBeneficio sb ;
join DatosCertificacion dc
on sb.datosCertificacion_id = dc.id 
where 
sb.resolucion = 0 and 
sb.tipoSolicitud_id in(3,4) AND
dc.fechaHasta >= '2025-01-01';


select * from Afiliado a 
join EmpresaAfiliado ea on ea.afiliado_id = a.id 
where 
a.activo = TRUE 
and ea.activo = TRUE;

select * from Afiliado a 
join EmpresaAfiliado ea on ea.afiliado_id = a.id 
where a.id in (10747,20754,8930);
 

select * from Empresa e where e.activo = true;
select count(*) from Empresa e where e.activo = true;

select * from AjusteSueldo as2 where anioMes = "2025-07-01" ;


select * from Empresa e where not exists (
select * from AjusteSueldo as2 
join AjusteSueldo_Empresa ase on as2.id = ase.AjusteSueldo_id 
where as2.anioMes = "2025-07-01" and ase.empresas_id = e.id
) and e.activo = true;


select * from Sueldo s;
select * from Sueldo s where s.anioMes >= "2025-07-01" and sueldoNominal < sueldoNominalAjustado ; -- reversos de ajustes no ingresados
select count(*) from Sueldo s where s.anioMes >= "2025-07-01" and sueldoNominal > sueldoNominalAjustado ; -- reversos de ajustes no ingresados (result 600)

-- reversos aplicados sobre ajustes inexistentes agrupados por empresa
select count(*), e.id, e.razonSocial 
from Sueldo s 
join EmpresaAfiliado ea on s.empresaAfiliado_id = ea.id
join Empresa e ON ea.empresa_id = e.id
where s.anioMes >= "2025-07-01" and sueldoNominal > sueldoNominalAjustado
and ea.activo = true
and e.activo = true
group by e.id ;

-- afiliados con certificaciones afectas por reverso mal aplicado
select count(*), e.id, e.razonSocial
from EmpresaAfiliado ea 
join Sueldo s on ea.id = s.empresaAfiliado_id 
join Empresa e ON ea.empresa_id = e.id
join Certificacion c on c.afiliado_id = ea.afiliado_id 
join CertificacionPorEmpresa cpe on cpe.certificacion_id = c.id 
join Segmento s2 on s2.certificacionPorEmpresa_id = cpe.id
where s.anioMes >= "2025-07-01" and s.sueldoNominal > s.sueldoNominalAjustado
and ea.activo = true
and e.activo = true
and s2.desde >= "2025-07-01"
group by e.id;

select * from Sueldo s where s.anioMes >= "2025-07-01" and s.anioMes < "2025-11-01"
and sueldoNominal = sueldoNominalAjustado and sueldoNominal != 0 ; -- reversos de ajustes no ingresados


-- Ajustes de sueldo que no ajustaron nada (848)
select count(*) from Sueldo s 
join EmpresaAfiliado ea on s.empresaAfiliado_id = ea.id
join Empresa e ON ea.empresa_id = e.id
where s.anioMes >= "2025-07-01" and s.anioMes < "2025-11-01"
and sueldoNominal = sueldoNominalAjustado and sueldoNominal != 0 
; 

-- Ajustes de sueldo que no ajustaron nada por empresa
select count(*), e.id, e.razonSocial from Sueldo s 
join EmpresaAfiliado ea on s.empresaAfiliado_id = ea.id
join Empresa e ON ea.empresa_id = e.id
where s.anioMes >= "2025-07-01" and s.anioMes < "2025-11-01"
and sueldoNominal = sueldoNominalAjustado and sueldoNominal != 0 
group by e.id; 

select e.id, e.razonSocial from Sueldo s 
join EmpresaAfiliado ea on s.empresaAfiliado_id = ea.id
join Empresa e ON ea.empresa_id = e.id
where s.anioMes >= "2025-07-01" and s.anioMes < "2025-11-01"
and sueldoNominal = sueldoNominalAjustado and sueldoNominal != 0 
group by e.id; 

-- Personas (499)
select count(distinct e.id, e.razonSocial, a.numeroDocumento, a.id) from Sueldo s 
join EmpresaAfiliado ea on s.empresaAfiliado_id = ea.id
join Empresa e ON ea.empresa_id = e.id
join Afiliado a ON ea.afiliado_id = a.id
where s.anioMes >= "2025-07-01" and s.anioMes < "2025-11-01"
and sueldoNominal = sueldoNominalAjustado and sueldoNominal != 0 ;

select distinct e.id, e.razonSocial, a.numeroDocumento, a.id from Sueldo s 
join EmpresaAfiliado ea on s.empresaAfiliado_id = ea.id
join Empresa e ON ea.empresa_id = e.id
join Afiliado a ON ea.afiliado_id = a.id
where s.anioMes >= "2025-07-01" and s.anioMes < "2025-11-01"
and sueldoNominal = sueldoNominalAjustado and sueldoNominal != 0 ; 


select count(*) from EmpresaAfiliado ea where ea.activo = 1 and ea.empresa_id = 709;



-- update prod

update LineaMovimiento set declaracionJurada_id = '2261'
where declaracionJurada_id = '2296'
and concepto_id = '30'
and fechaValor IN ('2025-11-30')
and afiliado_id IS NOT NULL;


select * from Recibos 
where declaracionJurada_id = '2296'
and anioMes IN ('2025-11-01')
and afiliado_id IS NOT NULL;

update Recibos set declaracionJurada_id = 2261
where declaracionJurada_id = '2296'
and anioMes IN ('2025-11-01')
and afiliado_id IS NOT NULL;





























