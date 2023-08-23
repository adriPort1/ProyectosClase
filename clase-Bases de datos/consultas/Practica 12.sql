-- practica 12
-- STRAIGHT_JOIN es para obligar a que saque esa tabla, sino puede que lo haga a la inversa si es más rapido
USE ciclistas;
-- 1.1
-- edad y nombre de ganadores de etapas
SELECT DISTINCT c.nombre, c.edad                    
  FROM ciclista c                                        
     JOIN etapa e                       
      ON c.dorsal = e.dorsal                
        ORDER BY c.edad;                              
-- 1.2 
-- edad y nombre de ganadores de puertos 
SELECT DISTINCT c.nombre, c.edad 
  FROM ciclista c 
    JOIN puerto p 
      ON c.dorsal = p.dorsal 
        ORDER BY c.edad;
-- 1.3
-- nombre y edad de ciclistas que han ganado puertos y etapas
SELECT  DISTINCT c.nombre, c.edad  
  FROM ciclista c 
    JOIN etapa e 
      ON c.dorsal = e.dorsal 
        JOIN puerto p 
          ON c.dorsal = p.dorsal 
            ORDER BY c.edad;
-- 1.4
-- listar director que tengan ciclistas que hayan ganado alguna etapa
SELECT DISTINCT e.director, e.nomequipo 
  FROM equipo e 
    JOIN ciclista c 
      ON e.nomequipo = c.nomequipo 
        JOIN etapa e1 
          ON c.dorsal = e1.dorsal;
-- 1.5
-- dorsal y nombre de ciclistas maillot  
SELECT  DISTINCT c.nombre, c.dorsal 
  FROM ciclista c 
    JOIN lleva l 
      ON c.dorsal = l.dorsal;
-- 1.6
-- dorsal y nombre ciclistas maillot amarillo
SELECT DISTINCT c.nombre, c.dorsal 
  FROM ciclista c 
    JOIN lleva l 
      ON c.dorsal = l.dorsal 
        JOIN maillot m 
          ON l.código = m.código 
            WHERE m.color='amarillo';
-- 1.7
-- dorsal dorsal ciclistas algun maillot y ganado etapas
SELECT DISTINCT l.dorsal
  FROM lleva l 
    JOIN etapa e 
      ON l.dorsal = e.dorsal;
-- 1.8 
-- numetapa y km etapas puertos
SELECT DISTINCT e.numetapa, e.kms 
  FROM etapa e 
    JOIN puerto p 
      ON e.numetapa = p.numetapa;
-- 1.9
-- indicar km etapas ganado ciclistas banesto y tengan puertos
SELECT DISTINCT e.kms 
  FROM  etapa e 
    JOIN ciclista c ON e.dorsal = c.dorsal 
        JOIN puerto p ON e.numetapa = p.numetapa
            WHERE c.nomequipo='Banesto';
-- 1.10 
-- listar ciclistas ganado algun puerto
SELECT COUNT( DISTINCT e.dorsal) AS numero 
  FROM  etapa e 
    JOIN puerto p 
      ON e.numetapa = p.numetapa;
-- 1.11
-- indicar nombre de los puertos ganados por ciclistas banesto
SELECT p.nompuerto 
  FROM puerto p 
    JOIN ciclista c 
      ON p.dorsal = c.dorsal 
        WHERE c.nomequipo = 'Banesto';
-- interseccion de la practica 13, teoria
-- operador de conjuntos
-- natural join, necesita que sean los mismos campos para unirlos 
-- consulta dorsal de los ciclistas que han ganado etapas
SELECT 
  DISTINCT e.dorsal 
    FROM etapa e;   -- subconsulta etapas c1
SELECT 
  DISTINCT p.dorsal 
    FROM  puerto p; -- subconsulta puertos c2

-- SELECT 
--  DISTINCT e.dorsal 
--    FROM etapa e 
--     INTERSECT 
-- SELECT 
--   DISTINCT p.dorsal 
--     FROM  puerto p;

SELECT c1.* 
  FROM (SELECT DISTINCT e.dorsal FROM etapa e) c1 
    NATURAL JOIN 
       ( SELECT DISTINCT p.dorsal FROM puerto p) c2 ;
-- se realiza con natural join, ya que intersect no existe aqui ( y en ningun lado)
-- interseccion, union, resta y division
-- nosotros usamos combinacion porque somos unos gallos de corral to buenos
-- operador conjuntos union, que hayan ganado etapas o puertos
SELECT e.dorsal FROM etapa e UNION SELECT p.dorsal FROM puerto p; -- con all te incluyen los duplicados, ya que de por si no los repite
