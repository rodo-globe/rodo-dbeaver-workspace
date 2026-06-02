ALTER Table Sueldo Drop Foreign key FKpk6u7618fwtjaoyh75rby1s51;
ALTER TABLE Sueldo DROP INDEX UKqcd3aaf84a08u3rjquu0uudsl;
ALTER TABLE Sueldo ADD CONSTRAINT FKpk6u7618fwtjaoyh75rby1s51 Foreign key (empresaAfiliado_id) references EmpresaAfiliado(id);

UPDATE Archivo SET estado=4 WHERE estado=1 OR estado=3;

ALTER TABLE LineaArchivo MODIFY column error longtext;
ALTER TABLE LineaArchivo_AUD MODIFY column error longtext;

UPDATE Archivo SET error = REPLACE(error, '. ', '. | ');

INSERT INTO Concepto (activo, idBaseLegacy, migrado, observacionesMigracion, version, descripcion, tipo)
VALUES(1, NULL, 0, NULL, '2024-11-05 21:15:12', 'Reverso subsidios por enfermedad', 1);

UPDATE Concepto AS c1
JOIN Concepto AS c2
ON c2.descripcion = 'Subsidios por enfermedad'
SET c1.conceptoReverso_id = c2.id
WHERE c1.descripcion = 'Reverso subsidios por enfermedad';

UPDATE Concepto AS c1
JOIN Concepto AS c2
ON c2.descripcion = 'Reverso subsidios por enfermedad'
SET c1.conceptoReverso_id = c2.id
WHERE c1.descripcion = 'Subsidios por enfermedad';

INSERT INTO Concepto (activo, idBaseLegacy, migrado, observacionesMigracion, version, descripcion, tipo)
VALUES(1, NULL, 0, NULL, '2024-11-05 21:15:30', 'Reverso aporte patronal', 1);

UPDATE Concepto AS c1
JOIN Concepto AS c2
ON c2.descripcion = 'Aporte patronal'
SET c1.conceptoReverso_id = c2.id
WHERE c1.descripcion = 'Reverso aporte patronal';

UPDATE Concepto AS c1
JOIN Concepto AS c2
ON c2.descripcion = 'Reverso aporte patronal'
SET c1.conceptoReverso_id = c2.id
WHERE c1.descripcion = 'Aporte patronal';

INSERT INTO Concepto (activo, idBaseLegacy, migrado, observacionesMigracion, version, descripcion, tipo)
VALUES(1, NULL, 0, NULL, '2024-11-05 21:15:48', 'Reverso aporte obrero', 1);

UPDATE Concepto AS c1
JOIN Concepto AS c2
ON c2.descripcion = 'Aporte obrero'
SET c1.conceptoReverso_id = c2.id
WHERE c1.descripcion = 'Reverso aporte obrero';

UPDATE Concepto AS c1
JOIN Concepto AS c2
ON c2.descripcion = 'Reverso aporte obrero'
SET c1.conceptoReverso_id = c2.id
WHERE c1.descripcion = 'Aporte obrero';

INSERT INTO Concepto (activo, idBaseLegacy, migrado, observacionesMigracion, version, descripcion, tipo)
VALUES(1, NULL, 0, NULL, '2024-11-27 11:50:08', 'Ajuste multiempleo', 1);
INSERT INTO Concepto (activo, idBaseLegacy, migrado, observacionesMigracion, version, descripcion, tipo)
VALUES(1, NULL, 0, NULL, '2024-11-27 11:50:01', 'Reverso ajuste multiempleo', 1);

UPDATE Concepto AS c1
JOIN Concepto AS c2
ON c2.descripcion = 'Ajuste multiempleo'
SET c1.conceptoReverso_id = c2.id
WHERE c1.descripcion = 'Reverso ajuste multiempleo';

UPDATE Concepto AS c1
JOIN Concepto AS c2
ON c2.descripcion = 'Reverso ajuste multiempleo'
SET c1.conceptoReverso_id = c2.id
WHERE c1.descripcion = 'Ajuste multiempleo';

INSERT INTO Concepto (activo, idBaseLegacy, migrado, observacionesMigracion, version, descripcion, tipo)
VALUES(1, NULL, 0, NULL, '2024-11-25 17:36:57', 'Ajuste por baja afiliado', 1);

INSERT INTO Concepto (activo, idBaseLegacy, migrado, observacionesMigracion, version, descripcion, tipo)
VALUES(1, NULL, 0, NULL, '2024-11-25 17:36:47', 'Reverso ajuste por baja afiliado', 1);

UPDATE Concepto AS c1
JOIN Concepto AS c2
ON c2.descripcion = 'Ajuste por baja afiliado'
SET c1.conceptoReverso_id = c2.id
WHERE c1.descripcion = 'Reverso ajuste por baja afiliado';

UPDATE Concepto AS c1
JOIN Concepto AS c2
ON c2.descripcion = 'Reverso ajuste por baja afiliado'
SET c1.conceptoReverso_id = c2.id
WHERE c1.descripcion = 'Ajuste por baja afiliado';

ALTER TABLE Parametro ADD COLUMN conceptoAjusteBajaAfiliado_id BIGINT NULL;
UPDATE Parametro set conceptoAjusteMultiempleo_id = (SELECT id from Concepto WHERE descripcion='Ajuste multiempleo');

ALTER TABLE Parametro ADD COLUMN conceptoAjusteMultiempleo_id BIGINT NULL;
UPDATE Parametro set conceptoAjusteBajaAfiliado_id = (SELECT id from Concepto WHERE descripcion='Ajuste por baja afiliado');

ALTER TABLE ParametroMails ADD COLUMN mailsDeclaracionJurada VARCHAR(255);

ALTER TABLE ParametroMails ADD COLUMN creadaDeclaracionJuradaTemplate VARCHAR(255);

-- de aca para abajo se modifico el script porque no funcionaba nada

UPDATE ParametroMails set creadaDeclaracionJuradaTemplate = 'mailTemplates/declaracion-jurada-creada-para-empresa.html';

ALTER TABLE ParametroMails ADD COLUMN creadaDeclaracionJuradaAsuntoMail VARCHAR(255);
UPDATE ParametroMails set creadaDeclaracionJuradaAsuntoMail = '[SETS] Se ha credo la Declarción Jurada'

ALTER TABLE ParametroMails ADD COLUMN firmadaDeclaracionJuradaTemplateParaEmpresa VARCHAR(255);
UPDATE ParametroMails set firmadaDeclaracionJuradaTemplateParaEmpresa = 'mailTemplates/declaracion-jurada-firmada-para-empresa.html';
ALTER TABLE ParametroMails ADD COLUMN firmadaDeclaracionJuradaAsuntoMailParaEmpresa VARCHAR(255);
UPDATE ParametroMails set firmadaDeclaracionJuradaAsuntoMailParaEmpresa = '[SETS] Declaración Jurada firmada';

ALTER TABLE ParametroMails ADD COLUMN aprobadaDeclaracionJuradaTemplateParaEmpresa VARCHAR(255);
UPDATE ParametroMails set aprobadaDeclaracionJuradaTemplateParaEmpresa = 'mailTemplates/declaracion-jurada-aprobada-para-empresa.html';
ALTER TABLE ParametroMails ADD COLUMN aprobadaDeclaracionJuradaAsuntoMailParaEmpresa VARCHAR(255);
UPDATE ParametroMails set aprobadaDeclaracionJuradaAsuntoMailParaEmpresa = '[SETS] Declaración jurada aprobada'

ALTER TABLE ParametroMails ADD COLUMN firmadaDeclaracionJuradaTemplateParaSETS VARCHAR(255);
UPDATE ParametroMails set firmadaDeclaracionJuradaTemplateParaSETS = 'mailTemplates/declaracion-jurada-firmada-para-SETS.html';
ALTER TABLE ParametroMails ADD COLUMN firmadaDeclaracionJuradaAsuntoMailParaSETS VARCHAR(255);
UPDATE ParametroMails set firmadaDeclaracionJuradaAsuntoMailParaSETS = '[SETS] Declaración Jurada firmada';

ALTER TABLE ParametroMails ADD COLUMN aprobadaDeclaracionJuradaTemplateParaSETS VARCHAR(255);
UPDATE ParametroMails set aprobadaDeclaracionJuradaTemplateParaSETS = 'mailTemplates/declaracion-jurada-aprobada-para-SETS.html';
ALTER TABLE ParametroMails ADD COLUMN aprobadaDeclaracionJuradaAsuntoMailParaSETS VARCHAR(255);
UPDATE ParametroMails set aprobadaDeclaracionJuradaAsuntoMailParaSETS = '[SETS] Declaración Jurada aprobada';

ALTER TABLE ParametroMails ADD COLUMN anuladaDeclaracionJuradaTemplate VARCHAR(255);
UPDATE ParametroMails set firmadaDeclaracionJuradaAsuntoMailParaEmpresa = 'mailTemplates/declaracion-jurada-anulada-para-empresa.html';
ALTER TABLE ParametroMails ADD COLUMN anuladaDeclaracionJuradaAsuntoMail VARCHAR(255);
UPDATE ParametroMails set firmadaDeclaracionJuradaAsuntoMailParaEmpresa = '[SETS] Se ha anulado una Declaración Jurada';

ALTER TABLE ParametroMails ADD COLUMN controlMedicoCambioGerenciaTemplate VARCHAR(255);
UPDATE ParametroMails set controlMedicoCambioGerenciaTemplate = 'mailTemplates/control-medico-cambio-gerencia.html';
ALTER TABLE ParametroMails ADD COLUMN controlMedicoCambioGerenciaAsuntoMail VARCHAR(255);
UPDATE ParametroMails set controlMedicoCambioGerenciaAsuntoMail = '[SETS] Gerencia ha cambiado el estado de un control médico';
