INSERT INTO usuarios (
    id_institucion,
    nombre,
    correo,
    contrasena,
    telefono,
    rol,
    creado
)
VALUES
(
    1,
    'Delmi del Carmen Valladares',
    'delmi.valladares@ickw.edu.sv',
    '123456',
    '70000001',
    'Directora',
    CURRENT_DATE
),
(
    1,
    'Diana Marisol Albarenga de Lara',
    'diana.albarenga@ickw.edu.sv',
    '123456',
    '70000002',
    'Docente',
    CURRENT_DATE
),
(
    1,
    'Criseyda Guadalupe Araujo Melgar',
    'criseyda.araujo@ickw.edu.sv',
    '123456',
    '70000003',
    'Docente',
    CURRENT_DATE
),
(
    1,
    'Marlon Stanley Idalgo',
    'marlon.idalgo@ickw.edu.sv',
    '123456',
    '70000004',
    'Subdirector',
    CURRENT_DATE
),
(
    1,
    'Merlin Liset Duran',
    'merlin.duran@ickw.edu.sv',
    '123456',
    '70000005',
    'Docente',
    CURRENT_DATE
);




SELECT * FROM usuarios;

SELECT * 
FROM usuarios;


SELECT nombre, correo, telefono, rol
FROM usuarios
WHERE rol = 'Docente';


SELECT id_usuario, nombre, correo, rol
FROM usuarios
WHERE nombre ILIKE '%Diana%';


SELECT nombre, correo, rol
FROM usuarios
WHERE rol IN ('Directora', 'Subdirector');


INSERT INTO usuarios (
    id_institucion,
    nombre,
    correo,
    contrasena,
    telefono,
    rol,
    creado
)
VALUES
(
    1,
    'Cristina Castellanos',
    'cristina.castellanos@ickw.edu.sv',
    '123456',
    '70000009',
    'Subdirectora',
    CURRENT_DATE
),
(
    1,
    'Elvin Saul Vazques',
    'elvin.vazques@ickw.edu.sv',
    '123456',
    '70000010',
    'Docente',
    CURRENT_DATE
),
(
    1,
    'Wilfredo Mercado',
    'wilfredo.mercado@ickw.edu.sv',
    '123456',
    '70000011',
    'Docente',
    CURRENT_DATE
);





SELECT * FROM usuarios;




SELECT COUNT(*) AS total_docentes
FROM usuarios
WHERE rol = 'Docente';