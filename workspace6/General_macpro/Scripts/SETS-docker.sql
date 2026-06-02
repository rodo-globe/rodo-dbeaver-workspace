
  SELECT mailAliasEmisor, mailEmisor, mailNombreEmisor
  FROM ParametroMails WHERE id = 1;
  
 select * from Sueldo s ;
 select * from SueldoAjustado sa  ;
 

select * from Segmento s;
select * from CertificacionPorEmpresa_Segmento cpes ;


select * from Segmento s;
select * from CertificacionPorEmpresa_Segmento cpes ;

select s.id, s.diasReales, s.diasSets, s.diasAPagar, s.diasADescontarBPS, s.desde, s.hasta, s.montoPago 
from Segmento s
join CertificacionPorEmpresa_Segmento cpes 
on cpes.segmentos_id = s.id 
join CertificacionPorEmpresa cpe on cpe.id = cpes.CertificacionPorEmpresa_id 
where cpe.id = 167606
order by s.desde ;

-- segmentos
select s.id, s.diasReales, s.diasSets, s.diasAPagar, s.diasADescontarBPS, s.desde, 
s.hasta, s.montoPago, c.descripcion 
from Segmento s
join CertificacionPorEmpresa_Segmento cpes 
on cpes.segmentos_id = s.id 
join CertificacionPorEmpresa cpe on cpe.id = cpes.CertificacionPorEmpresa_id 
join Segmento_LineaMovimiento slm on slm.Segmento_id = s.id 
join LineaMovimiento lm on lm.id = slm.lineasMovimiento_id
join Concepto c on c.id = lm.concepto_id 
where cpe.id = 167606
order by s.desde ;

select * from Segmento s order by id desc;
