--CONSULTA 3

select t1.encuesta_id as encuesta, t2.nom_empresa as empresa,t1.proposito_descp as proposito_encuesta,
sum(t3.cantidad_encuestados) || ' ' || trim('encuestados') as poblacion,t1.resultados as resultados
from encuesta as t1
inner join cliente as t2 on t1.cliente_id = t2.cliente_id
inner join encuesta_poblacion as t3 on t1.encuesta_id = t3.encuesta_id
inner join grupo_poblacion as t4 on t3.poblacion_id = t4.poblacion_id
group by encuesta,empresa,proposito_encuesta, resultados
order by t1.encuesta_id asc;