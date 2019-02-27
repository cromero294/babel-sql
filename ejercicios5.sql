USE `ejercicio5_sql`;

-- 5.1. Mostrar el DNI, nombre y apellidos de todos los directores. 
select dni, nomApels
from directores;

-- 5.2. Mostrar los datos de los directores que no tienen jefes. 
select *
from directores
where dniJefe is null;

-- 5.3. Mostrar el nombre y apellidos de cada director, junto con la capacidad del despacho en el que se encuentra. 
select dir.nomApels, d.capacidad
from directores dir
inner join despachos d on dir.despacho = d.numero;

-- 5.4. Mostrar el número de directores que hay en cada despacho. 
select d.numero, count(*)
from despachos d
inner join directores dir on dir.despacho = d.numero
group by d.numero;

-- 5.5. Mostrar los datos de los directores cuyos jefes no tienen jefes.
select *
from directores d
inner join directores d2 on d.dniJefe = d2.dni
where d2.dniJefe is null;

-- 5.6. Mostrar los nombres y apellidos de los directores junto con los de su jefe. 
select d1.nomApels, d2.nomApels as nombre_jefe
from directores d1
inner join directores d2 on d1.dniJefe = d2.dni;

-- 5.7. Mostrar el número de despachos que estén sobreutilizados. 

-- 5.8. Añadir un nuevo director llamado Paco Pérez, DNI 28301700, sin jefe, y situado en el despacho 124. 
insert into directores(dni, nomApels, despacho) values ('Paco Pérez', '28301700', 124);

-- 5.9. Asignar a todos los empleados apellidados Pérez un nuevo jefe con DNI 74568521. 
update directores set dniJefe = '74568521' where nomApel = 'Pérez';

-- 5.10. Despedir a todos los directores, excepto a los que no tienen jefe.
delete from directores 
where dni not in (
	select dni
    from directores
    where dniJefe is not null
);