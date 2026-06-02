SELECT u.nombre AS user, m.nombre AS modulo, f.nombre AS funcionalidad, a.nombre AS aplicacion
FROM Usuario u
  JOIN Usuario_Rol ur ON ur.usuarioId = u.id
  JOIN RolAut r ON r.id = ur.rolId
  JOIN Modulo_RolAut mr ON mr.rolId = r.id
  JOIN Modulo m ON m.id = mr.moduloId
  JOIN Aplicacion a ON a.id = m.aplicacionId
  LEFT JOIN Modulo_Funcionalidad mf ON mf.moduloId = m.id
  LEFT JOIN Funcionalidad f ON f.id = mf.funcionalidadId
WHERE u.nombre = 'medico'
  AND a.nombre IN ('RRHHAsesp', 'appRRHHAsesp')
  AND m.nombre = 'produccion'
ORDER BY a.nombre, f.nombre;