-- CONSULTA 2

--Año 2018
select t2.nom_empresa as cliente ,t3.region_nombre as region, t2.direccion_empresa as direccion,
trim('Encuestas solicitadas :')|| ' ' ||count(t1.cliente_id)  as numero_encuestas_solicitadas
from encuesta as t1
inner join cliente as t2 on t1.cliente_id = t2.cliente_id
inner join region as t3 on t2.region_id = t3.region_id
where (fecha_inicio) between '2018-01-01' and '2018-12-31'
group by cliente, region,direccion;

--Año 2019
select t2.nom_empresa as cliente ,t3.region_nombre as region, t2.direccion_empresa as direccion,
trim('Encuestas solicitadas :')|| ' ' ||count(t1.cliente_id)  as numero_encuestas_solicitadas
from encuesta as t1
inner join cliente as t2 on t1.cliente_id = t2.cliente_id
inner join region as t3 on t2.region_id = t3.region_id
where (fecha_inicio) between '2019-01-01' and '2019-12-31'
group by cliente, region,direccion;

--Año 2020
select t2.nom_empresa as cliente ,t3.region_nombre as region, t2.direccion_empresa as direccion,
trim('Encuestas solicitadas :')|| ' ' ||count(t1.cliente_id)  as numero_encuestas_solicitadas
from encuesta as t1
inner join cliente as t2 on t1.cliente_id = t2.cliente_id
inner join region as t3 on t2.region_id = t3.region_id
where (fecha_inicio) between '2020-01-01' and '2020-12-31'
group by cliente, region,direccion;

--Año 2021
select t2.nom_empresa as cliente ,t3.region_nombre as region, t2.direccion_empresa as direccion,
trim('Encuestas solicitadas :')|| ' ' ||count(t1.cliente_id)  as numero_encuestas_solicitadas
from encuesta as t1
inner join cliente as t2 on t1.cliente_id = t2.cliente_id
inner join region as t3 on t2.region_id = t3.region_id
where (fecha_inicio) between '2021-01-01' and '2021-12-31'
group by cliente, region,direccion;