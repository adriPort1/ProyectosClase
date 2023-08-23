USE piezas;
-- inner join
-- piezas en spj
-- piezas que han sido distribuidas a algun proyecto
SELECT * 
  FROM piezas p 
    JOIN spj s ON p.P = s.p;
-- con  left outer join 
-- cambia que aqui  saca mas cosas aunque no esten en la tabla con la que se junta
SELECT * 
  FROM  piezas p 
   LEFT JOIN spj s ON p.P = s.p;

SELECT * 
  FROM spj s 
    LEFT JOIN piezas p ON s.p = p.P; -- en este caso daria igual este o join normal porque todos tienen piezas asignadas

SELECT * 
  FROM spj s 
    JOIN piezas p ON s.p = p.P; -- esto es lo mismo que arriba pero por el caso dicho
    SELECT * FROM piezas p LEFT JOIN  spj s ON p.P = s.p WHERE s.p IS NULL;
-- para la practica 14 
