SELECT * FROM LogGeneral lg ;

alter table LogJSON add column app varchar(255) after idLogGeneral;
alter table LogGeneral add column app varchar(255) ;
