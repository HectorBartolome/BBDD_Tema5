CREATE TABLE productos (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  precio  NUMBER(6,2) NOT NULL,
  id_fabricante NUMBER(3) NOT NULL,
  FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id)
);


CREATE TABLE fabricante (
  id NUMBER(3) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL
);

INSERT INTO productos VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO productos VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO productos VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO productos VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO productos VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO productos VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO productos VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO productos VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO productos VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO productos VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO productos VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

--Consultas
--a
SELECT NOMBRE FROM PRODUCTOS;
--b
SELECT NOMBRE AS "NOMBRE PRODUCTO", PRECIO AS "EUROS" FROM PRODUCTOS;
--c
SELECT UPPER(NOMBRE), UPPER(PRECIO) FROM PRODUCTOS;
--d
SELECT LOWER(NOMBRE), LOWER(PRECIO) FROM PRODUCTOS;
--e
SELECT NOMBRE, ROUND(PRECIO) FROM PRODUCTOS;
--f
SELECT NOMBRE, TRUNC(PRECIO) FROM PRODUCTOS;
--g
SELECT F.id FROM fabricante F, PRODUCTOS P WHERE F.ID=P.ID;
--h
SELECT DISTINCT(F.id) FROM fabricante F, PRODUCTOS P WHERE F.ID=P.ID;
--i
SELECT nombre FROM fabricante ORDER BY nombre ASC;
--j
SELECT nombre, precio FROM productos ORDER BY precio DESC LIMIT 1;
--k
SELECT nombre FROM productos WHERE precio >= 400;
--l
SELECT nombre FROM productos WHERE precio < 400;
--m
SELECT nombre FROM productos WHERE precio >= 80 AND precio <= 300;
--n
SELECT nombre FROM productos WHERE precio BETWEEN 60 AND 200;
--o
SELECT nombre FROM productos WHERE precio > 200 AND id_fabricante = 6;
--p
SELECT nombre FROM productos WHERE id_fabricante IN (1, 3, 5);
--q
SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';
--r
SELECT nombre FROM fabricante WHERE nombre LIKE '%e';
--s
SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';

----Consulta mutitabla (INTERNA)
--1)
SELECT p.nombre, p.precio, f.nombre FROM productos p JOIN fabricante f ON p.id_fabricante = f.id;
--2)
SELECT p.nombre , p.precio , f.nombre FROM productos p JOIN fabricante f ON p.id_fabricante = f.id ORDER BY f.nombre;
--3)
SELECT p.id , p.nombre ,p.id_fabricante ,f.nombre FROM productos p JOIN fabricante f ON p.id_fabricante = f.id;
--4)
SELECT p.nombre, p.precio, f.nombre FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE p.precio = (SELECT MIN(precio) FROM productos);
--5)
SELECT p.nombre, p.precio, f.nombre FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE p.precio = (SELECT MAX(precio) FROM productos);
--6)
SELECT p.nombre,p.precio,f.nombre FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Lenovo';
--7)
SELECT * FROM productos WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Crucial')AND precio > 200;
--8)
SELECT p.* FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Asus'OR f.nombre = 'Hewlett-Packard'OR f.nombre = 'Seagate';
--9)
SELECT p.* FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
--10)
SELECT p.nombre, p.precio FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE '%e';
--11)
SELECT p.nombre, p.precio FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre LIKE '%w%';
--12)
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;


----Consulta mutitabla(EXTERNA)
--A
SELECT f.id, f.nombre , p.id, p.nombre , p.precio FROM fabricante f LEFT JOIN productos p ON f.id = p.id_fabricante ORDER BY f.id, p.id;
--B
SELECT f.id, f.nombre FROM fabricante f WHERE f.id NOT IN (SELECT id_fabricante FROM productos);
--C
Si, aquellos que el id_fabricante no exista.

--Consulta resumen
--1)
SELECT COUNT(id) FROM productos
--2)
SELECT COUNT(DISTINCT id_fabricante) FROM productos;
--3)
SELECT AVG(precio) FROM productos;
--4)
SELECT MIN(precio) FROM productos;
--5)
SELECT nombre, precio FROM productos WHERE precio = (SELECT MAX(precio) FROM productos);
--6)
SELECT SUM(precio) FROM productos;
--7)
SELECT COUNT(*) FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Asus';
--8)
SELECT AVG(precio) FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Asus';
--9)
SELECT MIN(precio) FROM productos pJOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Asus';
--10)
SELECT MAX(precio) FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Asus';
--11)
SELECT SUM(precio) FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Asus';
--12)
SELECT MAX(precio),MIN(precio),AVG(precio),COUNT(*) FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE f.nombre = 'Crucial';
--13)
SELECT f.nombre, COUNT(p.id) FROM fabricante f LEFT JOIN productos p ON f.id = p.id_fabricante GROUP BY f.nombre ORDER BY total_productos DESC;
--14)
SELECT f.nombre,MAX(p.precio),MIN(p.precio),AVG(p.precio) FROM fabricante f LEFT JOIN productos p ON f.id = p.id_fabricante GROUP BY f.nombre;
--15)
SELECT p.id_fabricante, MAX(p.precio) precio_maximo, MIN(p.precio) precio_minimo, AVG(p.precio) precio_medio, COUNT(*) total_productos FROM productos p JOIN fabricante f ON p.id_fabricante = f.idGROUP BY p.id_fabricante HAVING AVG(p.precio) > 200;
--16)
SELECT f.nombre, MAX(p.precio) precio_maximo, MIN(p.precio) precio_minimo, AVG(p.precio) precio_medio, COUNT(*) total_productos FROM productos p JOIN fabricante f ON p.id_fabricante = f;
--17)
SELECT COUNT(*) FROM productos WHERE precio >= 180;
--18)
SELECT f.nombre, COUNT(*) FROM productos p JOIN fabricante f ON p.id_fabricante = f.id WHERE p.precio >= 180 GROUP BY f.nombre;
--19)
SELECT id_fabricante, AVG(precio) FROM productos GROUP BY id_fabricante;
--20)
SELECT f.nombre, AVG(p.precio) FROM productos p JOIN fabricante f ON p.id_fabricante = f.id GROUP BY f.nombre;
--21)
SELECT f.nombre FROM productos p JOIN fabricante f ON p.id_fabricante = f.id GROUP BY f.nombre HAVING AVG(p.precio) >= 150;
--22)
SELECT f.nombre FROM fabricante f JOIN productos p ON f.id = p.id_fabricante GROUP BY f.id HAVING COUNT(*) >= 2;


--Subconsulta (En la clausula WHERE)
--1
SELECT * FROM PRODUCTO, FRABRICANTE WHERE ID_fabricantes =( SELECT 
FABRICANTE.ID FROM FABRICANTE WHERE  NOMBRE='LENOVO');
--2
--3
SELECT nombre FROM productos WHERE PRECIO = (
    SELECT max(precio) FROM PRODUCTOS WHERE id_fabricante = (
      SELECT ID FROM fabricante WHERE NOMBRE='Lenovo'))
AND id_fabricante = (SELECT ID FROM fabricante WHERE NOMBRE='Lenovo');
--4
SELECT nombre FROM productos WHERE PRECIO = (
    SELECT min(precio) FROM PRODUCTOS WHERE id_fabricante = (
      SELECT ID FROM fabricante WHERE NOMBRE='Hewlett-Packard'))
AND id_fabricante = (SELECT ID FROM fabricante WHERE NOMBRE='Hewlett-Packard');
--5
SELECT nombre FROM productos WHERE PRECIO >= (
    SELECT max(precio) FROM PRODUCTOs WHERE id_fabricante = (
      SELECT ID FROM fabricante WHERE NOMBRE='Lenovo'));
--6
SELECT nombre,precio FROM productos WHERE PRECIO > (
    SELECT avg(precio) FROM PRODUCTOs WHERE id_fabricante = (
      SELECT ID FROM fabricante WHERE NOMBRE='Asus'))
AND id_fabricante = (SELECT ID FROM fabricante WHERE NOMBRE='Asus');

--Subconsultas con ALL y ANY
--7
SELECT * FROM PRODUCTOS WHERE PRECIO >= ALL (SELECT PRECIO FROM PRODUCTOS)
--8
SELECT * FROM PRODUCTOS WHERE PRECIO <= ALL (SELECT PRECIO FROM PRODUCTOS)
--9
SELECT nombre from fabricante where id = ANY (SELECT id_fabricante from productos);
--10
SELECT nombre from fabricante where id <> ANY (SELECT id_fabricante from productos);

--Subconsultas con IN y NOT IN
--11
SELECT nombre 
from fabricante
where fabricantes.id 
IN (SELECT id_fabricante from productos);
--12
SELECT nombre 
from fabricante
where fabricantes.id 
not IN (SELECT id_fabricante from productos);   

--Subconsultas con EXISTS y NOT EXISTS
--13
SELECT nombre 
from fabricantes
where fabricantes.id 
IN (SELECT id_fabricante from productos) and EXISTS ((select id from fabricante where id=5));
--14
SELECT nombre 
from fabricantes
where fabricantes.id 
not IN (SELECT id_fabricante from productos) and EXISTS ((select id from fabricante where id=5));

--Subconsultas correlacionadas
--15
SELECT p.nombre, p.fabricante, p.precio
from fabricante f, productos p 
where  f.id = p.id_fabricante
and p.precio =(select max(precio) from productos p2
where f.id=p2.id_fabricante);
--16
SELECT p.nombre
from productos P, fabricante f
where f.id = p.id_fabricante
and p.precio >=(select AVG(precio) from productos p2
where f.id=p2.id_fabricante);
--17

SELECT p.precio, p.nombre,  f.nombre
FROM productos p, fabricante f
WHERE f.id = p.id_fabricante 
and p.precio =(select max(precio) from productos p2
where f.id=p2.id_fabricante and f.NOMBRE='Lenovo');

--Subconsultas HAVING
--18
SELECT f.nombre
FROM productos p, fabricantes f
WHERE id_fabricante != (SELECT id_fabricante FROM fabricantes WHERE f.nombre = 'Lenovo')
GROUP BY id_fabricante
HAVING COUNT(*) = (
    SELECT COUNT(*) FROM productos WHERE id_fabricante = (SELECT id FROM fabricantes WHERE f.nombre = 'Lenovo')
);

SELECT count(*),f.nombres 
FROM productos p, fabricante f
WHERE f.id = p.id_fabricante 
GROUP BY p.nombre 
HAVING ;