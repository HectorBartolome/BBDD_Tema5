--a
SELECT DNI FROM EMPLEADO WHERE ciudad in ('Barcelona', 'Madrid', 'Sevilla', 'Malaga') AND nomnbre not in ('Antonio', 'Luis') AND prApellido='Garcia'; 

--b
SELECT DNI FROM EMPLEADO WHERE ciudad !=('Sevilla') and ciudad in ('barcelona', 'madrid') and nombre like ('M%');

--c
SELECT DNI FROM EMPLEADO WHERE ciudad='sevilla' and ciudad not in('barcelona', 'madrid') and nombre not like ('M%'); 

--d
SELECT nombre , prApellido from Empleados where ciudad in ('Valencia', 'Vizcaya') or ciudad like ('%a') order by prApellido DESC;

--e
SELECT DNI from Empleados where ciudad='barcelona' and nombre in ('antonio', 'luis', 'ivan', 'pedro') and prApellido in ('garcia', 'carlos');

--f
SELECT nombre , prApellido from Empleados where DNI and nombre in ('rosa', 'luis', 'ramon', 'antonio') and dni like ('%4%') order by prApellido DEsC;

--g
SELECT DNI from Empleados where nombre in ('antonio') and prApellido not like ('A') and sgApellido in ('garcia','gomez','sanchez') order by sgApellido desc;

--h
SELECT DNI from Empleados where sgApellido is null;




