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