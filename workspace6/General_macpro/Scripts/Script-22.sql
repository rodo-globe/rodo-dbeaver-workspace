CREATE TEMPORARY TABLE ids_duplicados_a_eliminar AS
SELECT u.id
FROM Usuario u
INNER JOIN (
    SELECT userId,
           IFNULL(MAX(CASE WHEN estado = 0 THEN id END), MAX(id)) AS keep_id
    FROM Usuario
    GROUP BY userId
    HAVING COUNT(*) > 1
) dup ON u.userId = dup.userId AND u.id <> dup.keep_id;

-- 2. Verificar qué se va a eliminar
SELECT u.id, u.userId, u.estado FROM Usuario u
INNER JOIN ids_duplicados_a_eliminar d ON u.id = d.id;

-- 3. Limpiar tablas relacionadas
DELETE FROM Usuario_Aplicacion WHERE Usuario_id IN (SELECT id FROM ids_duplicados_a_eliminar);
DELETE FROM Usuario_Rol WHERE Usuario_id IN (SELECT id FROM ids_duplicados_a_eliminar);
DELETE FROM Usuario_GrupoRolesAutoregistro WHERE Usuario_id IN (SELECT id FROM ids_duplicados_a_eliminar);
DELETE FROM Usuario_InstanciaCampoAutoregistro WHERE Usuario_id IN (SELECT id FROM ids_duplicados_a_eliminar);
DELETE FROM Sesion WHERE usuario_id IN (SELECT id FROM ids_duplicados_a_eliminar);
DELETE FROM InstanceApp WHERE usuario_id IN (SELECT id FROM ids_duplicados_a_eliminar);
DELETE FROM Solicitud_Activacion WHERE usuario_id IN (SELECT id FROM ids_duplicados_a_eliminar);
DELETE FROM SolicitudReseteo WHERE usuario_id IN (SELECT id FROM ids_duplicados_a_eliminar);
DELETE FROM RegistroTrafico WHERE usuario_id IN (SELECT id FROM ids_duplicados_a_eliminar);
UPDATE Usuario SET supervisor_id = NULL WHERE supervisor_id IN (SELECT id FROM ids_duplicados_a_eliminar);

-- 4. Eliminar los duplicados
DELETE FROM Usuario WHERE id IN (SELECT id FROM ids_duplicados_a_eliminar);

DROP TEMPORARY TABLE ids_duplicados_a_eliminar;

-- 5. Verificar que no queden duplicados
SELECT userId, COUNT(*) FROM Usuario GROUP BY userId HAVING COUNT(*) > 1;

-- 6. Aplicar constraint si no existe
SET @constraint_exists = (
    SELECT COUNT(*) FROM information_schema.TABLE_CONSTRAINTS
    WHERE CONSTRAINT_SCHEMA = DATABASE() AND TABLE_NAME = 'Usuario' AND CONSTRAINT_NAME = 'UK_usuario_userId'
);
SET @query = IF(@constraint_exists = 0,
    'ALTER TABLE Usuario ADD CONSTRAINT UK_usuario_userId UNIQUE (userId)',
    'SELECT ''Constraint UK_usuario_userId ya existe'' AS info'
);
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;