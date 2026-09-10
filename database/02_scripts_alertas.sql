DELETE FROM public.alertas; 
-- 1. CLASE 1 TRABAJANDO CON LOS DATOS

-- 1.1. INSERT: 
-- 1.1.1. CONSULTA 1: Creación de 7 posibles emergencias que pudieran suceder en la institución educativa.

INSERT INTO public.alertas (
  id_usuario, 
  id_tipo, 
  id_ubicacion, 
  comando_recibido,
  descripcion, estado, 
  hora_emerg, 
  fecha) 
VALUES 
  (1, 1, 1, 'Incendio,Edif_A,Activa', 'Humo detectado cerca del laboratorio principal en Edificio A', 'ACTIVA', '10:30:00', '2026-09-09'),
  (2, 2, 2, 'Medica,Edif_B,Activa', 'Estudiante herido en la cancha central del Edificio B', 'ACTIVA', '4:30:00', '2026-09-01'),
  (3, 3, 3, 'Seguridad,Edif_C,Activa', 'Persona no autorizada detectada en el acceso al Edificio C', 'EN_PROCESO', '11:45:00', '2026-09-02'),
  (4, 1, 1, 'Incendio,Edif_A,Activa', 'Alarma de incendio activada en pasillo del Edificio A', 'ATENDIDA', '12:20:00', '2026-08-30'),
  (3, 2, 1, 'Medica,Edif_A,Activa', 'Desmayo de alumno en el primero Sección "A" del Edificio A', 'FALSA', '15:10:00', '2026-08-28'),
  (1, 1, 2, 'Incendio,Edif_B,Activa', 'Humo detectado cerca del laboratorio principal en Edificio B', 'ATENDIDA', '15:10:00', '2026-08-28'),
  (3, 2, 2, 'Medica,Edif_B,Activa', 'Estudiante lesionado en la cancha.', 'FALSA', '5:10:00', '2026-08-24');


-- 1.2. SELECT: 
-- 1.2.1. CONSULTA 1: Con SELECT.

  SELECT * FROM public.alertas;

-- 1.2.2. CONSULTA 2: Con SELECT. 

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

/* 1.2.3. CONSULTA 3: Con SELECT */

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
/* 1.3.1. CONSULTA 1: Con UPDATE */
   
 UPDATE public.alertas SET estado = 'ATENDIDA'
 WHERE estado = 'ACTIVA';

 /* 1.3.2. CONSULTA 2: Con UPDATE*/
   
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