select * from GRUPOPRESTACIONES g ;

select * from SUBGRUPOSPRESTACIONES s ;



select * from PRESTACIONES p ;

select * from PROVEEDORES p; 

select * from PROVEEDORES p where p.NOMBREFANTASIA  like '%Ruglio%';

select * from MUTUALISTAS m ;

select distinct(detalleMigracion) from ORDENESPRESTACIONES o where o.migrado = 0;
select * from ORDENESPRESTACIONES o where o.migrado = 0 and nroorden = 13345;

select * from EMPRESAS e where NROEMPSETS ;


-- PATOLOGIAS

select * from PATOLOGIAS p ;
select * from GRUPOSPATOLOGIAS g ;
select * from TIPOSPATOLOGIAS t ;

select DISTINCT p.CODIGOTIPOPATOLOGIA from PATOLOGIAS p;

select DISTINCT p.CODIGOGRUPOPATOLOGIA from PATOLOGIAS p where CODIGOTIPOPATOLOGIA = 2;

select p.*, g.*, t.* from PATOLOGIAS p
JOIN GRUPOSPATOLOGIAS g 
ON p.CODIGOGRUPOPATOLOGIA = g.CODIGO 
JOIN TIPOSPATOLOGIAS t 
ON p.CODIGOTIPOPATOLOGIA = t.CODIGO 
where p.CODIGOGRUPOPATOLOGIA = 'C';


select * from NOMBRESF n ;

select * from LOCALIDADES l order by DESCRIPCION ;

select * from AFILIADOS a ;

select NROLOCALIDAD, descripcion, NRODEPARTAMENTO, count(*) from LOCALIDADES l
group by DESCRIPCION, NRODEPARTAMENTO  
having count(*) > 1;

select descripcion, count(*) from LOCALIDADES l
group by DESCRIPCION  
having count(*) > 1;

select * from LOCALIDADES l where l.DESCRIPCION = 'Las Toscas';

select count(*) from LOCALIDADES l ;

select * from DEPARTAMENTOS d;


select * from
AFILIADOS a 
where NROLOCALIDAD < 21 and (NROLOCALIDAD = 0 or ISNULL(NROLOCALIDAD)) ;

select count(*) from AFILIADOS a ;


select * from LINEASPLANILLASALARIOS l where AUX1S = '1434332-5';






