SELECT * FROM DeclaracionJurada dj where dj.id = 2261;


SELECT * FROM DeclaracionJurada_AUD dja where dja.id = 2261;

select * from AuditRevision ar ;



SELECT FROM_UNIXTIME(ar.timestamp/ 1000) as timestamp,  ar.*, dja.*    
FROM DeclaracionJurada_AUD dja 
join AuditRevision ar on ar.id = dja.rev
where dja.id = 2261
order by ar.timestamp ; -- DJ noviembre, aprobada el 10/02

SELECT FROM_UNIXTIME(ar.timestamp/ 1000) as timestamp,  ar.*, dja.*    
FROM DeclaracionJurada_AUD dja 
join AuditRevision ar on ar.id = dja.rev
where dja.id = 2296
order by ar.timestamp ; -- DJ diciembre, el 09/02


SELECT FROM_UNIXTIME(ar.timestamp/ 1000) as timestamp,  ar.*, dja.estado, dja.subsidiosPorEnfermedad, dja.subsidiosPorEnfermedadMesesAnteriores    
FROM DeclaracionJurada_AUD dja 
join AuditRevision ar on ar.id = dja.rev
where dja.id = 2261
order by ar.timestamp ;

select * from Recibos r where r.id = 222577;

select * from Recibos_AUD ra;
select * from Recibos_AUD ra where ra.id = 222577;


select * from AjusteSueldo aj where aj.id = 199;
select * from AjusteSueldo_Empresa ase where ase.AjusteSueldo_id = 199;
select * from LineaAjusteSueldo where ajusteSueldo_id = 199;
select * from SueldoAjustado sa where sa.lineaAjusteSueldo_id = 217



