package maquinadechuches;

import java.util.Scanner;
import javax.swing.JOptionPane;
// metodo clase
public class MaquinaDeChuches {
    public static String[][] nombresGolosinas = {
      {"KitKat", "Chicles de fresa", "Lacasitos", "Palotes"},
      {"Kinder Bueno", "Bolsa variada Haribo", "Chetoos", "Twix"},
      {"Kinder Bueno", "M&M'S", "Papa Delta", "Chicles de menta"},
      {"Lacasitos", "Crunch", "Milkybar", "KitKat"}
 }; 
    public static double[][] precio = {
      {1.1, 0.8, 1.5, 0.9},
      {1.8, 1, 1.2, 1},
      {1.8, 1.3, 1.2, 0.8},
      {1.5, 1.1, 1.1, 1.1}
};
     public static int [][] unidades = {
      {5,5,5,5},
      {5,5,5,5},
      {5,5,5,5},
      {5,5,5,5}
};
    
    public static void main(String[] args) {
     int opcion;
     String a;
     Scanner sc2;
    do {
    System.out.println();
    System.out.println("Escoge una de las opciones:");
    System.out.println("Escrbir 1 para pedir golosina si conoces el catalogo");
    System.out.println("Escrbir 2 para conocer las golosinas que tenemos");
    System.out.println("Escribir 3 si eres el tecnico");
    System.out.println("Escribir 4 para apagar");    
    sc2 = new Scanner(System.in);    
    opcion= sc2.nextInt();
    
    switch (opcion) {
    case 1:
           a=JOptionPane.showInputDialog("indica la golosina con el formato 00");
           compraChuche(a);
        break;
    case 2:
            catalogo();
        break;
    case 3:
            a=JOptionPane.showInputDialog("Si eres el tecnico, escribe la contraseña");
            tecnico(a);
        break;
    }
    }while(opcion!=4);
  }
    public static void tecnico(String a){
        
        if(!a.equals("MaquinaExpendedora2017")){
            System.out.println("mentiste o te equivocaste");
        } else{
           rellenar(pedirFila(),pedirColumna() );
        }
    }
    public static void rellenar(int f, int c){
        Scanner b;
        int cantidad;
        for(int i=0;i<unidades.length;i++){
            for (int j=0;j<unidades[0].length;j++){
                if(unidades[i][j]==unidades[f][c]){
                    System.out.println("que cantidad?");
                    b=new Scanner(System.in);
                    cantidad=b.nextInt();
                    unidades[i][j]=unidades[i][j]+cantidad;
                }    
                }       
            }
              
    }
    public static int pedirFila(){
        Scanner b;
        int fila;
        System.out.println("Escribe la fila del producto que quieres rellenar: ");
            b=new Scanner(System.in);
            fila=b.nextInt();
            return fila;
    }
    public static int pedirColumna(){
        Scanner b;
        int columna;
        System.out.println("Escribe la columna: ");
         b=new Scanner(System.in);
         columna=b.nextInt();
         return columna;
    }
    public static void catalogo(){
        for(int i=0;i<nombresGolosinas.length;i++){
            for (int j=0;j<nombresGolosinas[0].length;j++){
                System.out.print(nombresGolosinas[i][j]+" numero:"+" "+i+j+" y quedan: "+unidades[i][j] +" unidades"+" || ");
            }
            System.out.println();
        }
    }
    public static void compraChuche  (String a){
        int num1= Integer.parseInt(a.substring(0, 1));
        int num2= Integer.parseInt(a.substring(1, 2));
        for(int i=0;i<nombresGolosinas.length;i++){
            for (int j=0;j<nombresGolosinas[0].length;j++){
                if(i==num1&&j==num2){
                    System.out.print(nombresGolosinas[i][j]);
                    System.out.println(" y vale "+precio[i][j]);
                    unidades[i][j]=unidades[i][j]-1;
                    System.out.println(unidades[i][j]);
                }
            }
        }
    }
}