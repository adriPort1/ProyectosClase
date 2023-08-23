USE empleados2023;
-- practica 18
-- ejercicio 1
SELECT e.nombre 
  FROM empleado e 
    WHERE e.id_departamento 
      IN (SELECT d.id FROM departamento d WHERE d.nombre = 'sistemas');
-- ejercicio 2
SELECT  d.presupuesto, d.nombre 
  FROM departamento d 
    WHERE d.presupuesto>=
      ALL(SELECT  d.presupuesto FROM departamento d);
-- ejercicio 3
SELECT d.presupuesto, d.nombre 
  FROM departamento d 
     WHERE d.presupuesto<=  
     ALL(SELECT  d.presupuesto FROM departamento d);
-- ejercicio 4
SELECT d.nombre 
  FROM departamento d
    WHERE d.id = 
      ANY(SELECT e.id_departamento FROM empleado e);
-- EJERCICIO 5 
SELECT * 
  FROM departamento d 
    WHERE d.id <> 
      ALL(SELECT DISTINCT e.id_departamento FROM empleado e WHERE e.id_departamento IS NOT NULL);
-- ejercicio 6
SELECT d.nombre 
  FROM departamento d 
    WHERE d.id 
      IN (SELECT e.id_departamento FROM empleado e);
-- ejercicio 7
SELECT d.nombre 
  FROM departamento d 
    WHERE d.id 
      NOT IN (SELECT e.id_departamento FROM empleado e WHERE e.id_departamento IS NOT NULL);
-- ejercicio 8
SELECT d.nombre 
  FROM departamento d 
    WHERE EXISTS (SELECT 1 FROM empleado e WHERE d.id=e.id_departamento);
 -- ejercicio 9
 SELECT d.nombre 
  FROM departamento d 
    WHERE NOT EXISTS (SELECT 1 FROM empleado e WHERE d.id=e.id_departamento);