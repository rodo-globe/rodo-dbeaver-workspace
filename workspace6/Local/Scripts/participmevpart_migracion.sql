### participmevpart_migracion ambiente migracion

select * from participmevpart_migracion.cuotas c 
inner join participmevpart_migracion.particip p 
on p.pa_nropart = c.cu_nropart 
where p.pa_ci = "2909791-9";

select distinct p.numeroParticipante from participmevpart_migracion.particip p;

select distinct p.numeroParticipante, count(*) 
from participmevpart_migracion.particip p
group by p.numeroParticipante ;


select distinct p.numeroParticipante,p.pa_depto, p.pa_nroloc, p.rubro, count(*) 
from participmevpart_migracion.particip p
group by p.numeroParticipante, p.pa_depto, p.pa_nroloc, p.rubro  
having count(*) > 1;

select p.numeroParticipante,p.pa_depto, p.pa_nroloc, p.rubro, p.idPrograma, p.pa_serie, c.* 
from participmevpart_migracion.particip p
join cuotas c on p.pa_depto = c.cu_depto and p.pa_nroloc = c.cu_nroloc and p.pa_nropart = c.cu_nropart 
where p.pa_ci = "2909791-9";
  
select c.* 
from participmevpart_migracion.particip p
join cuotas c on p.pa_depto = c.cu_depto and p.pa_nroloc = c.cu_nroloc and p.pa_nropart = c.cu_nropart 
where p.pa_ci = "2909791-9";

select c.* 
from participmevpart_migracion.particip p
join cuotas c on p.pa_depto = c.cu_depto and p.pa_nroloc = c.cu_nroloc and p.pa_nropart = c.cu_nropart 
where c.cu_saldo = 1127;

