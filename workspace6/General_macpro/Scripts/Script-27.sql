SELECT DISTINCT u.userid, a.nombre AS app, m.nombre AS modulo, f.nombre AS funcionalidad
FROM Usuario u
  JOIN Usuario_Rol ur ON ur.Usuario_id = u.id
  JOIN Rol r ON r.id = ur.roles_id
  JOIN Modulo_Funcionalidad_RolAut mfr ON mfr.rolesAutorizados_id = r.id
  JOIN Modulo m ON m.id = mfr.modulo_id
  JOIN Funcionalidad f ON f.id = mfr.funcionalidad_id
  JOIN Aplicacion a ON a.id = m.aplicacion_id
WHERE u.userId = 'medico' or u.userId = 'rrhh' 
  AND a.nombre IN ('RRHHAsesp', 'appRRHHAsesp')
ORDER BY a.nombre, m.nombre, f.nombre;
