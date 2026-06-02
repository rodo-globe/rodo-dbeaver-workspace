select * from Aplicacion a ;

select * from Funcionalidad f order by id desc;

select * from Modulo m order by id desc;
select * from Modulo_Funcionalidad mf where mf.modulo_id > 34;
select * from Modulo_Funcionalidad mf where funcionalidad_id > 96;

select * from Aplicacion a ;

select * from Rol r  where aplicacion_id = 4;
select * from Modulo m ;

INSERT INTO Modulo
(version, etiqueta, nombre, aplicacion_id)
VALUES(0, 'formulario-pdf', 'formulario-pdf', 3);

INSERT INTO Modulo
(version, etiqueta, nombre, aplicacion_id)
VALUES(0, 'descargaPdf', 'descargaPdf', 3);

INSERT INTO Modulo
(version, etiqueta, nombre, aplicacion_id)
VALUES(0, 'Licencias', 'licencias', 4);

select * from Modulo_RolAut mra ;