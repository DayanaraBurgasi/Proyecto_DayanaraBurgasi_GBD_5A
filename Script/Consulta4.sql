--CONSULTA 4

select t1.factura_num as factura,t1.factura_fecha as fecha_factura, t3.nom_empresa as empresa_cliente,t4.region_nombre as region ,
t3.direccion_empresa as direccion,trim('Encuesta realizada a  ') || ' ' || sum(t6.cantidad_encuestados) || ' ' || trim('personas') as descripcion_factura,
(trim('Cobro por ')|| ' ' ||t5.ran_nombre || ' ' || trim('es de $ ') || ' ' ||t5.ran_costo_estimado )as rango_cobro_poblacion,
trim('$')|| ' ' ||t1.factura_subtotal  as subtotal,trim('$')|| ' ' ||t1.factura_iva as iva,trim('$')|| ' ' ||t1.factura_total as total
from factura as t1
inner join encuesta as t2 on t1.factura_id = t2.factura_id
inner join cliente as t3 on t2.cliente_id = t3.cliente_id
inner join region as t4 on t3.region_id = t4.region_id
inner join rango_valor_encuesta as t5 on t1.ran_id = t5.ran_id
inner join encuesta_poblacion as t6 on t2.encuesta_id = t6.encuesta_id
inner join grupo_poblacion as t7 on t6.poblacion_id = t7.poblacion_id
where t1.factura_num = 'FAC-0036'
group by factura,empresa_cliente, region,direccion,fecha_factura, rango_cobro_poblacion, subtotal,iva, total;