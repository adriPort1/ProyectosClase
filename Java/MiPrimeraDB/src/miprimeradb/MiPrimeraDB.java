package miprimeradb;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Set;

public class MiPrimeraDB {

    public static Connection conn=null;
    public static Statement stmt;
    public static ResultSet rs;
    public static String url ="jdbc:mysql://localhost:3306/ciclistas";
    public static String user="root";
    public static String password ="";
    
    public static void main(String[] args) {
        // TODO code application logic here
        //ejempliInicial();
        //directoresEquipo();
        ejercicioArrays();
        //probandoClase();
    }
    
    public static void probandoClase(){
        /**
         * Este ejercicio era para probar con objetos, la clase creadad y sus metodos
         */
        ganadoresEtapa etapa1, etapa2, etapa3;
        etapa1= new ganadoresEtapa();
        etapa1.setNombre("indurain");
        etapa1.setLlegada("Santander");
        etapa1.setSalida("Palencia");
        System.out.println(etapa1.toString());
        
        etapa2= new ganadoresEtapa();
        etapa2.setNombre("Manuel");
        etapa2.setLlegada("Burgos");
        etapa2.setSalida("Palencia");
        System.out.println(etapa2.toString());
        
        etapa3= new ganadoresEtapa();
        etapa3.setNombre("Delgado");
        etapa3.setLlegada("Madrid");
        etapa3.setSalida("Toledo");
        System.out.println(etapa3.toString());
    }
       /** las lineas comentadas con // son partes del ejercicio sustituidas, 
       * hemos usado de primer metodo, array multidimensional, con strings para rellenar
       * en el segundo metodo, hemos usado una clase propia creada con sus metodos, un objeto,
       * y usamos colections y iterator para ordenar e imprimir llamando a la funcion
       * imprimir que hemos creado para el 1 previamente.
       * Todo el codigo esta seguido para no crear objetos ni llenarlo de funciones, 
       * ya que se ha copiado y pegado para el tema de la 
       * conexion en aplicacion, netbeans java, y mysql
       */
    public static void ejercicioArrays(){
        // primer try & catch para que pille los drivers
     try{
            Class.forName("com.mysql.jdbc.Driver");
     }catch(ClassNotFoundException e){
        System.out.println("Fallo al importar el driver");
    }
        
        try{
        conn = DriverManager.getConnection(url,user,password);
        stmt = conn.createStatement();
        rs= stmt.executeQuery("SELECT COUNT(numEtapa) AS todos FROM etapa");
        int ganadores;
        rs.next();
        ganadores = rs.getInt("todos");
        System.out.println(ganadores);
        rs= stmt.executeQuery("SELECT c.nombre, e.salida, e.llegada FROM ciclista c JOIN etapa e ON c.dorsal = e.dorsal");
      // String nls [][][]= new String [ganadores][ganadores][ganadores];
     
      ArrayList <String> ganadoresE = new ArrayList <String>(ganadores);
        ganadoresEtapa gE;
        gE= new ganadoresEtapa();
        //String nombre, salida, llegada;
        //int iterador=0;
        while(rs.next()){
        gE.setNombre(rs.getString("c.nombre"));
        gE.setLlegada(rs.getString("e.llegada"));
        gE.setSalida(rs.getString("e.salida"));
        ganadoresE.add(gE.toString());
        //nls[iterador][iterador][iterador]= nombre +", "+ salida +", "+ llegada;
        //iterador++;
        }
       Collections.sort(ganadoresE);
       Iterator <String> im= ganadoresE.iterator();
       imprimir(im);
        /*for (int i=0;i<ganadores;i++){
            System.out.println("nombre del ciclista, salida y llegada de la etapa "+(i+1));
            System.out.println(nls[i][i][i]);
            System.out.println();
        }*/
        rs.close();
        stmt.close();
        
    } catch (SQLException e){
        System.out.println("Fallo en la conexion");
        /** finaly para ejecutar el cierre si no se cerró**/
    } finally{
        if(conn != null){
          try{
              conn.close();
          }catch (SQLException e){
              System.out.println("Fallo al cerrar la conxion");
          }
        }
    }
    }
       /**
       * try & catch para la conexion, crear el statement y pedir la consulta en query
       * a partir del string nombre es el ejercicio en si, manejando la consulta que fuese necesaria
       * con el while añadimos al arraylist los directores
       * debajo collections para ordenar, iterador para recorrer el array 
       * y la funcion imprimir para imprimir.
       */
    public static void directoresEquipo(){
        // primer try & catch para que pille los drivers
        try{
        Class.forName("com.mysql.jdbc.Driver");
    }catch(ClassNotFoundException e){
        System.out.println("Fallo al importar el driver");
    }
         try{
        conn = DriverManager.getConnection(url,user,password);
        stmt = conn.createStatement();
        rs= stmt.executeQuery("SELECT director, nomequipo FROM equipo");
        String nombre;
        ArrayList <String> nomDirector = new ArrayList<>() ;
        while(rs.next()){
            nombre=rs.getString("director");
            nomDirector.add(nombre);
        }
        Collections.sort(nomDirector);
        Iterator <String> num= nomDirector.iterator();
        imprimir(num);
        rs.close();
        stmt.close();
        
    } catch (SQLException e){
        System.out.println("Fallo en la conexion");
        /** finaly para ejecutar el cierre si no se cerró**/
    } finally{
        if(conn != null){
          try{
              conn.close();
          }catch (SQLException e){
              System.out.println("Fallo al cerrar la conxion");
          }
        }
    }
    }
    public static  void imprimir (Iterator b){
     while(b.hasNext()){
            System.out.println(b.next()+ ", ");       
        }
    }
    
    public static void ejempliInicial(){
        // importar el driver
        
    try{
        Class.forName("com.mysql.jdbc.Driver");
    }catch(ClassNotFoundException e){
        System.out.println("Fallo al importar el driver");
    }
    
    try{
        conn = DriverManager.getConnection(url,user,password);
        stmt = conn.createStatement();
        rs= stmt.executeQuery("SELECT nombre, edad FROM ciclista");
        while(rs.next()){
            String nombre;
            nombre=rs.getString("nombre");
            int edad= rs.getInt("edad");
            System.out.println("El ciclista "+ nombre+" tiene una edad de "+ edad);
        }
        rs.close();
        stmt.close();
    } catch (SQLException e){
        System.out.println("Fallo en la conexion");
    } finally{
        if(conn != null){
          try{
              conn.close();
          }catch (SQLException e){
              System.out.println("Fallo al cerrar la conxion");
          }
        }
    }
    }
    
}
 