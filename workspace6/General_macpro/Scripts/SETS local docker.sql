

select e.id, e.razonSocial from Empresa e order by id desc; -- empresa 22 id 924, empresa 20 id 923

select * from EmpresaAfiliado ea limit 1;

select a.id, a.numeroDocumento, a.primerNombre, a.primerApellido, a.grupoConsejoSalarios_id, gcs.descripcion, 
a.activo, ea.activo, gcs.activo 
from EmpresaAfiliado ea 
join Afiliado a on ea.afiliado_id = a.id
join GrupoConsejoSalarios gcs on gcs.id = a.grupoConsejoSalarios_id 
where ea.empresa_id = 923;


select * from CertificacionPorEmpresa cpe where cpe.id = 165815;

select * from Afiliado;
update Afiliado set correo = "amelia@globe-software.com";
select * from Empresa e ;
update Empresa set mailGenerico = "amelia@globe-software.com", mailRRHH = "amelia@globe-software.com";



select * from AjusteSueldo as2 where as2.id >= 127;

select * from Empresa e where  e.razonSocial = "NEPHROS LTDA";

select * from Sueldo s   
join EmpresaAfiliado ea on ea.id = s.empresaAfiliado_id  
where ea.empresa_id = 156 order by s.id desc;

select * from Archivo a ;
select * from LineaArchivo l ;

select * from Sueldo;
select * from Sueldo;


select count(*) from SueldoAjustado sa where sa.lineaAjusteSueldo_id in(154,155);

select s.* from SueldoAjustado sa 
join Sueldo s on s.id = sa.sueldo_id 
where sa.lineaAjusteSueldo_id in(154,155);

select count(*) from SueldoAjustado sa 
join Sueldo s on s.id = sa.sueldo_id 
where sa.lineaAjusteSueldo_id in(154,155);

select count(*) from SueldoAjustado sa 
join Sueldo s on s.id = sa.sueldo_id 
where sa.lineaAjusteSueldo_id in(154,155) and
s.sueldoNominal > s.sueldoNominalAjustado ;

select s.* from SueldoAjustado sa 
join Sueldo s on s.id = sa.sueldo_id 
where sa.lineaAjusteSueldo_id in(154,155) and
s.sueldoNominal <= s.sueldoNominalAjustado ;


-- definicion de un ajuste
select * from AjusteSueldo as2 ;
select * from LineaAjusteSueldo las ;


-- sueldo y sus ajustes
select * from Sueldo s ;;
select * from SueldoAjustado;


-- es parte de la simulacion dentro de un segmento
select * from SueldoNominal ;
describe SueldoNominal ;
select * from SueldoNominal_Sueldo sns ;

select * from SueldoNominal_Sueldo sns where sns.sueldos_id in (
249951,
258487,
258591,
260320,
264409);

select * from CertificacionPorEmpresa cpe ;
select * from Segmento s ;

select * from SimulacionPorEmpresa spe ;

select * from AjusteSueldo a order by a.id desc ;

SELECT COUNT(*)
FROM SueldoAjustado sa
JOIN LineaAjusteSueldo las ON sa.lineaAjusteSueldo_id = las.id
WHERE las.ajusteSueldo_id = 155;

SELECT COUNT(*)
FROM SueldoAjustado sa
JOIN LineaAjusteSueldo las ON sa.lineaAjusteSueldo_id = las.id
join Sueldo s on s.id = sa.sueldo_id 
WHERE las.ajusteSueldo_id = 159;

select count(*) from SueldoAjustado where version >= '2025-12-15 22:02:16';


select count(*) from SueldoAjustado where fechaHoraCreacion >= '2025-12-14 20:35:59';

SELECT COUNT(*)
FROM SueldoAjustado_AUD
WHERE fechaHoraCreacion >= '2025-12-14 20:35:59';

select distinct as2.id from SueldoAjustado sa
join LineaAjusteSueldo las on las.id = sa.lineaAjusteSueldo_id  
join AjusteSueldo as2 on as2.id = las.ajusteSueldo_id 
where sa.fechaHoraCreacion >= '2025-12-15 23:06:05';

select * from LineaAjusteSueldo las;

select * from AjusteSueldo as2 order by as2.id DESC ;
select * from AjusteSueldo as2 order by as2.id DESC ;

select * from ParametroMails pm ;
select * from Usuario u where u.userId = "gerencia";

select * from Segmento s order by s.id DESC ; -- 

select * from Segmento s where s.id = 423898 ; -- 

select * from Segmento s 
WHERE s.version >= "2025-12-15 23:06:05"
order by s.id DESC ;

select * from Segmento s
join s
WHERE s.version >= "2025-12-15 23:06:05"
order by s.id DESC ;

SELECT
    las.ajusteSueldo_id AS ajuste_id,
    COUNT(*) AS total_registros,
    COUNT(DISTINCT sa.sueldo_id) AS sueldos_unicos,
    COUNT(*) - COUNT(DISTINCT sa.sueldo_id) AS duplicados
FROM SueldoAjustado sa
JOIN LineaAjusteSueldo las ON sa.lineaAjusteSueldo_id = las.id
JOIN AjusteSueldo a ON las.ajusteSueldo_id = a.id
WHERE a.anioMes = '2025-07-01'
  AND a.estado IN (1, 5)  -- ProcesadoOk o Reversado
GROUP BY las.ajusteSueldo_id
HAVING COUNT(*) - COUNT(DISTINCT sa.sueldo_id) > 0
ORDER BY duplicados DESC;

 SELECT
          s.id,
          s.sueldoNominal,
          s.sueldoNominalAjustado,
          ROUND(s.sueldoNominal * 1.025, 2) as esperado_2_5,
          ROUND(s.sueldoNominal * 1.016, 2) as esperado_1_6
      FROM Sueldo s
      JOIN EmpresaAfiliado ea ON s.empresaAfiliado_id = ea.id
      WHERE ea.empresa_id = 160
      AND s.activo = 1
      AND s.anioMes = '2025-07-01'
      AND s.sueldoNominal > 173481
      ORDER BY s.sueldoNominal
      LIMIT 10;
      
     
select * from Segmento s where id = 424001;


select count(*) from Sueldo s where s.anioMes = "2025-11-01";

select * from Sueldo s 
join EmpresaAfiliado ea on ea.id = s.id 
join Empresa e on e.id = ea.empresa_id 
where s.anioMes = "2025-11-01";

select * from Sueldo s;

SELECT
      e.id AS id_empresa,
      e.razonSocial AS empresa,
      COUNT(*) AS sueldos_nov
  FROM Sueldo s
  JOIN EmpresaAfiliado ea ON s.empresaAfiliado_id = ea.id
  JOIN Empresa e ON ea.empresa_id = e.id
  WHERE s.anioMes = '2025-11-01'
    AND s.activo = 1
  GROUP BY e.id, e.razonSocial
  ORDER BY sueldos_nov DESC;
  
 -- consulta de amelia para sacar Id certificaciones a re-calcular
 SELECT
    S.*,
    CPE.empresa_id,
    CPE.certificacion_id
FROM
    Segmento AS S
JOIN
    CertificacionPorEmpresa AS CPE ON S.certificacionPorEmpresa_id = CPE.id
WHERE
    S.solicitud_id IS NULL
    AND S.desde >= '2025-07-01'
    AND S.sancion_id IS NULL
   and CPE.empresa_id not in (99,123,160,709) 
and CPE.certificacion_id not in (98672) order by S.fechaAlta asc;

   
;
-- certificaciones a revisar por el bug del ajuste de cert
SELECT DISTINCT CPE.certificacion_id 
FROM Segmento AS S 
JOIN CertificacionPorEmpresa AS CPE ON S.certificacionPorEmpresa_id = CPE.id 
WHERE S.solicitud_id IS NULL AND S.desde >= '2025-07-01' AND S.sancion_id IS NULL
and CPE.empresa_id not in (99,123,160,709) 
and CPE.certificacion_id not in (98672)
ORDER BY certificacion_id ASC ;

SELECT DISTINCT CPE.certificacion_id 
FROM Segmento AS S 
JOIN CertificacionPorEmpresa AS CPE ON S.certificacionPorEmpresa_id = CPE.id 
WHERE S.solicitud_id IS NULL AND S.desde >= '2025-07-01' AND S.sancion_id IS NULL
-- and CPE.empresa_id not in (99,123,160,709) 
and CPE.certificacion_id not in (98672)
ORDER BY certificacion_id ASC ;

SELECT DISTINCT CPE.certificacion_id 
FROM Segmento AS S 
JOIN CertificacionPorEmpresa AS CPE ON S.certificacionPorEmpresa_id = CPE.id 
WHERE S.solicitud_id IS NULL AND S.desde >= '2025-07-01' AND S.sancion_id IS NULL
-- and CPE.empresa_id not in (99,123,160,709) 
-- and CPE.certificacion_id not in (98672)
ORDER BY certificacion_id ASC ;


-- certififaciones con segmento manual
SELECT a.numeroDocumento as CI, CPE.certificacion_id as IdCertificacion, S.id as IdSegmento, S.observaciones 
FROM Segmento AS S 
JOIN CertificacionPorEmpresa AS CPE ON S.certificacionPorEmpresa_id = CPE.id
JOIN EmpresaAfiliado ea on CPE.empresaAfiliado_id = ea.id
JOIN Afiliado a ON a.id = ea.afiliado_id 
WHERE S.solicitud_id IS NULL AND S.desde >= '2025-07-01' AND S.sancion_id IS NULL
-- and CPE.empresa_id not in (99,123,160,709) 
-- and CPE.certificacion_id not in (98672)
ORDER BY certificacion_id ASC ;

-- certificaciones modificadas por la correccion de datos
SELECT a.numeroDocumento as CI, CPE.certificacion_id as IdCertificacion, s.id as IdSegmento, s.montoPago 
from Segmento s 
JOIN CertificacionPorEmpresa AS CPE ON s.certificacionPorEmpresa_id = CPE.id
JOIN EmpresaAfiliado ea on CPE.empresaAfiliado_id = ea.id
JOIN Afiliado a ON a.id = ea.afiliado_id
where s.version >= "2025-12-16";


select * from Sueldo s where version >= "2025-12-16";

select count(*) from Sueldo s where version >= "2025-12-16"; -- 16773
select count(*) from SueldoAjustado s where version >= "2025-12-16"; -- 6778
select count(*) from 
SueldoAjustado sa join 
Sueldo s 
on sa.sueldo_id = s.id 
where s.version >= "2025-12-16" or sa.version >= "2025-12-16" 
; -- 13283

select * from Sueldo s where version >= "2025-12-16";
select * from CertificacionPorEmpresa;

select * from Afiliado a ;
select * from Empresa e ;
select * from ParametroMails pm ;

update Afiliado set correo = "seguroenfermedadsets@gmail.com"; 
update Empresa set mailGenerico = "seguroenfermedadsets@gmail.com", mailRRHH = "seguroenfermedadsets@gmail.com";
update ParametroMails set mailsAdministracion = "seguroenfermedadsets@gmail.com", mailsAtencionAlUsuario = "seguroenfermedadsets@gmail.com"
, mailsContaduria = "seguroenfermedadsets@gmail.com";



select * from Afiliado;
select * from EmpresaAfiliado ea ;

select * from GrupoConsejoSalarios gcs ;

SELECT table_name AS 'Tabla', ROUND((data_length + index_length) / 1024 / 1024, 2) AS 'MB' FROM information_schema.tables WHERE table_schema = 'tu_base' ORDER BY (data_length + index_length) DESC;


SELECT table_name AS 'Tabla', ROUND((data_length + index_length) / 1024 / 1024, 2) AS 'MB' 
FROM information_schema.tables 
WHERE table_schema = DATABASE() 
ORDER BY (data_length + index_length) DESC;


SELECT 
    table_name AS 'Tabla', 
    ROUND(data_length / 1024 / 1024, 2) AS 'Datos MB', 
    ROUND(index_length / 1024 / 1024, 2) AS 'Índices MB', 
    ROUND((data_length + index_length) / 1024 / 1024, 2) AS 'Total MB' 
FROM information_schema.tables 
WHERE table_schema = DATABASE() 
ORDER BY (data_length + index_length) DESC;

SELECT ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS 'Total Base MB' 
FROM information_schema.tables 
WHERE table_schema = DATABASE();



SELECT 
    'Tablas _AUD' AS 'Tipo',
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS 'MB' 
FROM information_schema.tables 
WHERE table_schema = DATABASE() AND table_name LIKE '%_AUD';

SELECT 
    CASE WHEN table_name LIKE '%_AUD' THEN 'Tablas _AUD' ELSE 'Otras tablas' END AS 'Tipo',
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS 'MB'
FROM information_schema.tables 
WHERE table_schema = DATABASE()
GROUP BY CASE WHEN table_name LIKE '%_AUD' THEN 'Tablas _AUD' ELSE 'Otras tablas' END;

select * from Cargo c ;
select * from EmpresaAfiliado ea ;
select * from GrupoConsejoSalarios gcs ;
