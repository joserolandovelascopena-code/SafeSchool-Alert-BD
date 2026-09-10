
-- ALUMNOS: ROLANDO VELASCO, MARIO MELÉNDEZ, ULISES MERCADO

-- CREAR BASE DE DATOS

 CREATE DATABASE safeSchool_alert;


-- CREAR TABLA instituciones

  CREATE TABLE IF NOT EXISTS public.instituciones(
    id_institucion INTEGER UNIQUE GENERATED ALWAYS AS IDENTITY,
	nombre  VARCHAR(125) NOT NULL,
	creada DATE NOT NULL DEFAULT (CURRENT_DATE),
	
	CONSTRAINT instituciones_pkey PRIMARY KEY(id_institucion)
  );


-- CREAR TABLA usuarios

  CREATE TABLE IF NOT EXISTS public.usuarios(
    id_usuario INTEGER UNIQUE GENERATED ALWAYS AS IDENTITY,
	id_institucion INTEGER NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	correo VARCHAR(125) UNIQUE NOT NULL,
	contrasena VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
	rol VARCHAR(50) NOT NULL DEFAULT 'docente',
	creado DATE NOT NULL DEFAULT(CURRENT_DATE),

	CONSTRAINT usuarios_pkey PRIMARY KEY(id_usuario),
	CONSTRAINT usuarios_institucion_fkey 
	FOREIGN KEY (id_institucion) REFERENCES instituciones(id_institucion)
  );

-- CREAR TABLA ubicaciones

  CREATE TABLE IF NOT EXISTS public.ubicaciones(
    id_ubicacion INTEGER UNIQUE GENERATED ALWAYS AS IDENTITY,
	id_institucion INTEGER NOT NULL,
	nombre VARCHAR(180) NOT NULL,
	creada DATE NOT NULL DEFAULT (CURRENT_DATE),

	CONSTRAINT ubicaciones_pkey PRIMARY KEY(id_ubicacion),
	CONSTRAINT ubicaciones_institucion_fkey 
	FOREIGN KEY(id_institucion) REFERENCES instituciones(id_institucion)
  );

-- CREAR TABLA tipos emergencias

  CREATE TABLE IF NOT EXISTS public.tipos_emergencia(
    id_tipo INTEGER UNIQUE GENERATED ALWAYS AS IDENTITY,
	tipo  VARCHAR(100) NOT NULL,
	creada DATE NOT NULL DEFAULT (CURRENT_DATE),
	
	CONSTRAINT tipos_emergencia_pkey PRIMARY KEY(id_tipo)
  );

-- CREAR TABLA alertas

  CREATE TABLE IF NOT EXISTS public.alertas(
    id_alerta INTEGER UNIQUE GENERATED ALWAYS AS IDENTITY,
	id_usuario INTEGER,
	id_tipo INTEGER NOT NULL,
	id_ubicacion INTEGER NOT NULL,
	comando_recibido VARCHAR(50) NOT NULL,
    descripcion VARCHAR(150) NOT NULL,
    estado VARCHAR(50) NOT NULL DEFAULT 'SEGURO',
	hora_emerg TIME NOT NULL DEFAULT (CURRENT_TIME),
	fecha DATE NOT NULL DEFAULT (CURRENT_DATE),

	CONSTRAINT alertas_pkey PRIMARY KEY(id_alerta),
	
	CONSTRAINT alertas_usuario_fkey 
	FOREIGN KEY(id_usuario) REFERENCES usuarios(id_usuario),

		
	CONSTRAINT alertas_tipos_fkey 
	FOREIGN KEY(id_tipo) REFERENCES tipos_emergencia(id_tipo),
	
	CONSTRAINT alertas_ubicaciones_fkey 
	FOREIGN KEY(id_ubicacion) REFERENCES ubicaciones(id_ubicacion)
	
  );

-- CREAR TABLA historial

  CREATE TABLE IF NOT EXISTS public.historial
   (
    id_historial INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    id_usuario INTEGER NOT NULL,
	id_alerta INTEGER NOT NULL,
	id_tipo INTEGER NOT NULL,
	id_ubicacion INTEGER NOT NULL,
	descripcion VARCHAR(200) NOT NULL,
    fecha_hora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

	CONSTRAINT historial_pkey PRIMARY KEY (id_historial),
	
    CONSTRAINT historial_ubicaciones_fkey FOREIGN KEY (id_ubicacion)
	REFERENCES public.ubicaciones(id_ubicacion),

	CONSTRAINT historial_usuarios_fkey FOREIGN KEY (id_usuario)
    REFERENCES public.usuarios(id_usuario),

    CONSTRAINT historial_alertas_fkey FOREIGN KEY (id_alerta)
    REFERENCES public.alertas(id_alerta),

	CONSTRAINT historial_tipos_fkey FOREIGN KEY (id_tipo)
    REFERENCES public.tipos_emergencia (id_tipo)

   );

-- CONSULTAS DE TABLAS

	SELECT * FROM public.instituciones;
	SELECT * FROM public.usuarios;
	SELECT * FROM public.ubicaciones;
	SELECT * FROM public.tipos_emergencia;
	SELECT * FROM public.alertas;
    SELECT * FROM public.historial;


  