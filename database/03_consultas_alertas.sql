--ALUMNO: ROLANDO VELASCO

-- 1.2. SELECT: 
-- 1.2.1. CONSULTA 1: Con SELECT, mostrar todos las alertas.

  SELECT * FROM public.alertas;

-- 1.2.2. CONSULTA 2: Con SELECT, mostrar todas las alertas, 
-- con datos compartidos usando LEFT Y INNER JOIN. 

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
 WHERE ubicaciones.nombre = 'Edificio A' AND alertas.estado = 'ACTIVA' ;

/* 1.2.3. CONSULTA 3: Con SELECT, mostrar todas las alertas donde el estado sea "ATENDIDA"*/

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
 WHERE alertas.estado = 'ATENDIDA';

-- 1.3. UPDATE: 
/* 1.3.1. CONSULTA 1: Cambiar el estado de las emergencias donde estado sea "ACTIVA" */
   
 UPDATE public.alertas SET estado = 'ATENDIDA'
 WHERE estado = 'ACTIVA';

 /* 1.3.2. CONSULTA 2: Cambiar el usuario de la emergencia, donde el estado sea "EN_PROCESOs" */
   
 UPDATE public.alertas SET id_usuario = 1
 WHERE estado = 'EN_PROCESO';

-- 1.4. DELETE:
/* 1.4.1. CONSULTA 1:  Con DELETE */

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

-- CLASE 2 CONSULTAS PARA MI PROYECTO

-- 2.1. Consulta 1: Mostrar todas las ubicaciones de la intitución educativa.

 SELECT * FROM public.ubicaciones;


-- 2.2. Consulta 2: Filtrar las emergencias utilizando WHERE.

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
 WHERE alertas.id_usuario = 1;
 
-- 2.3. Consulta 3: Buscar información utilizando otro criterio (WHERE IN).

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
 WHERE alertas.estado IN ('ATENDIDA','FALSA');

 -- 2.4. Consulta 4: Ordenar las emergencias por más recientes utilizando ORDER BY.
 
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
 ORDER BY alertas.fecha DESC;

 
 -- 2.5. Consulta 5: Mostrar todas las emergencias, que en su discripción tengan la palabra "Humo"
 
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
 WHERE alertas.descripcion LIKE '%Humo%'
 ORDER BY alertas.fecha DESC;

  
 -- 2.6. Consulta 6:Mostrar todas las emergencias del Edifico A
 
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
 WHERE ubicaciones.nombre = 'Edificio A';

   
 -- 2.7. Consulta 7: Mostrar todas las emergencias de tipo "Incendio"
 
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

 -- 2.8. Consulta 8: Mostrar la cantidad de emergencias registradas por tipo.
  
 SELECT 
   tipos_emergencia.tipo AS emergencia,
   COUNT(tipos_emergencia.tipo) AS cantidad_emergencias
  
 FROM public.alertas
 LEFT JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 GROUP BY (tipos_emergencia.tipo);

 -- 2.9. Consulta 9: Mostrar la cantidad de emergencias por edificio
  
 SELECT 
   tipos_emergencia.tipo AS emergencia,
   ubicaciones.nombre AS ubicacion,
   COUNT(tipos_emergencia.tipo) AS cantidad_emergencias
  
 FROM public.alertas
 LEFT JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 GROUP BY (ubicaciones.nombre, tipos_emergencia.tipo);

 -- 2.10. Consulta 10: Mostrar los edificios que tengan almenos dos emergencias
 SELECT 
    ubicaciones.nombre AS ubicacion,
    tipos_emergencia.tipo AS emergencia,
    COUNT(alertas.id_alerta) AS cantidad_emergencias
 FROM public.alertas
 INNER JOIN public.tipos_emergencia ON alertas.id_tipo = tipos_emergencia.id_tipo
 INNER JOIN public.ubicaciones ON alertas.id_ubicacion = ubicaciones.id_ubicacion
 GROUP BY 
    ubicaciones.nombre,
    tipos_emergencia.tipo
 HAVING COUNT(alertas.id_alerta) > 1;