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
-- update ofertas set salario = 20000 where ciudad <> "Madrid" and salario = 0;
-- update ofertas set salario = 20000 where ciudad not in ("Madrid") and salario = 0;

-- delete from empresas where id = 1;
-- delete from empresas where id = 7;

-- select count(*) from empresas;
-- select avg(salario) from ofertas;
-- select min(salario) from ofertas;
-- select concat(nombre, " ", apellidos) as nombre_apellidos from usuarios;

-- select o.empresa_id, avg(o.salario)
-- from ofertas o 
-- group by o.empresa_id
-- having avg(o.salario) > 20000;

-- select e.nombre, avg(o.salario)
-- from ofertas o, empresas e
-- where o.empresa_id = e.id
-- group by o.empresa_id
-- having avg(o.salario) > 20000;

-- select u.nombre, u.apellidos, o.titulo
-- from ofertas o
-- left join ofertas_usuarios ou on o.id = ou.oferta_id
-- left join usuarios u on ou.usuario_id = u.id;

-- select u.nombre, u.apellidos, o.titulo
-- from ofertas o
-- right join ofertas_usuarios ou on o.id = ou.oferta_id
-- right join usuarios u on ou.usuario_id = u.id;

-- select u.nombre, u.apellidos, o.titulo
-- from ofertas o
-- inner join ofertas_usuarios ou on o.id = ou.oferta_id
-- inner join usuarios u on ou.usuario_id = u.id;

-- EJERCICIOS --

-- Obtener todas las ofertas que hay publicadas para Sevilla y Barcelona. (1)
select * 
from ofertas 
where ciudad in ("Sevilla", "Barcelona");

-- Obtener el nombre de las ofertas a las que se ha apuntado el usuario con id 3. (2)
select o.titulo 
from ofertas o 
inner join ofertas_usuarios ou on o.id = ou.oferta_id
where ou.usuario_id = 3;

-- Obtener el número total de ofertas a las que se ha apuntado el usuario con id 3. (3)
select count(*) 
from ofertas o 
inner join ofertas_usuarios ou on o.id = ou.oferta_id
where ou.usuario_id = 3;

-- Obtener el nombre de los usuarios que se han apuntado a la oferta con id 2. (4)
select u.nombre
from usuarios u 
inner join ofertas_usuarios ou on u.id = ou.usuario_id
where ou.oferta_id = 2;

-- Obtener el número total de usuarios que se han apuntado a la oferta con id 2. (5)

-- select count(*)
-- from usuarios u 
-- inner join ofertas_usuarios ou on u.id = ou.usuario_id
-- where ou.oferta_id = 2;

select count(*)
from ofertas_usuarios ou
where ou.oferta_id = 2;

-- Obtener las empresas que no han publicado ninguna oferta. (6)
select *
from empresas
where id not in (
	select o.empresa_id
	from ofertas o
	where o.publicada = '1'
);

-- Obtener los usuarios que no están apuntados en ninguna oferta. (7)
select *
from usuarios
where id not in (
	select distinct(ou.id)
    from ofertas_usuarios ou
);

-- Obtener las empresas que han publicado más de 3 ofertas. (8)
select e.nombre, count(*) as numero
from empresas e
inner join ofertas o on o.empresa_id = e.id
group by e.id
having numero > 3;

select * from empresas e 
where (
	select count(*) from ofertas o where o.empresa_id = e.id
) > 3;

-- Obtener los usuarios que se han apuntado a más de 3 ofertas. (9)
select u.nombre, count(*) as numero_ofertas
from usuarios u
inner join ofertas_usuarios ou on ou.usuario_id = u.id
group by u.id
having numero_ofertas > 1;

select *
from usuarios
where (
	select count(*)
    from ofertas_usuarios ou
    where ou.usuario_id = u.id
) > 3;

-- Obtener las ofertas con el número de usuarios que hay apuntados ordenadas por mayor número de apuntados. (10)
select o.titulo, count(*) as numero_apuntados
from ofertas o
inner join ofertas_usuarios ou on ou.oferta_id = o.id
group by o.id
order by numero_apuntados desc;
