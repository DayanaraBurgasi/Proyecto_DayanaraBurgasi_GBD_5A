--CONSULTA 1

select t2.pers_nombre || ' ' || t2.pers_apellido as empleado, t2.pers_area as area, t1.tipo_personal as tipo_empleado,t4.region_nombre as region,
t3.suc_nombre as sucursal, trim('A participado en')|| ' ' || count(t1.personal_id) || ' ' || trim('Encuestas') as numero_encuestas_participadas 
from encuesta_personal as t1
inner join personal as t2 on t1.personal_id = t2.personal_id
inner join sucursal as t3 on t2.sucursal_id = t3.sucursal_id
inner join region as t4 on t3.region_id = t4.region_id
group by empleado, area, tipo_empleado, region, sucursal;	