select * from Client c ;

select * from Document d where d.client_id = 14 and d.subTotal = 1600;

select sum(d.subTotal) from Document d where d.client_id = 14 and d.subTotal = 1600;

select * from Document d order by id desc;

select * from NumberGenerator ng ;

select * from `User` u ;
select * from HourRegistry h where h.userId = 'horacio' and minutes = 420 and dontInvoice = 1;

select * from UserProfile_userIds;
select * from UserProfile_userIds where UserProfile_id = 6;
select * from UserProfile up ;

select * from UserProfile_userIds;

select * from User where name like "%ernanda%";
insert into UserProfile_userIds values(6,"cesar.ruiz");

insert into UserProfile_userIds values(6,"jorge.pinetta");
insert into UserProfile_userIds values(6,"dario.armella");
insert into UserProfile_userIds values(6,"matias.correa");
insert into UserProfile_userIds values(6,"sebastian.sandoval");
delete from UserProfile_userIds where userIds in ("hernan", "lucia", "fernando", "estibaliz", "ignacio", "santio", "rafael",
"eugenia", "camilo", "juan", "miguel", "dasuly", "gfacon", "fernanda", "rafael.cadenas", "frebella", "sebastian.sandoval");

/*
 * 
 * 1	hernan
1	lucia
6	fernando
7	santiago
2	rodolfo
2	javier
4	jacqueline
3	estibaliz
3	ignacio
6	gonzalo
3	santio
6	horacio
1	rafael
3	eugenia
1	camilo
1	juan
1	juandavid
1	jose
1	miguel
8	dasuly
3	gfalcon
9	fernanda
1	rafael.cadenas
7	amelia
6	frebella
6	luciano
6	karina
6	dario.armella
6	matias.correa
6	sebastian.sandoval
7	karina.sommaruga
6	jorge.pinetta
 * 
 */
 */


select * from Project p
where p.client_id = 14;

select sum(subtotal) as neto from Document d 
where d.client_id = 14 and subtotal = 1600
order by id asc;

select sum(minutes)/60 as total, (sum(minutes)/60) * 50 as precioUSD from HourRegistry h
join Task t on h.task_id = t.id 
join Project p on p.id = t.project_id 
where p.id = 266;


select h.id, t.title , t.description, h.minutes, h.userId, h.created 
from HourRegistry h
join Task t on h.task_id = t.id 
join Project p on p.id = t.project_id 
where p.id = 266
order by h.id;

select * from Project p ; 
select p.id, p.active, p.name, p.description, p.client_id, p.defaultProduct_id, p.dontInvoice from Project p ; 

select p.id, p.active, p.name, p.description, p.defaultProduct_id, p.dontInvoice, c.name 
from Project p join Client c
on p.client_id = c.id ; 


select p.id, c.name, p.name, round(sum(hr.minutes)/60,0), p.description, p.defaultProduct_id, p.dontInvoice 
from Project p join Client c 
on p.client_id = c.id 
join Task t 
on t.project_id = p.id 
join HourRegistry hr
on hr.task_id = t.id
where t.deleted = false
and c.id <> 7
group by t.project_id ;

select * from Sprint s order by id desc; --179

select * from Task t where t.sprint_id  = 179; -- project 227

update Task set project_id = 271 where project_id = 227 and sprint_id  = 179;

select * from Project order by id desc;

select * from UserProfile up ;
select * from UserProfile_userIds upui where UserProfile_id = 6;
insert into UserProfile_userIds values (6, "luciano");
insert into UserProfile_userIds values (6, "karina");

select * from Document where subTotal = 5625;

select * from Document order by id desc;
select * from Document where id in (1631,1629);

select * from NumberGenerator ng ;

select * from Document d order by id desc;

use timetracker_db;

select * from Client;
select * from CostCenter cc ;
select * from Proforma order by id desc; -- 721

select * from ImportedHourRegistry ihr where proforma_id = 721 and created < '2025-11-01' ;
delete from ImportedHourRegistry where proforma_id = 721 and created < '2025-11-01' ;

select * from Project p where p.name = "Reuniones internas";
select * from Task t where t.title = "Reunion equipo"; -- 193


select * from HourRegistry hr 
where hr.task_id = 193
and hr.created >= "2026-02-01";







