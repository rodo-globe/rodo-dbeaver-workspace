# Consultas de recaudadores del correo de Juan
-- Cantidad de cuotas/deudas con saldo recaudadas por Redes de Cobranza
select
	count(*)
from
	participmevpart.cuotas c
join participmevpart.local l on
	l.depto = c.cu_deppaga
	and l.nroloc = c.cu_locpaga
where
	l.loc_codrec > 9000
	and c.cu_saldo > 0;

-- Cantidad de cuotas / deudas con saldo recaudadadas por recaudadores manuales
select
	count(*)
from
	participmevpart.cuotas c
join participmevpart.local l on
	l.depto = c.cu_deppaga
	and l.nroloc = c.cu_locpaga
where
	l.loc_codrec < 9000
	and c.cu_saldo > 0;

-- Cantidad de cuotas / deudas con saldo (Este es el universo de deudas a migrar, habría que sumarle que no hayan sido migradas anteriormente)
select
	count(*)
from
	participmevpart.cuotas c
where
	c.cu_saldo > 0;

# ------- Fin de consultas de recaudadores ---------------
select
	count(distinct(c.id))
from
	participmevpart.particip p
join participmevpart.cuotas c on
	c.cu_depto = p.pa_depto
	and c.cu_nroloc = p.pa_nroloc
	and p.pa_nropart = c.cu_nropart;

-- Obtener cuotas migradas
select
	count(distinct (c.id))
	-- d.*
from
	participmevpart.particip p
join participmevpart.cuotas c on
	c.cu_depto = p.pa_depto
	and c.cu_nroloc = p.pa_nroloc
	and p.pa_nropart = c.cu_nropart
join sim.fseviviendanucleada fse on
	-- Tiene ficha en el SIM bajo el mismo número de participante e id de programa calculado (nro localidad y depto)
	fse.programa_id = p.idPrograma
	and fse.numeroParticipante = p.pa_nropart
join sim.programa pr on
	pr.id = p.idPrograma
join sim.contrato cont on
	cont.fichaViviendaNucleada_id = fse.id
join sim.objeto obj on
	obj.contrato_id = cont.id
join sim.deuda d on
	-- Tiene registros de deudas en el SIM bajo la ficha
	d.objeto_id = obj.id;

select count(*) from sim.deuda d where not isnull(mevpartSecondaryId) ;

-- Cuotas no migradas
select
	count(distinct(c.id))
	-- c.*
from
	participmevpart.particip p
join participmevpart.cuotas c on
	c.cu_depto = p.pa_depto
	and c.cu_nroloc = p.pa_nroloc
	and p.pa_nropart = c.cu_nropart
left join sim.fseviviendanucleada fse on
	fse.programa_id = p.idPrograma
	and fse.numeroParticipante = p.pa_nropart
left join sim.programa pr on
	pr.id = p.idPrograma
left join sim.contrato cont on
	cont.fichaViviendaNucleada_id = fse.id
left join sim.objeto obj on
	obj.contrato_id = cont.id
left join sim.deuda d on
	d.objeto_id = obj.id
where d.id is null or fse.id is null; -- Si un participante no tiene ninguna deuda en el SIM, queda pendiente por migrar

#Consultas con las deudas que cumplen con las condiciones y que pueden ser migradas
	
-- 1) Condiciones proceso GenerarLegadoPrograma
-- No tiene condiciones relevantes
	
-- 2) Condiciones proceso GenerarTablaPersona
select
	c.*
from
	participmevpart.particip p
join participmevpart.cuotas c on
	c.cu_depto = p.pa_depto
	and c.cu_nroloc = p.pa_nroloc
	and p.pa_nropart = c.cu_nropart
join participmevpart.local l on -- Join con localidades para condicion de recaudadores
	l.depto = c.cu_deppaga
	and l.nroloc = c.cu_locpaga
left join sim.programa pr on
	pr.id = p.idPrograma
left join sim.fseviviendanucleada fse on
	fse.programa_id = p.idPrograma
	and fse.numeroParticipante = p.pa_nropart
left join sim.contrato cont on
	cont.fichaViviendaNucleada_id = fse.id
left join sim.objeto obj on
	obj.contrato_id = cont.id
left join sim.deuda d on
	d.objeto_id = obj.id
where
	d.id is null -- Deudas no migradas
	and l.loc_codrec > 9000 -- La cuota se paga en la localidad con redes de cobranza
	and p.rubro in (1, 2, 9) -- Método obtenerConsultaParticipantes()
	and not exists ( -- Método obtenerConsultaParticipantes()
	select
		pi.id
	from
		participmevpart.particip pi
	where
		pi.pa_ci = p.pa_ci
		and pi.idPrograma = p.idPrograma
		and p.rubro = 2
		and pi.rubro in (1, 9)
		);

-- 3) Condiciones proceso GenerarFicha
select
	c.*
from
	participmevpart.particip p
join participmevpart.cuotas c on
	c.cu_depto = p.pa_depto
	and c.cu_nroloc = p.pa_nroloc
	and p.pa_nropart = c.cu_nropart
join participmevpart.local l on -- Join con localidades para condicion de recaudadores
	l.depto = c.cu_deppaga
	and l.nroloc = c.cu_locpaga
left join sim.programa pr on
	pr.id = p.idPrograma
left join sim.fseviviendanucleada fse on
	fse.programa_id = p.idPrograma
	and fse.numeroParticipante = p.pa_nropart
left join sim.contrato cont on
	cont.fichaViviendaNucleada_id = fse.id
left join sim.objeto obj on
	obj.contrato_id = cont.id
left join sim.deuda d on
	d.objeto_id = obj.id
where
	d.id is null -- Deudas no migradas
	and l.loc_codrec > 9000 -- La cuota se paga en la localidad con redes de cobranza
	and p.rubro in (1, 2) -- Método createConnections, línea 122. Se omite de la condición el rubro 9 porque en la línea 151 del método crearFichas se usan solo 1 y 2
	and p.pa_porsub is not null -- Método validarFicha de la clase GenerarFicha, línea 323. Método crearDeudas de la clase GenerarDeudasMigracion, línea 168: Solo se crean deudas que tienen subsidios en la ficha, por esto lo considero relevante
	and exists ( -- Método cargarLineaEscalaSubsidios, linea 81. Método generarFichaSim, línea 439. Para que una ficha tenga subsidio, debe tener un registro bajo el rubro y el porcentaje de subsidio del participante
	select
		l.id
	from
		sim.lineaescalasubsidios l
	where
		l.escala_id = rubro
		and l.porcentajeSubsidio = p.pa_porsub);


# 4) Condiciones sobre GenerarPersonaSim
-- No tiene condiciones relevantes

# 5) Condiciones sobre GenerarDeudasMigracion
select
	c.*
from
	participmevpart.particip p
join participmevpart.cuotas c on
	c.cu_depto = p.pa_depto
	and c.cu_nroloc = p.pa_nroloc
	and p.pa_nropart = c.cu_nropart
join participmevpart.local l on -- Join con localidades para condicion de recaudadores
	l.depto = c.cu_deppaga
	and l.nroloc = c.cu_locpaga
left join sim.programa pr on
	pr.id = p.idPrograma
left join sim.fseviviendanucleada fse on
	fse.programa_id = p.idPrograma
	and fse.numeroParticipante = p.pa_nropart
left join sim.contrato cont on
	cont.fichaViviendaNucleada_id = fse.id
left join sim.objeto obj on
	obj.contrato_id = cont.id
left join sim.deuda d on
	d.objeto_id = obj.id
where
	d.id is null -- Deudas no migradas
	and l.loc_codrec > 9000 -- La cuota se paga en la localidad con redes de cobranza
	and p.rubro in (1, 2) -- Método obtenerConsultaParticipantes, línea 622
	and not exists ( -- Método obtenerConsultaParticipantes, línea 624
	select
		pa.id
	from
		participmevpart.particip pa
	join participmevpart.cuotas cu_pa on
		cu_pa.cu_depto = pa.pa_depto
		and cu_pa.cu_nroloc = pa.pa_nroloc
		and cu_pa.cu_nropart = pa.pa_nropart
		and cu_pa.cu_rubro = pa.rubro
		and (cu_pa.cu_saldo + cu_pa.cu_debitos - cu_pa.cu_credito) > 0
	where
		p.pa_ci = pa.pa_ci
		and p.rubro = 1)
	and not exists ( -- Método obtenerConsultaParticipantes, línea 630
	select
		pa.id
	from
		participmevpart.particip pa
	join participmevpart.cuotas cu_pa on
		cu_pa.cu_depto = pa.pa_depto
		and cu_pa.cu_nroloc = pa.pa_nroloc
		and cu_pa.cu_nropart = pa.pa_nropart
		and cu_pa.cu_rubro = pa.rubro
		and (cu_pa.cu_saldo + cu_pa.cu_debitos - cu_pa.cu_credito) > 0
	where
		p.pa_ci = pa.pa_ci
		and p.rubro = 9
	)
	and 1 = ( -- Método crearDeudas, línea 147 y 149. Se tiene el método obtenerDeudas el cual obtiene las cuotas del participante ya sea del rubro 1 o 2. Debe ser una sola cuota (línea 149) con saldo (línea 644)
	select
		count(c2.id)
	from
		participmevpart.particip p2
	join participmevpart.cuotas c2 on
		c2.cu_depto = p2.pa_depto
		and c2.cu_nroloc = p2.pa_nroloc
		and c2.cu_nropart = p2.pa_nropart
		and (c2.cu_rubro = p2.rubro OR c2.cu_rubro = 2)
	where
		p2.pa_ci = p.pa_ci
		and (c2.cu_saldo + c2.cu_debitos - c2.cu_credito) > 0)

-- Programas usados por participantes con deudas sin migrar y que todas las deudas se pagan con redes de cobranza
select
	distinct(pr.id), pr.*
from
	participmevpart.particip p
join participmevpart.cuotas c on
	c.cu_depto = p.pa_depto
	and c.cu_nroloc = p.pa_nroloc
	and p.pa_nropart = c.cu_nropart
join participmevpart.local l on
	-- Join con localidades para condicion de recaudadores
	l.depto = c.cu_deppaga
	and l.nroloc = c.cu_locpaga
join sim.programa pr on
	pr.id = p.idPrograma
left join sim.fseviviendanucleada fse on
	fse.programa_id = p.idPrograma
	and fse.numeroParticipante = p.pa_nropart
left join sim.contrato cont on
	cont.fichaViviendaNucleada_id = fse.id
left join sim.objeto obj on
	obj.contrato_id = cont.id
left join sim.deuda d on
	d.objeto_id = obj.id
where
	d.id is null -- Deudas no migradas
	and not exists (
      select 1
      from participmevpart.cuotas c2
      join participmevpart.local l2
        on l2.depto = c2.cu_deppaga
       and l2.nroloc = c2.cu_locpaga
      where c2.cu_depto = p.pa_depto
        and c2.cu_nroloc = p.pa_nroloc
        and c2.cu_nropart = p.pa_nropart
        and l2.loc_codrec < 9000 -- No puede existir ningun registro que cobre por recaudadores manuales
  );
	
	
 -- RODO
 -- participantes con problemas de datos en personas pero con saldo > 0 no migrado
 select * from participmevpart.particip p 
 join cuotas c on 
 where isnull (p.pa_nombre) or trim(p.pa_nombre) = "" or isnull(p.pa_ci) or trim(p.pa_ci) = "" or trim(pa_ci) = "0-0";



 select count(*) from participmevpart.particip p 
 where isnull (p.pa_nombre) or trim(p.pa_nombre) = "" or isnull(p.pa_ci) or trim(p.pa_ci) = "" or trim(pa_ci) = "0-0";
 
select count(*) from participmevpart.particip p; 

select count(*) from participmevpart.particip p where isnull(p.idPrograma) or trim(p.idPrograma) = "" ;

select * from participmevpart.particip p where isnull(p.idPrograma) or trim(p.idPrograma) = ""

select * from participmevpart.particip p where p.migrado != 0; 
 

-- TODO 
-- cuantas personas del lado del mevpart existen con datos buenos en mevpart y fueron migrados a sim (buscar por ci)
-- en esas personas buscar discrepancias de datos, porque pueden haber sido actualizados de ambos lados
-- controlar como estamos con los programas, enganche entre dos sistemas

-- separacion en contratos distintos con deudas principales
-- intentar migrar todas las personas
-- ver como se inventa el subsidio en el rubro 1
-- migrar contratos 1 a 1
-- un participante no podria ser migrado si tiene deudas en otro programa que sea con recaudador manual




