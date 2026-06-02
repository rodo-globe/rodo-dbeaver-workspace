select * from Parametro p ;


select bpc, pagoMaximoBps, topePatologiasVarias , topePatologiasOncologicas from Parametro p ;

update Parametro set bpc = 6576, pagoMaximoBps = 64911, topePatologiasVarias = 57650, topePatologiasOncologicas = 93376
where id = 1;


select * from Autoregistro a where cedula = 37553393;

delete from Autoregistro where id = 4446;