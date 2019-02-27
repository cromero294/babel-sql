USE `ejercicio2_sql`;

insert into departamentos (codigo, nombre, presupuesto) values
(1, "it", 300), (2, "rrhh", 400), (3, "desarollo", 600), (4, "marketing", 100);

insert into empleados (dni, nombre, apellidos, departamento) values
(1, "juan", "lopez", 1), (2, "pepe", "fernandez", 2), (3, "marcos", "sanchez", 3), (4, "gonzalo", "alonso", 4) ,(5, "maria", "fernandez", 1);

insert into empleados (dni, nombre, apellidos, departamento) values
(6, "lucia", "perez", 3);

-- 2.1
select apellidos
from empleados;

-- 2.2
select distinct(apellidos)
from empleados;

-- 2.3
select *
from empleados
where apellidos = 'López';

-- 2.4
select *
from empleados
where apellidos in ('López', 'Pérez');

-- 2.5
select *
from empleados
where departamento = 14;

-- 2.6
select *
from empleados
where departamento = 37 and departamento = 77;

-- 2.7
select *
from empleados
where nombre like 'P%';

-- 2.9
select sum(presupuesto)
from departamentos;

-- 2.10
select *
from empleados e
inner join departamentos d on e.departamento = d.codigo;

-- 2.11
select concat(e.nombre, " ", e.apellidos), d.nombre, d.presupuesto
from empleados e
inner join departamentos d on d.codigo = e.departamento;

-- 2.12
select e.nombre, e.apellidos
from empleados e
inner join departamentos d on d.codigo = e.departamento
where d.presupuesto > 60000;

-- 2.13
select *
from departamentos
where presupuesto > (
	select avg(presupuesto)
    from departamentos
);

-- 2.14
select d.codigo, count(*) as numero_empleados
from departamentos d
inner join empleados e on e.departamento = d.codigo
group by d.codigo
having numero_empleados >= 2;

-- 2.15
insert into departamentos(codigo, nombre, presupuesto) values (11, 'Calidad', 40000); 
insert into empleados(dni, nombre, apellidos, departamento) values ('89267109', 'Esther', 'Vázquez', 11);

-- 2.19. Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000 €. 2.20. Despedir a todos los empleados.

-- 2.16
update departamentos set presupuesto = 0.9*presupuesto;

-- 2.17
update empleados set departamento = 14 where departamento = 77;

-- 2.18
delete from empleados where departamento = 14;

-- 2.19
delete from empleados where dni in (
	select dni
    from empleados e
    inner join departamentos d on e.departamento = d.codigo
    where d.presupuesto > 60000
);

-- 2.20
delete from empleados;