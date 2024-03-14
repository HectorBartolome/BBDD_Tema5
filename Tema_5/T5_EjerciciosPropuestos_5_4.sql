--a
SELECT MAX (precio) FROM libro;

--b
SELECT MIN (precio) FROM libro;

--c
SELECT MIN (fecha_ent) FROM edita WHERE Tecnico.dni=443042293; SELECT fecha_sal FROM edita WHERE Tecnico.dni=443042293 order by fecha_sal ASC AND rownum=1;

--d
SELECT MAX (fecha_sal) FROM edita WHERE Tecnico.dni=29110302;SELECT fecha_sal FROM edita WHERE Tecnico.dni=443042293 order by fecha_sal DESC and rownum=1;

--e
SELECT MAX (NumPag) from libro where tematica = upper ('Novela'); 

--f
SELECT MIN (NumPag) from libro WHERE tematica in ('Infantil','Cientifica','Novela','Comico'); 

--g
SELECT COUNT (precio) FROM libro where tematica='Cientifico' and precio between 5 and 15;




