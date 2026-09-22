-- ALUMNO: ROLANDO VELASCO

-- SEMANA 2: CONSULTAS

-- 1.2. SELECT: 
-- 1.2.1. CONSULTA 1: Mostrar todas las alertas.

 SELECT * FROM public.alertas;

-- 1.2.2. CONSULTA 2: Realizar un LEFT y un INNER JOIN para obtener datos
-- más completos de cada emergencia.

 SELECT 
    alertas.id_alerta,
    tipos_emergencia.tipo AS emergencia,
    ubicaciones.nombre AS ubicacion,
    usuarios.nombre AS usuario_atendio,
    alertas.descripcion AS descripcion,
    alertas.fecha AS dia_detectada,
    alertas.hora_emerg AS hora,
    alertas.estado
 FROM public.alertas
 LEFT JOIN public.usuarios ON alertas.id_usuario = usuarios.id_usuario
 INNER JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion;


/* 1.2.3. CONSULTA 3: Con SELECT, mostrar todas las alertas donde el estado sea "ACTIVA" */

 SELECT 
    alertas.id_alerta,
    tipos_emergencia.tipo AS emergencia,
    ubicaciones.nombre AS ubicacion,
    usuarios.nombre AS usuario_atendio,
    alertas.descripcion AS descripcion,
    alertas.fecha AS dia_detectada,
    alertas.hora_emerg AS hora,
    alertas.estado
   
 FROM public.alertas
 LEFT JOIN public.usuarios ON alertas.id_usuario = usuarios.id_usuario
 INNER JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 WHERE alertas.estado = 'ACTIVA';

-- 1.3. UPDATE: 
/* 1.3.1. CONSULTA 1: Cambiar el estado de las emergencias donde el estado sea "ACTIVA" */
    
 UPDATE public.alertas SET estado = 'ATENDIDA'
 WHERE estado = 'ACTIVA';

 SELECT * FROM public.alertas
 WHERE estado = 'Activa';
 
 /* 1.3.2. CONSULTA 2: Cambiar el usuario de la emergencia donde el estado sea "EN_PROCESO" */
    
 UPDATE public.alertas SET id_usuario = 1
 WHERE estado = 'EN_PROCESO';


 SELECT * FROM public.alertas
 WHERE estado = 'Activa';

-- 1.4. DELETE:
/* 1.4.1. CONSULTA 1: Con DELETE */

 DELETE FROM public.alertas
 WHERE estado = 'FALSA';

-- SELECT final

 SELECT 
    alertas.id_alerta,
    tipos_emergencia.tipo AS emergencia,
    ubicaciones.nombre AS ubicacion,
    usuarios.nombre AS usuario_atendio,
    alertas.descripcion AS descripcion,
    alertas.fecha AS dia_detectada,
    alertas.hora_emerg AS hora,
    alertas.estado
   
 FROM public.alertas
 LEFT JOIN public.usuarios ON alertas.id_usuario = usuarios.id_usuario
 INNER JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion;

-- CLASE 2: CONSULTAS PARA MI PROYECTO

-- 2.1. Consulta 1: Mostrar todas las ubicaciones de la institución educativa.

 SELECT * FROM public.alertas;


-- 2.2. Consulta 2: Filtrar las emergencias utilizando WHERE.

 SELECT 
    alertas.id_alerta,
    tipos_emergencia.tipo AS emergencia,
    ubicaciones.nombre AS ubicacion,
    usuarios.nombre AS usuario_atendio,
    alertas.descripcion AS descripcion,
    alertas.fecha AS dia_detectada,
    alertas.estado
   
 FROM public.alertas
 LEFT JOIN public.usuarios ON alertas.id_usuario = usuarios.id_usuario
 INNER JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 WHERE alertas.estado = 'EN_PROCESO';

 
-- 2.3. Consulta 3: Buscar información utilizando otro criterio (WHERE IN).

 SELECT 
    alertas.id_alerta,
    tipos_emergencia.tipo AS emergencia,
    ubicaciones.nombre AS ubicacion,
    usuarios.nombre AS usuario_atendio,
    alertas.descripcion AS descripcion,
    alertas.fecha AS dia_detectada,
    alertas.estado
   
 FROM public.alertas
 LEFT JOIN public.usuarios ON alertas.id_usuario = usuarios.id_usuario
 INNER JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 WHERE alertas.estado IN ('ATENDIDA','EN_PROCESO');

 -- 2.4. Consulta 4: Ordenar las emergencias más recientes utilizando ORDER BY.
 
 SELECT 
    alertas.id_alerta,
    tipos_emergencia.tipo AS emergencia,
    ubicaciones.nombre AS ubicacion,
    alertas.descripcion AS descripcion,
    alertas.fecha AS dia_detectada,
    alertas.hora_emerg AS hora,
    alertas.estado
   
 FROM public.alertas
 LEFT JOIN public.usuarios ON alertas.id_usuario = usuarios.id_usuario
 INNER JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 ORDER BY alertas.fecha DESC;



 -- 3. CINCO CONSULTAS RELACIONADAS CON EL PROYECTO 
  
 -- 3.1. Consulta 1: Mostrar todas las emergencias que en su descripción tengan la palabra "Humo".
 
 SELECT 
    alertas.id_alerta,
    tipos_emergencia.tipo AS emergencia,
    ubicaciones.nombre AS ubicacion,
    usuarios.nombre AS usuario_atendio,
    alertas.descripcion AS descripcion,
    alertas.fecha AS dia_detectada,
    alertas.estado
   
 FROM public.alertas
 LEFT JOIN public.usuarios ON alertas.id_usuario = usuarios.id_usuario
 INNER JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 WHERE alertas.descripcion LIKE '%Humo%' OR alertas.descripcion LIKE '%Incendio%';
 
 -- 3.2. Consulta 2: Mostrar todas las emergencias del Edificio A.
 
 SELECT 
    alertas.id_alerta,
    tipos_emergencia.tipo AS emergencia,
    ubicaciones.nombre AS ubicacion,
    alertas.descripcion AS descripcion,
    alertas.estado
   
 FROM public.alertas
 LEFT JOIN public.usuarios ON alertas.id_usuario = usuarios.id_usuario
 INNER JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 WHERE ubicaciones.nombre = 'Edificio A';

    
 -- 3.3. Consulta 3: Mostrar todas las emergencias de tipo "Incendio".
 
 SELECT 
    alertas.id_alerta,
    tipos_emergencia.tipo AS emergencia,
    ubicaciones.nombre AS ubicacion,
    usuarios.nombre AS usuario_atendio,
    alertas.descripcion AS descripcion,
    alertas.fecha AS dia_detectada,
    alertas.hora_emerg AS hora,
    alertas.estado
   
 FROM public.alertas
 LEFT JOIN public.usuarios ON alertas.id_usuario = usuarios.id_usuario
 INNER JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 WHERE tipos_emergencia.tipo = 'Incendio';

 -- 3.4. Consulta 4: Mostrar la cantidad de emergencias registradas por tipo.
  
 SELECT 
    tipos_emergencia.tipo AS emergencia,
    COUNT(tipos_emergencia.tipo) AS cantidad_emergencias
   
 FROM public.alertas
 LEFT JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 GROUP BY (tipos_emergencia.tipo);

 -- 3.5. Consulta 5: Mostrar la cantidad de emergencias por edificio.
  
 SELECT 
    tipos_emergencia.tipo AS emergencia,
    ubicaciones.nombre AS ubicacion,
    COUNT(tipos_emergencia.tipo) AS cantidad_emergencias
   
 FROM public.alertas
 LEFT JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 GROUP BY (ubicaciones.nombre, tipos_emergencia.tipo);


-- SEMANA 3: CONSULTAS

-- CLASE 1 SEMANA 3: Consultas relacionadas entre tablas

-- CONSULTA INNER JOIN 1: Mostrar información más completa de emergencias, mostrando usuario 
-- que la atendio, ubicación y tipo.

 SELECT 
    alertas.id_alerta,
    tipos_emergencia.tipo AS emergencia,
	usuarios.nombre AS usuario_atendio,
	alertas.descripcion AS descripcion,
	ubicaciones.nombre AS ubicacion,
    alertas.fecha AS dia_detectada,
    alertas.hora_emerg AS hora,
    alertas.estado
 FROM public.alertas
 LEFT JOIN  public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.usuarios ON alertas.id_usuario = usuarios.id_usuario
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion;

-- CONSULTA INNER JOIN 2: Mostrar todas alas ubicaciones del Edificio A, mostrando
-- el tipo de la emergencia, fecha y hora, de la más reciente a la más antigua.

 SELECT 
    alertas.id_alerta,
    tipos_emergencia.tipo AS emergencia,
	alertas.descripcion AS descripcion,
	ubicaciones.nombre AS ubicacion,
    alertas.fecha AS dia_detectada,
    alertas.hora_emerg AS hora,
    alertas.estado
 FROM public.alertas
 LEFT JOIN  public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 WHERE ubicaciones.nombre = 'Edificio A'
 ORDER BY alertas.fecha DESC;


 -- CLASE 2 SEMANA 3: Consultas de resumen y estadísticas

 -- Consulta 1: ¿Cuantas emergencias por tipo se encuentran activas?

 SELECT  
   alertas.estado,
   tipos_emergencia.tipo,
   COUNT(*) AS cant_emergencias_activas
 FROM public.alertas 
 LEFT JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 WHERE alertas.estado = 'ACTIVA'
 GROUP BY alertas.estado, tipos_emergencia.tipo;


-- Consulta 2: ¿Cuántas emergencias han ocurrido en el la institución educativa según su tipo?
  
 SELECT 
	i.nombre AS institucion, 
	te.tipo, 
	COUNT(*) AS cant_emergencias 
 FROM public.alertas a
 LEFT JOIN public.tipos_emergencia te ON a.id_tipo = te.id_tipo 
 INNER JOIN public.ubicaciones u ON a.id_ubicacion = u.id_ubicacion
 INNER JOIN public.instituciones i ON u.id_institucion = i.id_institucion 
 WHERE i.nombre = 'Instituto Católico Karol Wojtyla' 
 GROUP BY i.nombre, te.tipo; 
 
-- Consulta 3: ¿Cuántas emergencias hay en la institución educativa divididas por su estado (activas, atendidas, en_proceso, falsa.)?
 
 SELECT 
	i.nombre AS institucion, 
	a.estado, 
	COUNT(*) AS cant_emergencias
 FROM public.alertas a
 LEFT JOIN public.ubicaciones u ON a.id_ubicacion = u.id_ubicacion
 INNER JOIN public.instituciones i ON u.id_institucion = i.id_institucion 
 WHERE i.nombre = 'Instituto Católico Karol Wojtyla' 
 GROUP BY i.nombre, a.estado; 

 -- Consulta 4: ¿Cuáles son las ubicaciones dentro del la institución que han registrado más de 1 emergencia de cualquier tipo?
 
 SELECT 
    u.nombre AS zona,
    COUNT(a.id_alerta) AS total_emergencias
 FROM public.alertas a
 INNER JOIN public.ubicaciones u ON a.id_ubicacion = u.id_ubicacion
 INNER JOIN public.instituciones i ON u.id_institucion = i.id_institucion
 WHERE i.nombre = 'Instituto Católico Karol Wojtyla'
 GROUP BY u.nombre
 HAVING COUNT(a.id_alerta) > 1
 ORDER BY total_emergencias DESC;
