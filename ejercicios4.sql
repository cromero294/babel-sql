USE `ejercicio4_sql`;

insert into peliculas(codigo, nombre, calificacionEdad) values
(1, 'Jumanji', 'Para todos los públicos'),
(2, 'Jumanji 2', 'Para todos los públicos'),
(3, 'Inside out', 'Para todos los públicos'),
(4, 'Frozen', 'Para todos los públicos'),
(5, 'Spiderman', 'Para todos los públicos'),
(6, 'Enemy', 'No recomendables para menores de 18 años');

insert into peliculas(codigo, nombre) values
(10, 'Blade runner'),
(11, 'The clockwork orange'),
(12, 'El juego de Ender'),
(13, 'El señor de los anillos'),
(14, 'Dunkirk'),
(15, 'Origen');

insert into salas(codigo, nombre, pelicula) values
(1, 'Sala 1', 3),
(2, 'Sala 2', 10),
(3, 'Sala 3', 13),
(4, 'Sala 4', 5),
(5, 'Sala 5', 15);

-- 4.1
select distinct(calificacionEdad)
from peliculas;

-- 4.2
select *
from peliculas
where calificacionEdad is NULL;

-- 4.3
select *
from salas s
left join peliculas p on p.codigo=s.pelicula;

-- 4.4
select *
from salas s
right join peliculas p on p.codigo=s.pelicula;

-- 4.5
select p.nombre
from peliculas p
where p.codigo not in (
	select p.codigo
    from peliculas p
    inner join salas s on s.pelicula = p.codigo
);

-- 4.6
insert into peliculas(codigo, nombre, calificacionEdad) values (10, 'Uno, Dos, Tres', 7);

-- 4.7
update peliculas set calificacionEdad = 'No recomendables para menores de 13 años' where calificacionEdad is null;

-- 4.8

