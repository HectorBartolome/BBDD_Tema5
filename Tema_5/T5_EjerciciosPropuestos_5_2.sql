CREATE TABLE DEPARTAMENTO(
    Clave_Depto NUMBER (1) NOT NULL,
    Nombre VARCHAR (30) NOT NULL,
    Presupuestos NUMBER (5) NOT NULL,
    CONSTRAINT PK_DEPARTAMENTO PRIMARY KEY (Clave_Depto)
);
CREATE TABLE EMPLEADOS(
    Clave_empleado VARCHAR (5) NOT NULL,
    Nombre VARCHAR (30) NOT NULL,
    Apellidos VARCHAR (30) NOT NULL,
    Clave_Depto NUMBER (1) NOT NULL,
    CONSTRAINT PK_EMPLEADOS PRIMARY KEY (Clave_empleado),
    CONSTRAINT FK_DEPARTAMENTO FOREIGN KEY (Clave_Depto) REFERENCES DEPARTAMENTO (Clave_Depto)
);

CREATE SEQUENCE SEQ_DEPARTAMENTO START WITH 1 INCREMENT BY 1 MAXVALUE 999 NOCYCLE;

INSERT INTO DEPARTAMENTO (Clave_Depto, Nombre, Presupuestos) VALUES (SEQ_DEPARTAMENTO.NEXTVAL, 'Personal', 80000);
INSERT INTO DEPARTAMENTO (Clave_Depto, Nombre, Presupuestos) VALUES (SEQ_DEPARTAMENTO.NEXTVAL, 'Almacen', 70000);
INSERT INTO DEPARTAMENTO (Clave_Depto, Nombre, Presupuestos) VALUES (SEQ_DEPARTAMENTO.NEXTVAL, 'Contabilidad', 60000);
INSERT INTO DEPARTAMENTO (Clave_Depto, Nombre, Presupuestos) VALUES (SEQ_DEPARTAMENTO.NEXTVAL, 'Manufactura', 50000);
INSERT INTO DEPARTAMENTO (Clave_Depto, Nombre, Presupuestos) VALUES (SEQ_DEPARTAMENTO.NEXTVAL, 'Empaque', 30000);


INSERT INTO EMPLEADOS (Clave_empleado, Nombre, Apellidos, Clave_Depto ) VALUES ('EMP01', 'Armando', 'Lopez', 2);
INSERT INTO EMPLEADOS (Clave_empleado, Nombre, Apellidos, Clave_Depto ) VALUES ('EMP02', 'Tatiana', 'Vargas', 1);
INSERT INTO EMPLEADOS (Clave_empleado, Nombre, Apellidos, Clave_Depto ) VALUES ('EMP03', 'Laura', 'Garcia', 3);
INSERT INTO EMPLEADOS (Clave_empleado, Nombre, Apellidos, Clave_Depto ) VALUES ('EMP04', 'Juan', 'Perez', 4);
INSERT INTO EMPLEADOS (Clave_empleado, Nombre, Apellidos, Clave_Depto ) VALUES ('EMP05', 'Ivan', 'Lopez', 4);
INSERT INTO EMPLEADOS (Clave_empleado, Nombre, Apellidos, Clave_Depto ) VALUES ('EMP06', 'MArgarita', 'Hernandez', 1);
INSERT INTO EMPLEADOS (Clave_empleado, Nombre, Apellidos, Clave_Depto ) VALUES ('EMP07', 'Jesus', 'Perez', 3);
INSERT INTO EMPLEADOS (Clave_empleado, Nombre, Apellidos, Clave_Depto ) VALUES ('EMP08', 'Toño', 'Flores', 2);
INSERT INTO EMPLEADOS (Clave_empleado, Nombre, Apellidos, Clave_Depto ) VALUES ('EMP09', 'Juan', 'Lopez', 4);
INSERT INTO EMPLEADOS (Clave_empleado, Nombre, Apellidos, Clave_Depto ) VALUES ('EMP10', 'Jose', 'Hernandez', 5);

--A
SELECT Nombre, Apellidos FROM EMPLEADOS;

--B
SELECT DISTINCT Apellidos FROM EMPLEADOS;

--C
SELECT * FROM EMPLEADOS WHERE Apellidos='Lopez';

--D
SELECT EMPLEADOS.Nombre, EMPLEADOS.Apellidos, DEPARTAMENTO.nombre FROM EMPLEADOS, DEPARTAMENTO WHERE empleados.clave_depto = departamento.clave_depto and EMPLEADOS.Nombre LIKE ('%a') AND EMPLEADOS.clave_depto=Departamento.clave_depto;

--E
SELECT * from Empleados wehere where apellidos='Lopez' or APELLIDOS='Perez';

--F
SELECT empleados.nombre, empleados.clave_empleado from empleados WHERE clave_depto=4;

--G
SELECT nombre, apellidos from empleados where apellidos like ('H%');

--H
SELECT * from departamento where Presupuestos BETWEEN 50000 and 70000;

--I
SELECT empleados.nombre, empleados.apellidos, departamento.nombre from empleados, departamento where empleados.clave_depto=departamento.clave_depto and lower(departamento.nombre)='contabilidad';

--J
SELECT empleados.nombre as "nombre_empleado", empleados.apellidos, departamento.nombre as "nombre_departamento" from empleados , departamento where empleados.clave_depto=departamento.clave_depto;

--K
SELECT COUNT (EMPLEADOS.Clave_Depto) FROM empleados , departamento where empleados.clave_depto=departamento.clave_depto AND DEPARTAMENTO.NOMBRE='Contabilida';

--L
SELECT count (*) from empleados, departamento where empleados.clave_depto=departamento.clave_depto AND empleados.nombre like ('J%') and departamento.nombre='Manufactura';