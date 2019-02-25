USE `babel-curso-mysql`;



-- INSERT INTO `curso-mysql`.empresas (nombre)
-- VALUES ("Babel");

-- INSERT INTO empresas (nombre)
-- VALUES ("Cabify");

-- INSERT INTO empresas (nombre)
-- VALUES ("Uber"), ("Delivero"), ("Job And Talent");

-- INSERT INTO usuarios (nombre, apellidos, usuario, password) VALUES
-- ("Charly", "Falco", "falco", "1234"),
-- ("Mike", "Kozinsky", "koz", "1111"),
-- ("Bud", "Spencer", "bud", "bud"),
-- ("Charlie", "Callahan", "charlie", "callahan"),
-- ("Chuck", "Norris", "rangerthetexassexy", "niconordenadorcuanticolaaciertas");

-- INSERT INTO empresas
-- VALUES (7, "Toggl");

-- INSERT INTO ofertas (titulo, descripcion, salario, ciudad, empresa_id) VALUES
-- ("Ruby Software Engineer", "Descripción Ruby Software Engineer", 43000, "Madrid", 3),
-- ("iOS Engineer", "Descripción iOS Engineer", 30000, "Madrid", 3),
-- ("Elixir Software Engineer", "Descripción Elixir Software Engineer", 44000, "Madrid", 3),
-- ("Product Manager", "Descripción Product Manager", 83000, "Madrid", 3),
-- ("Programadores Java", "Descripción Programadores Java", 0, "Sevilla", 1),
-- ("Referente técnico Frontend", "Descripción Referente técnico Frontend", 0, "Madrid", 1),
-- ("Estudiante de Ingeniería Informática", "Descripción Estudiante de Ingeniería Informática", 0, "Barcelona", 1),
-- ("Business Analyst junior", "Descripción Business Analyst junior", 0, "Madrid", 2),
-- ("Senior Android Developer (Mobile)", "Descripción Senior Android Developer (Mobile)", 40000, "Madrid", 2);


-- INSERT INTO ofertas_usuarios (oferta_id, usuario_id)
-- VALUES (1, 1), (2, 1), (1, 2), (4, 2), (5, 4), (3, 4), (7, 5), (8, 5), (9, 5);


-- SELECT e.nombre AS Nombre FROM empresas e;

-- SELECT o.titulo, o.salario FROM ofertas o
-- WHERE o.salario = 0;

-- SELECT * FROM ofertas o
-- WHERE o.titulo LIKE "%Engineer%";

-- SELECT * FROM ofertas o
-- WHERE o.titulo LIKE "Ruby%";

-- SELECT * FROM ofertas o
-- WHERE o.titulo LIKE "%a";


-- SELECT * FROM usuarios LIMIT 3;


-- SELECT o.salario FROM ofertas o;
-- SELECT DISTINCT(o.salario) FROM ofertas o;

-- SELECT o.titulo FROM ofertas o
-- WHERE o.salario >= 30000 AND o.salario <= 40000;

-- SELECT o.titulo FROM ofertas o
-- WHERE o.salario NOT BETWEEN 30000 AND 40000;



-- SELECT nombre, apellidos FROM usuarios
-- WHERE id = 1 OR id = 3 OR id = 4;

-- SELECT nombre, apellidos FROM usuarios
-- WHERE id IN (1, 3, 4);


-- SELECT nombre FROM empresas
-- WHERE id IN (
-- 	SELECT DISTINCT(empresa_id) FROM ofertas
-- 	WHERE salario > 35000
-- );

-- SELECT nombre FROM empresas
-- WHERE EXISTS (
-- 	SELECT * FROM ofertas
-- 	WHERE publicada = 0
-- );

-- SELECT * FROM ofertas
-- ORDER BY salario DESC, ciudad, titulo DESC;

-- PRIMERA OFERTA DE SALARIO 0 ORDENADA DE FORMA DESCENDENTE (SEVILLA)
-- SELECT * FROM ofertas
-- WHERE salario = 0
-- ORDER BY ciudad DESC;

-- UPDATE ofertas
-- SET ciudad = "Remota"
-- WHERE id = 8;


-- UPDATE ofertas
-- SET ciudad = "Madrid", publicada = 0
-- WHERE id = 8;

-- CAMBIAR SALARIO A 20000 DE AQUELLAS QUE SON FUERA DE MADRID Y TIENEN SALARIO 0
update ofertas set salario = 20000 where ciudad <> "Madrid" and salario = 0;