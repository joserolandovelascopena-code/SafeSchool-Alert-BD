
-- ALUMNO: ROLANDO VELASCO

-- CREAR BASE DE DATOS

 CREATE DATABASE safeSchool_alert;


-- CREAR TABLA instituciones

  CREATE TABLE IF NOT EXISTS public.instituciones(
    id_institucion INTEGER UNIQUE GENERATED ALWAYS AS IDENTITY,
	nombre  CHARACTER(125) NOT NULL,
	creada DATE NOT NULL DEFAULT (CURRENT_DATE),
	
	CONSTRAINT instituciones_pkey PRIMARY KEY(id_institucion)
  )



-- CREAR TABLA usuarios
  CREATE TABLE IF NOT EXISTS public.usuarios(
    id_usuario INTEGER UNIQUE GENERATED ALWAYS AS IDENTITY,
	id_institucion INTEGER NOT NULL,
	nombre CHARACTER(100) NOT NULL,
	correo CHARACTER(125) UNIQUE NOT NULL,
	contrasena VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
	rol CHARACTER(50) NOT NULL DEFAULT 'docente',
	creado DATE NOT NULL DEFAULT(CURRENT_DATE),

	CONSTRAINT usuarios_pkey PRIMARY KEY(id_usuario),
	CONSTRAINT usuarios_institucion_fkey 
	FOREIGN KEY (id_institucion) REFERENCES instituciones(id_institucion)
  )

-- CREAR TABLA ubicaciones

  CREATE TABLE IF NOT EXISTS public.ubicaciones(
    id_ubicacion INTEGER UNIQUE GENERATED ALWAYS AS IDENTITY,
	id_institucion INTEGER NOT NULL,
	nombre CHARACTER(180) NOT NULL,
	creada DATE NOT NULL DEFAULT (CURRENT_DATE),

	CONSTRAINT ubicaciones_pkey PRIMARY KEY(id_ubicacion),
	CONSTRAINT ubicaciones_institucion_fkey 
	FOREIGN KEY(id_institucion) REFERENCES instituciones(id_institucion)
  )

-- CREAR TABLA tipos emergencias

  CREATE TABLE IF NOT EXISTS public.tipos_emergencia(
    id_tipo INTEGER UNIQUE GENERATED ALWAYS AS IDENTITY,
	tipo  CHARACTER(100) NOT NULL,
	creada DATE NOT NULL DEFAULT (CURRENT_DATE),
	
	CONSTRAINT tipos_emergencia_pkey PRIMARY KEY(id_tipo)
  )

-- CREAR TABLA alertas

  CREATE TABLE IF NOT EXISTS public.alertas(
    id_alerta INTEGER UNIQUE GENERATED ALWAYS AS IDENTITY,
	id_usuario INTEGER,
	id_tipo INTEGER NOT NULL,
	id_ubicacion INTEGER NOT NULL,
	comando_recibido CHARACTER(50) NOT NULL,
    descripcion CHARACTER(150) NOT NULL,
    estado CHARACTER(50) NOT NULL DEFAULT 'SEGURO',
	hora_emerg TIME NOT NULL DEFAULT (CURRENT_TIME),
	fecha DATE NOT NULL DEFAULT (CURRENT_DATE),

	CONSTRAINT alertas_pkey PRIMARY KEY(id_alerta),
	
	CONSTRAINT alertas_usuario_fkey 
	FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario),

		
	CONSTRAINT alertas_tipos_fkey 
	FOREIGN KEY(id_tipo) REFERENCES tipos_emergencia(id_tipo),
	
	CONSTRAINT alertas_ubicaciones_fkey 
	FOREIGN KEY(id_ubicacion) REFERENCES ubicaciones(id_ubicacion)
	
  )


-- INSERTAR DATOS

-- INSERTAR INSTITUCIÓN 
INSERT INTO public.instituciones (nombre) 
VALUES ('Instituto Católico Karol Wojtyla');

-- INSERTAR UBICACIONES
INSERT INTO public.ubicaciones (id_institucion, nombre) VALUES 
(1, 'Edificio A'),
(1, 'Edificio B'),
(1, 'Edificio C');

-- INSERTAR TIPOS DE EMERGENCIA
INSERT INTO public.tipos_emergencia (tipo) VALUES 
('Incendio'),
('Medica'),
('Seguridad');

-- INSERTAR USUARIOS 
INSERT INTO public.usuarios (id_institucion, nombre, correo, contrasena, telefono, rol) VALUES 
(1, 'Rolando Velasco', 'rolando.velasco@karolwojtyla.edu', '$2a$12$e8a...hash1', '71234567', 'admin'),
(1, 'María Fernández', 'maria.fernandez@karolwojtyla.edu', '2a$12$e8a...hash1', '78901234', 'docente'),
(1, 'Juan Pablo Rivas', 'juan.rivas@karolwojtyla.edu', '2a$12$e8a...hash1', '75558888', 'docente'),
(1, 'Ana Lucía Gómez', 'ana.gomez@karolwojtyla.edu', '2a$12$e8a...hash1', '73332211', 'docente'),
(1, 'Roberto Guardado', 'roberto.guardado@karolwojtyla.edu', '2a$12$e8a...hash1', '79990000', 'docente');

-- INSERTAR ALERTAS
INSERT INTO public.alertas (
  id_usuario, 
  id_tipo, 
  id_ubicacion, 
  comando_recibido,
  descripcion, estado, 
  hora_emerg, 
  fecha) 
VALUES 
  (1, 1, 1, 'Incendio,Edif_A,Activa', 'Humo detectado cerca del laboratorio principal en Edificio A', 'EN_PROCESO', '08:15:00', '2026-09-01'),
  (2, 2, 2, 'Medica,Edif_B,Activa', 'Estudiante herido en la cancha central del Edificio B', 'ATENDIDO', '10:30:00', '2026-09-01'),
  (3, 3, 3, 'Seguridad,Edif_C,Activa', 'Persona no autorizada detectada en el acceso al Edificio C', 'EN PROCESO', '11:45:00', '2026-09-02'),
  (4, 1, 1, 'Incendio,Edif_A,Activa', 'Alarma de incendio activada en pasillo del Edificio A', 'SEGURO', '14:20:00', '2026-09-02'),
  (5, 2, 1, 'Medica,Edif_A,Activa', 'Desmayo de alumno en aula 102 del Edificio A', 'ATENDIDO', '15:10:00', '2026-09-02');


SELECT * FROM public.instituciones;
SELECT * FROM public.usuarios;
SELECT * FROM public.ubicaciones;
SELECT * FROM public.tipos_emergencia;
SELECT * FROM public.alertas;

-- CONSULTA GLOBAL DE TABLAS EN BASE DE DATOS

SELECT 
    a.id_alerta,
    a.fecha,
    a.hora_emerg AS hora,
    te.tipo AS tipo_emergencia,
    u.nombre AS reportado_por,
    u.rol AS rol_usuario,
    ub.nombre AS ubicacion,
    i.nombre AS institucion,
    a.comando_recibido,
    a.descripcion,
    a.estado
FROM public.alertas a
LEFT JOIN public.usuarios u ON a.id_usuario = u.id_usuario
INNER JOIN public.tipos_emergencia te ON a.id_tipo = te.id_tipo
INNER JOIN public.ubicaciones ub ON a.id_ubicacion = ub.id_ubicacion
INNER JOIN public.instituciones i ON ub.id_institucion = i.id_institucion
ORDER BY a.fecha DESC, a.hora_emerg DESC;

-- CONSULTA DE TABLAS CON LEFT Y INNER JOIN
SELECT 
  alertas.id_alerta,
  tipos_emergencia.tipo AS emergencia,
  ubicaciones.nombre,
  alertas.hora_emerg,
  alertas.estado
  
 FROM alertas 
 LEFT JOIN tipos_emergencia ON  tipos_emergencia.id_tipo = alertas.id_tipo
 INNER JOIN ubicaciones ON  alertas.id_ubicacion = ubicaciones.id_ubicacion;

-- CREAR USUARIO SafeSchool

 CREATE USER safeschool_user
 WITH PASSWORD 'CAMBIAR_POR_OTRA_PASS';

 
 GRANT CONNECT ON
 DATABASE safeschool_alert
 TO safeschool_user;

 GRANT USAGE ON
 SCHEMA public
 TO safeschool_user;

 GRANT SELECT, INSERT, UPDATE, DELETE
 ON ALL TABLES IN SCHEMA public
 TO safeschool_user;

 SELECT grantee,  table_name, privilege_type FROM information_schema.role_table_grants
 WHERE grantee = 'safeschool_user';

 REVOKE DELETE ON ALL
 TABLES IN SCHEMA public
 FROM safeschool_user;

-- PRUEBAS DE PRIVILEGIOS DEL USUARIO
 /*Para realizar estas pruebas, primero debe de tener crear un nuevo server,
  con el usuario: "safeschool_user"*/

  
-- 1: CONSULTAS

 SELECT * FROM public.instituciones;
 SELECT * FROM public.usuarios;
 SELECT * FROM public.ubicaciones;
 SELECT * FROM public.tipos_emergencia;
 SELECT * FROM public.alertas;

-- 2: INSERTAR

 INSERT INTO public.usuarios (
   id_institucion, 
   nombre, correo, 
   contrasena, 
   telefono, 
   rol) 
 VALUES 
 (1, 'Usuario prueba', 'usuario.prueba@karolwojtyla.edu', '$2a$12$e8a...hash1', '88037753', 'docente');

-- 3: MODIFICAR

 UPDATE public.alertas SET estado = 'EN_PROCESO'
 WHERE id_alerta = 3;
 
-- 4: ELIMINAR

 DELETE FROM public.usuarios 
 WHERE nombre = 'Usuario prueba';
 
  