--|Consultas de la tabla historial|--

--|Consulta general|--
SELECT * FROM historial

--|Consulta con WHERE 1|--
SELECT * FROM historial
WHERE id_usuario = 3;

--|Consulta con WHERE 2|--
SELECT * FROM historial
WHERE id_ubicacion = 2;

--|Consulta con ORDER BY 1|--
SELECT * FROM historial
ORDER BY id_ubicacion ASC;

--|Consulta con ORDER BY 2|--
SELECT * FROM historial
ORDER BY id_tipo DESC;

--|Consulta descriptiva con INNER JOIN 1 General|--
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
INNER JOIN public.ubicaciones ON historial.id_ubicacion = ubicaciones.id_ubicacion;

--|Consulta descriptiva con INNER JOIN 2 General con ORDER BY ASC|--
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

ORDER BY id_historial ASC;

--|Consulta descriptiva con INNER JOIN 3 General con ORDER BY DESC|--
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

ORDER BY id_historial DESC;

--|Consulta descriptiva con INNER JOIN 4 usando WHERE 'Medica'|--
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

--|Consulta descriptiva con INNER JOIN 5 usando WHERE 'Seguridad'|--
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

WHERE tipo = 'Seguridad';

--|Consulta descriptiva con INNER JOIN 6 usando WHERE 'Incendio'|--
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

--|Consulta descriptiva con INNER JOIN 7 usando WHERE 'Medica' y ORDER BY ASC|--
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

WHERE tipo = 'Medica'

ORDER BY id_historial ASC;

--|Consulta descriptiva con INNER JOIN 8 usando WHERE 'Medica' y ORDER BY DESC|--
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

WHERE tipo = 'Medica'

ORDER BY id_historial DESC;

--|Consulta descriptiva con INNER JOIN 9 usando WHERE 'Seguridad' y ORDER BY ASC|--
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

WHERE tipo = 'Seguridad'

ORDER BY id_historial ASC;

--|Consulta descriptiva con INNER JOIN 10 usando WHERE 'Seguridad' y ORDER BY DESC|--
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

WHERE tipo = 'Seguridad'

ORDER BY id_historial DESC;

--|Consulta descriptiva con INNER JOIN 11 usando WHERE 'Medica' y ORDER BY ASC|--
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

WHERE tipo = 'Medica'

ORDER BY id_historial ASC;

--|Consulta descriptiva con INNER JOIN 12 usando WHERE 'Incendio' y ORDER BY DESC|--
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

WHERE tipo = 'Incendio'

ORDER BY id_historial DESC;