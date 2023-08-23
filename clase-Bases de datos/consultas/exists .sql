USE piezas;
-- operador exists
-- para hacer resta e interseccion
-- consultas correlacionadas para join, natural join e in 
-- piezas que han sido distribuidas
SELECT DISTINCT p.nomp, p.P
   FROM piezas p 
    JOIN spj s ON p.P = s.p;
-- utilizando subconsulta
-- c1 
-- piezas que han sido distribuidas 
SELECT DISTINCT s.p 
  FROM spj s;
-- c1 y piezas
SELECT DISTINCT p.P, p.nomp 
  FROM  piezas p 
    JOIN (SELECT DISTINCT s.p FROM spj s) c1 
      USING (P);
-- piezasa in c1
SELECT DISTINCT p.P, p.nomp 
  FROM piezas p 
    WHERE p.P 
      IN (SELECT DISTINCT s.p FROM spj s);
-- exists, consultas correlacoinadas
-- exists con c1
-- este seria como una interseccion
SELECT p.P, p.nomp 
  FROM piezas p 
    WHERE EXISTS (SELECT 1 FROM spj s WHERE p.P=s.p);
-- no exists
-- codigo y nombre  piezas que no han sido distribuidas
SELECT DISTINCT p.P, p.nomp 
  FROM  piezas p 
    LEFT JOIN spj s ON p.P = s.p 
      WHERE s.p IS NULL;
-- utilizando subconsultas 
-- piezas que hna sido distribuidas
SELECT DISTINCT s.p 
  FROM  spj s;
-- piezas left join c1
SELECT DISTINCT p.P, p.nomp 
  FROM piezas p 
    LEFT JOIN (SELECT DISTINCT s.p FROM spj s) c1 
      USING (P) 
        WHERE c1.p IS NULL;
SELECT p.P, p.nomp 
  FROM piezas p 
    WHERE p.P 
      NOT IN (SELECT DISTINCT s.p FROM spj s);
-- consultas correlacionadas 
-- not exists
SELECT p.P, p.nomp 
  FROM piezas p 
    WHERE NOT EXISTS (SELECT 1 FROM spj s WHERE s.p= p.P); -- falta de completar, toca recreo 