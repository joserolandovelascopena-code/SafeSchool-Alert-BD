-- ALUMNO: ROLANDO VELASCO

-- 1. CLASE 1 TRABAJANDO CON LOS DATOS

-- 1.1. INSERT: 
-- 1.1.1. CONSULTA 1: Registro de 7 posibles emergencias que pudieran suceder en la institución educativa.

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

