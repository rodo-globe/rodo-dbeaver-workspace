
select * from Licencia l where l.nroCobro in (20551, 24106
,99900003
,99900005
,99900078
,61011
,61707
,60719
,61164
,61956
,62076
,62140)
;


select * from Licencia where nroCobro = 16918;

select * from Usuario u ;

select u.id, u.userId, u.estado , u.fechaBaja, u.nombre from Usuario u 
where u.userId in (15279,
25936,
19668,
250650000,
25693,
30155) order by u.userId ;


select count(*), u.userId from Usuario u 
group by u.userId 
having count(*) > 1;

select * from Usuario;