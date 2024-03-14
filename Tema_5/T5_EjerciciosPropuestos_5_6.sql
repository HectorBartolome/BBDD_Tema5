--A
SELECT dni FROM profesor_P, Departamento_D WHERE D.nombre='Informatica y Comunicaciones' AND D.CodDep=P.CodDep;
SELECT dni FROM DEPARTAMENTO JOIN PROFESOR ON D.CodDep=P.CodDep WHERE D.nombre='Informatica y Comunicaciones';
--B
SELECT NOMBRE, PRAPELLIDO FROM ALUMNO A, ALUMNOBIL B WHERE UPPER(LUGAR) IN ('MADRID','BARCELONA') AND A.DNI=B.DNI;
--C
SELECT AL.NOMBRE, AL.PRAPELLIDO, AL-SGAPELLIDO FROM ALUMNO AL, MATRICULA M, ASIGNATURA AG WHERE UPEER (AG.NOMBRE) IN ('BASES DE DATOS','ACCESO A DATOS') AND AL.DNI=M.DNI AND M.CODASIG=AG.CODASIG
--D
SELECT ALUMNO.NOMBRE, PRAPELLEIDO, SGAPELLIDO FROM ALUMNO AL, MATRICULA M, ASIGNATURA AG, CICLO C WHERE SIGLAS='DAM' AND NOTA>=5  AND AL.DNI=M.DNI AND M.CODASIG=AG.CODASIG AND AG.CODCF=C.CODCF;
--E
SELECT AG.NOMBRE FROM  ALUMNO AL JOIN MATRICULA M USING(dni)
JOIN ASIGNATURA AG USING(CODASIG)JOIN IMPORTE I USING(CODASIG)
JOIN PROFESOR P USING(dni) JOIN DEPARTAMENTO D USING(CodDep)
UNION
SELECT AG1.NOMBRE FROM ASIGNATURA AG1 JOIN CICLO C USING(CODASIG)
--WHERE NH>100 AND SIGLAS='DAM' AND CICLO.NOMBRE='INFORMATICA Y COMUNICACIONES';