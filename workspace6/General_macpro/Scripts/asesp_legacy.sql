use asesp_legacy;

select * from funcionarios where username = 'asespUser';

select * from funcionarios;

insert into funcionarios values (1, 'jperez', ' Juan Perez', 1234, 'Enfermero');
insert into funcionarios values (2, 'asespUser', 'Usuario asesp', 345, 'Medico');

select * from AFILIADOS a ;


select * from (
	SELECT * FROM funcionarios
	
) a; 

