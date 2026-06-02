select * from ParametroMails pm ;


SELECT 
`Afiliado`.`numeroDocumento`, 
`Afiliado`.`activo`, 
SUM( `Certificacion`.`diasReales` ), 
`EmpresaAfiliado`.`empresa_id`, 
`EmpresaAfiliado`.`fechaIngreso`, 
`EmpresaAfiliado`.`activo`, 
`EmpresaAfiliado`.`fechaEgreso` 
FROM `sets`.`Certificacion` AS `Certificacion`, 
`sets`.`Afiliado` AS `Afiliado`, 
`sets`.`EmpresaAfiliado` AS `EmpresaAfiliado` 
WHERE `Certificacion`.`afiliado_id` = `Afiliado`.`id` AND 
`EmpresaAfiliado`.`afiliado_id` = `Afiliado`.`id` AND 
`Afiliado`.`activo` = 1 AND 
`EmpresaAfiliado`.`activo` = 1 AND 
`EmpresaAfiliado`.`fechaEgreso` 
IS NULL GROUP BY `Afiliado`.`numeroDocumento`;

select * from Certificacion c ;


-- cuantos afiliados activos suman mas de 1500 dias con al menos una empresa activa 
SELECT 
    COUNT(*) AS totalCertificaciones,
    COUNT(DISTINCT c.afiliado_id) AS totalAfiliados
FROM sets.Certificacion c
WHERE c.afiliado_id IN (
    SELECT a.id
    FROM sets.Afiliado a
    JOIN sets.Certificacion c2 ON c2.afiliado_id = a.id
    WHERE a.activo = 1
      AND EXISTS (
          SELECT 1 FROM sets.EmpresaAfiliado ea
          WHERE ea.afiliado_id = a.id
            AND ea.activo = 1
            AND ea.fechaEgreso IS NULL
      )
    GROUP BY a.id
    HAVING SUM(c2.diasReales) > 1500
);

-- certififaciones de afiliados que suman mas de 1500 dias
SELECT c.id, c.desde, c.hasta, c.diasReales, c.afiliado_id
FROM sets.Certificacion c
WHERE c.afiliado_id IN (
    SELECT a.id
    FROM sets.Afiliado a
    JOIN sets.Certificacion c2 ON c2.afiliado_id = a.id
    WHERE a.activo = 1
      AND EXISTS (
          SELECT 1 FROM sets.EmpresaAfiliado ea
          WHERE ea.afiliado_id = a.id
            AND ea.activo = 1
            AND ea.fechaEgreso IS NULL
      )
    GROUP BY a.id
    HAVING SUM(c2.diasReales) > 1500
)
ORDER BY c.afiliado_id, c.desde;


-- listado de los afiliados que suman mas de 1500 dias
SELECT a.id, a.numeroDocumento, SUM(c.diasReales) AS totalDias, COUNT(c.id) AS cantCertificaciones
FROM sets.Afiliado a
JOIN sets.Certificacion c ON c.afiliado_id = a.id
WHERE a.activo = 1
  AND EXISTS (
      SELECT 1 FROM sets.EmpresaAfiliado ea
      WHERE ea.afiliado_id = a.id
        AND ea.activo = 1
        AND ea.fechaEgreso IS NULL
  )
GROUP BY a.id, a.numeroDocumento
HAVING SUM(c.diasReales) > 1500
ORDER BY totalDias DESC;


select * from DeclaracionJurada dj order by id desc ;
select * from CierreLiquidacion cl order by id desc;
select * from Recibos r ;


select * from CierreLiquidacion cl where cl.anioMes = "2025-11-01";
select * from Recibos r ;


SELECT @@SESSION.sql_mode;



----------------------
-- fix recibos
----------------------

select * from DeclaracionJurada dj 
where dj.id in(2296,2261);

select * from Recibos 
where declaracionJurada_id = '2296'
and anioMes IN ('2025-11-01')
and afiliado_id IS NOT NULL;

select count(*) from Recibos 
where declaracionJurada_id = '2296' and
anioMes IN ('2025-11-01') and 
afiliado_id IS NOT NULL;

-- update que corrige puntero en recibos
update Recibos set declaracionJurada_id = 2261 WHERE
declaracionJurada_id = '2296' and
anioMes IN ('2025-11-01') and 
afiliado_id IS NOT NULL;

select count(*) from Recibos 
where declaracionJurada_id = '2261' and
anioMes IN ('2025-11-01') and 
afiliado_id IS NOT NULL;

select * from LineaMovimiento 
where declaracionJurada_id = '2296'
and concepto_id = '30'
and fechaValor IN ('2025-11-30')
and afiliado_id IS NOT NULL;

-- update que corrige la referencia a la DJ en los movimientos
update LineaMovimiento set declaracionJurada_id = '2261'
where declaracionJurada_id = '2296'
and concepto_id = '30'
and fechaValor IN ('2025-11-30')
and afiliado_id IS NOT NULL;"
