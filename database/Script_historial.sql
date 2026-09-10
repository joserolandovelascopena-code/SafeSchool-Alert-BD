--|Inserción de datos de prueba|--
INSERT INTO historial (id_usuario, id_alerta, id_tipo, id_ubicacion, descripcion)
VALUES	(1, 1, 1, 1, 'Humo detectado cerca del laboratorio principal en Edificio A.'),
		(2, 2, 2, 2, 'Estudiante herido en la cancha central del Edificio B.'),
		(3, 3, 3, 3, 'Persona no autorizada detectada en el acceso al Edificio C.'),
		(4, 4, 1, 1, 'Alarma de incendio activada en pasillo del Edificio A.'),
		(3, 5, 2, 1, 'Desmayo de alumno en el primero Sección "A" del Edificio A.'),
		(1, 6, 1, 2, 'Humo detectado cerca del laboratorio principal en Edificio B.'),
		(3, 7, 2, 2, 'Estudiante lesionado en la cancha.');

--|Consultas|--

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

--|Consulta con INNER JOIN|--
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


--|Modificación de registros|--

--|Modificación de descripción 1|--
UPDATE historial
SET descripcion = 'Incendio detectado en el laboratorio en Edificio B'
WHERE id_historial = 1;

--|Modificación de descripción 2|--
UPDATE historial
SET descripcion = 'Intruso detectado en Edificio C'
WHERE id_historial = 3;

--|Eliminación de registros|--

--|Eliminación de regristro por medio de id_tipo utilizando WHERE|--
DELETE FROM hsitorial
WHERE id_tipo = 3;

--|Eliminación de registros por medio de id_usuario utilizando WHERE|--
DELETE FROM historial
WHERE id_usuario = 4;