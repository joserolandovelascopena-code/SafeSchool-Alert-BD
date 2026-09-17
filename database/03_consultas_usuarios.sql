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