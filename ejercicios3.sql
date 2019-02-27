USE `ejercicio3_sql`;

insert into almacenes(codigo, lugar, capacidad) values
(1, 'Madrid', 4), (2, 'Sevilla', 2), (3, 'Segovia', 5), (4, 'Murcia', 1);

insert into cajas(NumReferencia, contenido, valor, almacen) values
('BINN', 'Papeleras', 500, 1),
('CART', 'Cartulinas', 50, 2),
('PAPL', 'Papel', 200, 2),
('BBIN', 'Papeleras', 500, 2),
('ROTU', 'Rotuladores', 75, 3),
('APPL', 'Papel', 200, 4),
('HHHH', 'Lapices', 25, 3);

-- 3.1
select *
from almacenes;

-- 3.2
select *
from cajas
where valor > 150;

-- 3.3
select distinct(contenido)
from cajas;

-- 3.4
select avg(valor)
from cajas;

-- 3.5
select a.codigo, avg(c.valor)
from almacenes a
inner join cajas c on c.almacen = a.codigo
group by a.codigo;

-- 3.6
select a.codigo, avg(c.valor)
from almacenes a
inner join cajas c on a.codigo = c.almacen
group by a.codigo
having avg(c.valor) > 150;

-- 3.7
select c.NumReferencia, a.lugar
from cajas c
inner join almacenes a on c.almacen = a.codigo;

-- 3.8
select a.codigo, count(*)
from cajas c
inner join almacenes a on c.almacen = a.codigo
group by a.codigo;

-- 3.9
select x.codigo
from (
	select al.codigo, count(*) as num_cajas
	from cajas c
	inner join almacenes al on c.almacen = al.codigo
	group by al.codigo
) as x, almacenes a
where x.codigo = a.codigo and num_cajas > a.capacidad;

-- 3.10
select c.NumReferencia
from cajas c
inner join almacenes a on c.almacen = a.codigo
where a.lugar = 'Bilbao';

-- 3.11
insert into almacenes(codigo, lugar, capacidad) values (5, 'Barcelona', 3);

-- 3.12
insert into cajas(NumReferencia, contenido, valor, almacen) values ('H5RT', 'Papel', 200, 2);

-- 3.13
update cajas set valor = valor * 0.85;

-- 3.14
update cajas set valor = valor * 0.80 where valor > (select avg(valor) from cajas);

-- 3.15
delete from cajas where valor < 100;

-- 3.16
delete from almacenes where codigo in(
	select x.codigo
	from (
		select al.codigo, count(*) as num_cajas
		from cajas c
		inner join almacenes al on c.almacen = al.codigo
		group by al.codigo
	) as x, almacenes a
	where num_cajas >= a.capacidad
);