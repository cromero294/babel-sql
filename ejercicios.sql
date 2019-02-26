USE `ejercicio_sql`;

-- insert into fabricantes(nombre) values ("Bosch"), ("Intel"), ("Xiaomi"), ("Apple"), ("Sony");
-- insert into articulos(nombre, precio, fabricante) values
-- ("Lavadora", 500, 1),
-- ("Ordenador", 999, 2),
-- ("Nevera", 2000, 1),
-- ("Movil", 250, 3),
-- ("iPod", 450, 4),
-- ("Consola", 180, 5),
-- ("Lavadora", 100, 1),
-- ("Microprocesador", 20, 2),
-- ("Cepillo de dientes", 40, 3),
-- ("iPad pro", 1850, 4);

-- 1.1
select nombre, precio 
from articulos;

-- 1.2
select nombre 
from articulos
where precio >= 200;

-- 1.3
select *
from articulos
where precio between 60 and 120;

-- 1.4
select nombre, precio*166.386
from articulos;

-- 1.5
select avg(precio)
from articulos;

-- 1.6
select avg(precio)
from articulos
where fabricante = 2;

-- 1.7
select count(*)
from articulos
where precio >= 180;

-- 1.8
select nombre, precio
from articulos
where precio >= 180
order by precio desc, nombre asc;

-- 1.9
select * 
from articulos a
right join fabricantes f on f.codigo = a.fabricante;

-- 1.10
select a.nombre, a.precio, f.nombre
from articulos a
inner join fabricantes f on a.fabricante = f.codigo;

-- 1.11
select a.fabricante, avg(a.precio)
from articulos a
group by a.fabricante;

-- 1.12. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante. 
select f.nombre, avg(a.precio)
from fabricantes f
inner join articulos a on a.fabricante = f.codigo
group by f.codigo;

-- 1.13
select f.nombre
from fabricantes f
inner join articulos a on a.fabricante = f.codigo
group by f.nombre
having avg(a.precio) >= 150;

-- 1.14
-- select nombre, precio, min(precio)
-- from articulos a;

select nombre, precio
from articulos
order by precio
limit 1;

-- 1.15
select a.nombre, a.precio, f.nombre, max(a.precio)
from articulos a
inner join fabricantes f on f.codigo = a.fabricante
group by f.codigo;

-- 1.16
-- insert into articulos(nombre, precio, fabricante) values ("Altavoces", 70, 2);

-- 1.17
-- update articulos set nombre = "Impresora Laser" where codigo = 8;

-- 1.18
-- update articulos set precio = precio*0.9;

-- 1.19
-- update articulos set precio = precio - 10 where precio >= 120;

select *
from articulos;