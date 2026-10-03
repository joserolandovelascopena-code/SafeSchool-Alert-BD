--|Consultas de resumen|--

--|Consulta descriptiva con INNER JOIN 1 usando WHERE 'Medica'|--
SELECT 
		historial.id_historial,
		usuarios.nombre AS usuario,
		alertas.id_alerta,
		tipos_emergencia.tipo AS tipo,
		ubicaciones.nombre AS ubicacion,
		historial.descripcion AS descripcion,
		historial.fecha_hora AS fecha_y_hora

FROM public.historial
INNER JOIN public.usuarios ON historial.id_usuario = usuarios.id_usuario
INNER JOIN public.alertas ON historial.id_alerta = alertas.id_alerta
INNER JOIN public.tipos_emergencia ON historial.id_tipo = tipos_emergencia.id_tipo
INNER JOIN public.ubicaciones ON historial.id_ubicacion = ubicaciones.id_ubicacion

WHERE tipo = 'Medica';

--|Consulta descriptiva con INNER JOIN 2 usando WHERE 'Incendio'|--
SELECT 
		historial.id_historial,
		usuarios.nombre AS usuario,
		alertas.id_alerta,
		tipos_emergencia.tipo AS tipo,
		ubicaciones.nombre AS ubicacion,
		historial.descripcion AS descripcion,
		historial.fecha_hora AS fecha_y_hora

FROM public.historial
INNER JOIN public.usuarios ON historial.id_usuario = usuarios.id_usuario
INNER JOIN public.alertas ON historial.id_alerta = alertas.id_alerta
INNER JOIN public.tipos_emergencia ON historial.id_tipo = tipos_emergencia.id_tipo
INNER JOIN public.ubicaciones ON historial.id_ubicacion = ubicaciones.id_ubicacion

WHERE tipo = 'Incendio';

--|Resumen de cantidad de registros|--
Select Count(*) As registros_historial
From historial;

--|Resumen por grupo|--
Select id_tipo, Count (*) As cantidad
From historial
Group By id_tipo;

--|Valor minimo en el campo id_tipo|--
Select Min(id_tipo)
From historial;

