package funciones.de.texto;

import javax.swing.JOptionPane;
/*  -- TEORIA --
todos los arrays por definicion comienzan en 0
ejemplo Santander = [0]S[1]a[2]n[3]t[4]a[5]n[6]d[7]e[8]r
*/
public class FuncionesDeTexto {
    public static void main(String[] args) {
       //empezando();
       // vocales();
       //numerCuenta();
       //invertirTexto();
       //SinEspacios();
       //contraseña();
       Laboral();
    }
    public static void empezando(){
     String palabra = JOptionPane.showInputDialog("Introduce una palabra");
        System.out.println(palabra.length());
        palabra = palabra.toLowerCase();
        for (int i=0;i<palabra.length();i++){
            System.out.print(palabra.charAt(i));
        }
    }
public static void vocales(){
     String palabra = JOptionPane.showInputDialog("Introduce una palabra");
     int cuentavocales=0;
     char c;
     for (int i =0;i<palabra.length();i++){
         c=palabra.charAt(i);
      if (c=='a'|| c=='e'||c=='i'
         ||c=='o'||c=='u'){
          cuentavocales++;
      }
     }
        System.out.println(cuentavocales);
    }
public static void numerCuenta(){
       String palabra =JOptionPane.showInputDialog("Esbribe el numero de cuenta");
    while (palabra.length() != 20){
       palabra = JOptionPane.showInputDialog("Ese no es el tamaño del numero de cuenta");
   }
        System.out.println(palabra);
        System.out.println("Entidad financiera: "+ palabra.substring(0, 4));
        System.out.println("Oficina financiera: "+ palabra.subSequence(4, 8));
        System.out.println("codigo de control: "+ palabra.substring(8, 10));
        System.out.println("numero de cuenta del banco: "+ palabra.substring(10, 20));
   }
public static void invertirTexto(){
     String palabra=JOptionPane.showInputDialog("Escribe un texto para invertir");
     int largo = palabra.length();
     for (int i=largo-1;i>=0;i--){          // hay que meter el -1 para que pille la posicion ya que empieza desde 0, y por lo tanto lo que se escriba empezara desde 0 (hola la h es el 0)
       System.out.print(palabra.charAt(i)); //también se puede meter aqui en vez de arriba, solo cascara porque intentara acceder a un caracter que no existe,
                                            //por eso no saldra ni lo que este bien, ojo con eso 
     }
  }
public static void SinEspacios(){
  String palabra=JOptionPane.showInputDialog("Cadena de texto con espacios, se devolverá sin ellos");
     System.out.println(palabra.replace(" ", ""));   
 } 
public static void contraseña(){
    String palabra=JOptionPane.showInputDialog("crea una contraseña");
    int contador =0;
     String palabraIntento;
    do {
    palabraIntento=JOptionPane.showInputDialog("escribe la contraseña");
    contador++;
    }while(contador <3 && !palabraIntento.equals(palabra));
    if (palabraIntento.equals(palabra))System.out.println("Enhorabuena");
    else System.out.println("Fallaste");
        }
public static void Laboral(){
     String palabra=JOptionPane.showInputDialog("Escribe un dia");
    switch (palabra){
        case "lunes","martes","miercoles","jueves","viernes" -> System.out.println("laboral");
        case "sabado", "domingo" -> System.out.println("no laboral");
        default -> System.out.println("dia incorrecto");
    } 
  }
}