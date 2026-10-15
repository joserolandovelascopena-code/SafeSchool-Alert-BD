SELECT nombre, correo, telefono, rol
FROM usuarios
WHERE rol = 'Docente';


SELECT id_usuario, nombre, correo, rol
FROM usuarios
WHERE nombre ILIKE '%Diana%';


SELECT id_usuario, nombre, correo, rol
FROM usuarios
ORDER BY nombre ASC;


SELECT id_usuario, nombre, correo, telefono, rol
FROM usuarios
WHERE rol IN ('Directora', 'Subdirectora', 'Subdirector');



SELECT nombre, correo
FROM usuarios;



SELECT nombre, correo
FROM usuarios
WHERE rol IN ('Directora', 'Subdirectora', 'Subdirector');


SELECT * FROM usuarios;



 SELECT
   u.id_usuario,
   u.nombre,
   u.correo,
   u.rol,
   i.nombre AS institucion_del_usuario,
   u.creado AS creado_en
FROM public.usuarios u
INNER JOIN public.instituciones i ON u.id_institucion = i.id_institucion;


SELECT
   u.id_usuario,
   u.nombre,
   u.correo,
   u.rol,
   i.nombre AS institucion_del_usuario,
   u.creado AS creado_en
FROM public.usuarios u
INNER JOIN public.instituciones i ON u.id_institucion = i.id_institucion
ORDER BY u.creado DESC;