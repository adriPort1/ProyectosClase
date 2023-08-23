-- combinaciones externas 2
USE noticias;

-- numero de autroes que han escrito alguna noticia 
SELECT  
  COUNT(DISTINCT n.idAutor) numero 
    FROM noticias n;
-- numero de noticias de las cuales conozco el autor
SELECT 
  COUNT(*) numero2 
    FROM  noticias n 
      WHERE n.idAutor IS NOT NULL;
 -- cuantos autores mayores de 50 años han escrito noticias
SELECT 
  COUNT(DISTINCT n.idAutor) numAutores 
    FROM noticias n 
      JOIN autores a ON n.idAutor = a.idAutor 
        WHERE a.edad>50;
 
 -- cuantas noticias han sido escritas por autores mayores de 50 años
SELECT 
  COUNT(*) numNoticias 
    FROM noticias n 
      JOIN autores a ON n.idAutor = a.idAutor 
        WHERE a.edad>50;

-- hasta ahora combinaciones internas (con ese join, inner join)

-- combinacion externa
-- numero de autroes que no han escrito noticias
SELECT 
  COUNT(*) 
    FROM autores a 
      LEFT OUTER JOIN noticias n ON a.idAutor = n.idAutor 
        WHERE n.idAutor IS NULL;
-- combinacion interna
-- autores de los autores que han escrito noticias 
SELECT DISTINCT a.* 
  FROM autores a 
    JOIN noticias n ON a.idAutor = n.idAutor;
-- combinacion externa
-- datos de los autores que no han escrito noticias 
-- izquierda
-- autores - autores(noticias)<==resta
SELECT 
  a.* 
    FROM autores a 
      LEFT JOIN noticias n ON a.idAutor = n.idAutor 
        WHERE n.idAutor IS NULL;
-- derecha
SELECT 
  a.* 
    FROM noticias n 
      RIGHT JOIN autores a ON n.idAutor = a.idAutor 
        WHERE n.idAutor IS NULL; 
-- full join
-- todas las noticias y todos los autores 
-- al lado de la noticia los datos del autore que la ha escrito
/*SELECT * FROM noticias n  FULL JOIN autores a ON n.idAutor=a.idAutor;*/
-- emulamos el full join con una union
-- left join union right join (o left join girado)
SELECT 
  * 
    FROM autores a 
      LEFT JOIN noticias n ON a.idAutor = n.idAutor 
  UNION 
SELECT 
  * 
    FROM noticias n 
      RIGHT JOIN autores a ON n.idAutor = a.idAutor;
-- con un left join invertido, colocar los campos como quieres que salgan, y luego tener cuidad si hay dos campos que se llaman igualk
