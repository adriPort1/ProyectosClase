-- para aprender join 
USE libros;
SELECT * FROM autores a;
SELECT * FROM libros l;

/**para juntar 2 tablas utiliza combinacion clausula joint
 combinacion interna, inner join (lo que hay en comun en las tablas)
 tambien hay outder join combinacion externa, que hay de izquierdas o de derechas
 habra left join,l right join, full join (son las que se ponen en vez de outder, que no hace falta)
 con que pongas join ya sabe que no es outder
 cross join 
 straigth join 
 son dos tipos mas de combinaciones
**/

-- combinacion initerna
 -- se utiliza oinner + on
 SELECT * FROM autores a JOIN libros l
 ON a.idAutor = l.idAutor;

-- inner using se usa este, los otros dos mal por viejos y en desuso
SELECT * FROM autores a JOIN libros l USING (idAutor);

-- ,+where (producto cartesiano, no usar asi)
SELECT * FROM autores a, libros l WHERE a.idAutor= l.idAutor; 

-- inner + where asi tampoco lo vamos a usar 
SELECT * FROM  autores a JOIN libros l WHERE a.idAutor=l.idAutor;

-- libros de + 500 hojas con el nombre del autor
SELECT l.*, a.nombre nombreAutor FROM libros l JOIN autores a ON l.idAutor = a.idAutor WHERE l.paginas > 500;
-- nº autores 
SELECT COUNT(a.idAutor) FROM autores a;
-- nº autores que hayan escrito libros
SELECT COUNT(DISTINCT l.idAutor) FROM libros l;

-- nº autores que no han escrito
SELECT 
  (SELECT COUNT(a.idAutor) FROM autores a) 
  - 
  (SELECT COUNT(DISTINCT l.idAutor) FROM libros l); 
-- esto es una subconsulta y se usan tanto en internas como externas

-- nombre y paginas de los libros que hayan sido escritos por autores de santander o reinos 
SELECT l.nombre, l.paginas FROM libros l JOIN autores a ON l.idAutor = a.idAutor WHERE a.poblacion IN ('santander','reinosa');
-- nombre del autor con el libro mas largo
SELECT a.nombre FROM libros l JOIN autores a ON l.idAutor = a.idAutor ORDER BY l.paginas DESC LIMIT 1;
-- lo de arriba es una ñapa, la buena es esta (la ñapa no saca bien la consulta ya que hay 2 con 800 paginas
SELECT MAX(l.paginas) maximo FROM libros l;
  SELECT a.nombre, l.paginas 
    FROM libros l 
      JOIN (SELECT MAX(l.paginas) maximo 
       FROM libros l)c1 ON c1.maximo=l.paginas 
         JOIN autores a ON l.idAutor = a.idAutor;
