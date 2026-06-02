

select * from Contract c  where client_id = 23; -- 21,22,25,26, 33

select * from Contract_Product cp where cp.Contract_id in (21,22,25,26);

select * from ContractApp ca where ca.contract_id in (21,22,25,26);

select * from Contract c where  ;

select * from Client;

insert INTO Contract values (0, '2023-09-06 17:00:00', 1, null, 'MENSUAL', 'PENDING', '2023-05-09', '2123-05-09', 23, 1);

INSERT INTO ContractApp VALUES (0, '2023-09-06 17:00:00', 'appRRHHAsesp', 20000, 33);
INSERT INTO ContractApp VALUES (0, '2023-09-06 17:00:00', 'RRHHAsesp', 20000, 33);

insert into Client (name, currency_id, type_id, dontInvoice, active, documentXProject) values ("Ecoimagen", 1, 1, 0, 1, 0);

select * from TaskComplexity tc ;
select * from TaskComplexityValue tcv;

select tc.*, tcv.minutes from TaskComplexity tc 
join TaskComplexityValue tcv on tc.id = tcv.taskComplexity_id;