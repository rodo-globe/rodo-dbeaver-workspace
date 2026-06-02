# Sets 

#139 usuarios
select count(DISTINCT (a.id)) fechas_inconsistentes_todos_los_usuarios
FROM
    Afiliado AS a
INNER JOIN
    EmpresaAfiliado AS x ON a.id = x.Afiliado_id
WHERE
x.fechaIngreso > x.fechaEgreso and x.migrado = 1 and a.activo = 0
;


select a.*, x.*
FROM
    Afiliado AS a
INNER JOIN
    EmpresaAfiliado AS x ON a.id = x.Afiliado_id
WHERE
x.fechaIngreso > x.fechaEgreso and x.migrado = 1 and a.activo = 0
;


-- Actualizar: igualar fechaIngreso a fechaEgreso
UPDATE EmpresaAfiliado AS x
INNER JOIN Afiliado AS a ON a.id = x.Afiliado_id
SET x.fechaIngreso = x.fechaEgreso
WHERE x.fechaIngreso > x.fechaEgreso 
  AND x.migrado = 1 
  AND a.activo = 0;


#8 usuarios
select count(DISTINCT (a.id)) fechas_inconsistentes_usuarios_activos
FROM
    Afiliado AS a
INNER JOIN
    EmpresaAfiliado AS x ON a.id = x.Afiliado_id
WHERE
x.fechaIngreso > x.fechaEgreso
and a.activo = 1 and a.migrado = 1
;

-- procesado 29/10/2025
select a.*, x.*
FROM
    Afiliado AS a
INNER JOIN
    EmpresaAfiliado AS x ON a.id = x.Afiliado_id
WHERE
x.fechaIngreso > x.fechaEgreso
and a.activo = 1 and a.migrado = 1
order by a.id asc
;

select * from EmpresaAfiliado ea where ea.fechaIngreso > ea.fechaEgreso; 


#1396 usuarios
select count(DISTINCT (a.id)) fechas_inconsistentes_todos_los_usuarios
FROM
    Afiliado AS a
INNER JOIN
    EmpresaAfiliado AS x ON a.id = x.Afiliado_id
WHERE
ISNULL(x.fechaIngreso) and not ISNULL(x.fechaEgreso) and x.migrado = 1 and a.activo = 0
;

select a.*, x.*
FROM
    Afiliado AS a
INNER JOIN
    EmpresaAfiliado AS x ON a.id = x.Afiliado_id
WHERE
ISNULL(x.fechaIngreso) and not ISNULL(x.fechaEgreso) and x.migrado = 1 and a.activo = 0
;

-- Actualizar: igualar fechaIngreso a fechaEgreso cuando fechaIngreso es NULL
UPDATE EmpresaAfiliado AS x
INNER JOIN Afiliado AS a ON a.id = x.Afiliado_id
SET x.fechaIngreso = x.fechaEgreso
WHERE x.fechaIngreso IS NULL 
  AND x.fechaEgreso IS NOT NULL 
  AND x.migrado = 1 
  AND a.activo = 0;


#10 usuarios
select count(DISTINCT (a.id)) fechas_inconsistentes_usuarios_activos
FROM
    Afiliado AS a
INNER JOIN
    EmpresaAfiliado AS x ON a.id = x.Afiliado_id
WHERE
ISNULL(x.fechaIngreso) and not ISNULL(x.fechaEgreso)
and a.activo = 1 and x.migrado = 1
;

select a.*, x.* 
FROM
    Afiliado AS a
INNER JOIN
    EmpresaAfiliado AS x ON a.id = x.Afiliado_id
WHERE
ISNULL(x.fechaIngreso) and not ISNULL(x.fechaEgreso)
and a.activo = 1 and x.migrado = 1
;

select * from EmpresaAfiliado ea where ea.afiliado_id in (10747, 20754);

-- procesado 29/10/2025
select a.*, x.*
FROM
    Afiliado AS a
INNER JOIN
    EmpresaAfiliado AS x ON a.id = x.Afiliado_id
WHERE
ISNULL(x.fechaIngreso) and not ISNULL(x.fechaEgreso)
and a.activo = 1 and x.migrado = 1
;

-- afiliados que esten activos pero que hayan egresado de todas las empresas.


SELECT a.*, x.*
FROM Afiliado AS a
INNER JOIN EmpresaAfiliado AS x ON a.id = x.Afiliado_id
WHERE a.activo = 1
  AND NOT EXISTS (
    SELECT 1 
    FROM EmpresaAfiliado AS x2 
    WHERE x2.Afiliado_id = a.id 
      AND ISNULL(x2.fechaEgreso)
  );

 
Select * from EmpresaAfiliado ea where ea.afiliado_id in (18303,34374); 


select * from Afiliado a where a.numeroDocumento = "16647711" ; -- 6204

select * from EmpresaAfiliado ea where ea.afiliado_id = 6204;