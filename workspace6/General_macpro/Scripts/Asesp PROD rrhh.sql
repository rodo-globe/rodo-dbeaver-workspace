select * from Notificacion n ;

select * from NotificacionUsuario nu ;
select * from NotificacionMasiva nm ;
select * from NotificacionMasivaDetalle nmd ;
select * from Noticia ;

SET FOREIGN_KEY_CHECKS = 1;
truncate table notificacion_segmentos ;
truncate table noticia_segmentos ;
truncate table NotificacionUsuario ;

truncate table NotificacionMasiva;
truncate table NotificacionMasivaDetalle ;
truncate table Notificacion;
truncate table Noticia ;

SELECT id, creado, fechaInicioLicencia, fechaFinLicencia 
FROM Licencia 
WHERE nroCobro = "30155" 
  AND activo = true
  AND nroInstancia <> 14754
  AND estadoTramite NOT IN ('NOA', 'ANU')
  AND (
    STR_TO_DATE("2026-05-13T03:00:00.000Z", "%Y-%m-%d") BETWEEN fechaInicioLicencia AND fechaFinLicencia 
    OR STR_TO_DATE("2026-05-17T03:00:00.000Z", "%Y-%m-%d") BETWEEN fechaInicioLicencia AND fechaFinLicencia
    OR (STR_TO_DATE("2026-05-13T03:00:00.000Z", "%Y-%m-%d") <= fechaInicioLicencia 
        AND STR_TO_DATE("2026-05-17T03:00:00.000Z", "%Y-%m-%d") >= fechaFinLicencia)
  )
  
  SELECT * 
FROM Licencia 
WHERE nroCobro = "30155" 
  AND activo = true
  AND nroInstancia <> 14755
  AND estadoTramite NOT IN ('NOA', 'ANU')
  AND (
    STR_TO_DATE("2026-05-13T03:00:00.000Z", "%Y-%m-%d") BETWEEN fechaInicioLicencia AND fechaFinLicencia 
    OR STR_TO_DATE("2026-05-13T03:00:00.000Z", "%Y-%m-%d") BETWEEN fechaInicioLicencia AND fechaFinLicencia
    OR (STR_TO_DATE("2026-05-13T03:00:00.000Z", "%Y-%m-%d") <= fechaInicioLicencia 
        AND STR_TO_DATE("2026-05-13T03:00:00.000Z", "%Y-%m-%d") >= fechaFinLicencia)
  )
