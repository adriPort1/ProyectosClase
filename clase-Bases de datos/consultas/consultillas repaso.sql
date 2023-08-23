USE ciclistas;
-- nombre del directorio cuyos ciclistas han ganado alguna etapa de metas volantes

-- DIRECTOR DEL EQUIPO cuyos ciclistas no ha ganado maillot de metas volantes
SELECT DISTINCT e.director 
  FROM equipo e 
    JOIN(SELECT DISTINCT c.nomequipo 
      FROM ciclista c WHERE c.dorsal NOT IN 
        ( SELECT DISTINCT l.dorsal FROM lleva l JOIN maillot m ON l.código = m.código AND m.código='mmv')) AS c1 ;

-- obtener los datos de ciclistas que han ganado el maillot de montaña y cuantas veces cada uno, alias 
 SELECT c.nombre AS 'nombre', c.dorsal AS 'dorsal', c.edad AS 'edad'  
  FROM ciclista c WHERE c.dorsal IN(SELECT l.dorsal FROM lleva l JOIN maillot m ON l.código = m.código WHERE m.tipo='montaña');
-- resultado
  SELECT * 
    FROM ciclista c 
      JOIN (SELECT l.dorsal AS 'dorsal', COUNT(l.dorsal) AS 'num_veces' 
        FROM lleva l JOIN maillot m ON l.código = m.código AND m.código='mmo' 
          GROUP BY l.dorsal) AS c1 ON c.dorsal=c1.dorsal;