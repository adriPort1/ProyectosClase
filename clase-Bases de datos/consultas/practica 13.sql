USE empleados;
-- 1, mostrar registros y tablas empleado
SELECT * 
  FROM emple e;
-- 2, registros y tablas departamento 
SELECT * 
  FROM  depart d;
-- 3, apellido y oficio de empleado
SELECT e.apellido, e.oficio 
  FROM emple e;
-- 4, mostrar ,localizacion y numero de cada departamento 
SELECT d.loc, d.dnombre 
  FROM depart d;
-- 5, numero, nombre primer caracter de la localizacion de cada departamento 
SELECT d.dnombre, d.dept_no, LEFT( d.loc,1)
  FROM depart d;
-- 6, numero empleados
SELECT COUNT( e.emp_no) 
  FROM emple e;
-- 7, datos empleados ordenados por apellidos ascendente
SELECT * 
  FROM emple e 
    ORDER BY e.apellido ASC;
-- 8, datos empleados ordenados por oficio ascendente y apellido descendente
SELECT * 
  FROM emple e 
    ORDER BY e.oficio ASC, e.apellido DESC;
-- 9 numero departamentos que hay
SELECT COUNT(d.dept_no) 
  FROM  depart d; 
-- 10 numero de empleados mas el numero de departamentos
SELECT 
  (SELECT COUNT(*) FROM emple e)
  +
  (SELECT COUNT(*) FROM depart d) 
    AS cuentaEmpleados FROM dual;
-- 11 dos primeros empleados ordenados por numero y departamento descendente
SELECT  
  * 
   FROM emple e 
    ORDER BY e.emp_no ASC, e.dept_no DESC LIMIT 2;   
-- 12 empleadors ordenados por numero de departamento descendente y oficio ascendente
SELECT 
  * 
    FROM emple e 
      ORDER BY e.dept_no DESC, e.oficio ASC;
-- 13 empleados ordenados por num departamento descendente y primer caracter del apellido
SELECT 
  * 
    FROM emple e 
      ORDER BY e.dept_no DESC, LEFT(e.apellido,1) ASC;
-- 14 codigos de empleados con salario sea >2000
SELECT 
  e.emp_no 
    FROM emple e 
      WHERE e.salario>2000;
-- 15 codigos y apellidos de empleados salario menor que 2000 y no comision
SELECT 
  e.emp_no, e.apellido 
    FROM emple e 
      WHERE e.salario<2000 AND (e.comision=0 OR ISNULL(e.comision));
-- 16 mostrar datos de empleados salario entre 1500 y 2500
SELECT 
  * 
    FROM emple e 
      WHERE e.salario BETWEEN 1500 AND 2500;
-- 17 empleados oficio analista
SELECT 
  * 
    FROM emple e 
      WHERE e.oficio='analista';
-- 18 codigo empleados oficio analista y ganen mas de 2000
SELECT
 e1.* ,d1.*
  FROM (SELECT * FROM emple e WHERE oficio='analista' AND salario>2000) AS e1 
    NATURAL JOIN (SELECT * FROM depart d) AS d1;
-- 19 seleccionar el apellido y oficio de los empleados de departamento nº 20
SELECT e.apellido, e.oficio 
  FROM emple e 
    WHERE e.dept_no=20;
-- 20 contar empleados oficio vendero
SELECT COUNT(e.dept_no) 
  FROM emple e 
    WHERE e.oficio='vendedor';
-- 21 datos empleados apellidos comiencen por m o por n ordenados de forma ascendente
SELECT * 
  FROM emple e 
    WHERE e.apellido LIKE 'm%' OR  e.apellido LIKE'n%' 
      ORDER BY e.apellido ASC;
-- 22 seleccionar empleados cuyo oficio vendedor y mostrar datos ordenados por apellido de forma ascendente
SELECT * 
  FROM emple e 
    WHERE e.oficio='vendedor' 
      ORDER BY e.apellido ASC;
-- 23 apellidos del empleado que mas gana
SELECT e.apellido 
  FROM emple e 
    ORDER BY e.salario DESC LIMIT 1;
-- otra opcion, que es mas correcta: 
-- select apellido from emple where salario=(select max(salario)from emple);
-- 24 empleados cuyo departamento sea 20 y oficio analista, ordenar por apellido y oficio ascendente. con and e interseccion
SELECT e2.*,d2.* 
  FROM (SELECT * FROM emple e WHERE e.oficio='analista') AS e2 
    NATURAL JOIN (SELECT * FROM depart d WHERE d.dept_no ='20')AS d2;
-- 25 listado de distintos meses que los empleados se han dado de alta
SELECT DISTINCT MONTH(e.fecha_alt) 
  FROM emple e 
    ORDER BY MONTH(e.fecha_alt) ASC;
-- este tiene otra manera que es:
-- select distinct monthname(fecha_alt)from emple, esta es valida si pide nombbre del mes, el numero es con la de arriba
-- 26 listado de los años de alta de empleados
SELECT DISTINCT YEAR(e.fecha_alt) 
  FROM emple e 
    ORDER BY e.fecha_alt;
-- 27 listado de dias del mes de alta de empleados
SELECT DISTINCT DAYOFMONTH(e.fecha_alt) 
  FROM emple e 
    ORDER BY DAYOFMONTH(e.fecha_alt) ASC;
-- 28 apellidos de empleados tengan salario mayor que 2000 o pertenezcan al dep 20
SELECT DISTINCT e.apellido 
  FROM emple e 
    WHERE e.salario > 2000
  UNION
SELECT DISTINCT e.apellido 
  FROM emple e 
    WHERE e.dept_no=20; -- esta es la opcion de union
-- SELECT e.apellido FROM emple e WHERE e.salario>2000 OR e.dept_no=20; esta es la opcion con or