package pkg3enrayaycifrados;
// hacer cifrado cesar, cifrado Vigenère 
import java.util.Arrays;
import javax.swing.JOptionPane;

public class Main {
     public static void main(String[] args) {
         tresEnRaya();
    }
    
     public static void tresEnRaya(){
          // variables de jugador
          String jugador1;
          String jugador2="";
        // primer bucle, para controlar que escojan X o O
         do {
            jugador1=JOptionPane.showInputDialog("Jugador 1, escoge si quieres ser X o O");
        }while (!jugador1.equals("X") && !jugador1.equals("O"));
         // definir y mostrar a cada jugador que le pertenece
        if (jugador1.equals("X")){
            System.out.println("Jugador 1, eres la "+jugador1+" jugador 2, eres el O");
            jugador2="O";
        }
        else if(jugador1.equals("O")){
            System.out.println("Jugador 1, eres la "+jugador1+" jugador 2,  eres la X");
            jugador2="X";
        }
        // array tablero, para mostrar el tablero de juego
        char tablero[][]= new char [3][3];
        System.out.println("tablero de juego: ");
        // rellenar el tablero con guiones
        for(int i=0;i<3;i++){
           for(int j=0;j<3;j++){
               tablero[i][j]='-';
               System.out.print(tablero[i][j]);
               System.out.print(" ");
           }
            System.out.println(" ");
        }
      // variables fuera de bucle, seran las opciones que escojan en fila y columna
      // con sus int para pasarlas
        String op1,op2,op3,op4;
        int opc1,opc2,opc3,opc4;
        int contador=0;
      // bucle grande para que el juego se repita
       do{ 
           // mensaje para aclarar que tablero se usa
             System.out.println(".................................");
          // bucles para controlar que escojan numeros del 1 al 3
           do{
          op1=JOptionPane.showInputDialog("jugador 1, dime donde colocas (la fila de 1 al 3)");
          op2=JOptionPane.showInputDialog("Ahora la columna, tambien del 1 al 3");
          opc1=Integer.parseInt(op1)-1;
          opc2=Integer.parseInt(op2)-1;
          }while(opc1>2||opc2>2||opc1<0||opc2<0);
           // while por si esta relleno ya o no
            while(comprobarOcupado(tablero,opc1,opc2)&&!comprobar(tablero,opc1,opc2)&&opc1>3&&opc2>3&&opc1<1&&opc2<1){
                    if (comprobarOcupado(tablero,opc1,opc2))  System.out.println("esta ocupado, escoge otra vez");
                    System.out.println("Esa casilla ya esta ocupada");
                    op1=JOptionPane.showInputDialog("jugador 1, dime donde colocas (la fila de 1 al 3)");
                    op2=JOptionPane.showInputDialog("Ahora la columna, tambien del 1 al 3");
                    opc1=Integer.parseInt(op1)-1;
                    opc2=Integer.parseInt(op2)-1;

            }
           //for para cambiar la matriz, con un do en medio para controlar que escoja numero pequeño del 1 al 3
          // tambien lo usamos para mostrar tablero
          for(int i=0;i<3;i++){
           for(int j=0;j<3;j++){
                   tablero[opc1][opc2]=jugador1.charAt(0);
                   System.out.print(tablero[i][j]);
                   System.out.print(" ");
           }
            System.out.println(" "); 
        }
           System.out.println(".................................");
           contador++;
         // bucles para controlar que escojan numeros del 1 al 3
         if (contador<9 && !comprobarfila(tablero) && !comprobarcolumna(tablero) && !comprobarDiagonal(tablero) && !comprbarInvertida(tablero)){
         do{
          op3=JOptionPane.showInputDialog("jugador 2, dime donde colocas (la fila de 1 al 3)");
          op4=JOptionPane.showInputDialog("Ahora la columna, tambien del 1 al 3");
          opc3=Integer.parseInt(op3)-1;
          opc4=Integer.parseInt(op4)-1;
          }while(opc3>2||opc4>2||opc3<0||opc4<0);
          // controlamos que este 
          while(comprobarOcupado(tablero,opc3,opc4)&&!comprobar(tablero,opc3,opc4)&&opc1>3&&opc2>3&&opc1<1&&opc2<1){
                    if (comprobarOcupado(tablero,opc3,opc4))  System.out.println("esta ocupado, escoge otra vez");
                    System.out.println("Esa casilla ya esta ocupada");
                    op3=JOptionPane.showInputDialog("jugador 2, dime donde colocas (la fila de 1 al 3)");
                    op4=JOptionPane.showInputDialog("Ahora la columna, tambien del 1 al 3");
                    opc3=Integer.parseInt(op1)-1;
                    opc4=Integer.parseInt(op2)-1;
                }
           
           //for para cambiar la matriz, con un do en medio para controlar que escoja numero pequeño del 1 al 3
          // tambien lo usamos para mostrar tablero (jugador 2)
          tablero[opc3][opc4]=jugador2.charAt(0);    
          for(int i=0;i<3;i++){
           for(int j=0;j<3;j++){      
                 System.out.print(tablero[i][j]);
                 System.out.print(" ");
           }
            System.out.println(" "); 
            }
          contador++;
           }
        }while(contador<9 && !comprobarfila(tablero) && !comprobarcolumna(tablero) && !comprobarDiagonal(tablero) && !comprbarInvertida(tablero));
       
    //---------------------------------------------------------------------------------------------------------------------------------------------//
       if (contador>=9) System.out.println("Acabó la partida");
       if(comprobarfila(tablero)||comprobarcolumna(tablero)||comprobarDiagonal(tablero)||comprbarInvertida(tablero)) System.out.println("Tres en raya");
    }
     // funcion 1 para controlar que haya o no guiones
     public static boolean comprobar(char a[][],int b, int c){
                 if(a[b][c]=='-') return true;
         return false;
     }
     public static boolean comprobarOcupado(char a[][], int b, int c){
         if (a[b][c]=='X'||a[b][c]=='O');
         return false;
     }
     public static boolean comprobar2(char a[][],int b, int c){
         if(a[b][c]=='X') return true;
         if(a[b][c]=='O') return true;
         return false;
     }
     // funcion para comprobar fila, por si hay 3 en raya
public static boolean comprobarfila (char a[][]){
    int contador1=0,contador2=0;
    for(int j=0;j<a.length;j++){
        for(int i=0;i<a[0].length;i++){
          if(a[i][j]=='X') contador1++;
          if(a[i][j]=='O') contador2++;
        }
        if(contador1==3||contador2==3){
            return true;
        }else{
            contador1=0;
            contador2=0;
        }
    }
    return false;
    }
 // funcion para comprobar columna, por si hay 3 en raya
public static boolean comprobarcolumna(char a[][]){
    int contador1=0,contador2=0;
    for(int i=0;i<a.length;i++){
        for(int j=0;j<a[0].length;j++){
          if(a[i][j]=='X') contador1++;
          if(a[i][j]=='O') contador2++;
        }
        if(contador1==3||contador2==3){
        return true;
        } else {
            contador1=0;
            contador2=0;
        }
    }
    return false;
}
 // funcion para comprobar diagonal, por si hay 3 en raya
public static boolean comprobarDiagonal(char a[][]){
    int contador1=0, contador2=0;
    for(int i=0;i<a.length;i++){
        if(a[i][i]=='X') contador1++;
        if (a[i][i]=='O')contador2++;
    }
    if (contador1==3) return true;
    if (contador2==3) return true;
   return false;
    }
     // funcion para comprobar diagonal invertida , por si hay 3 en raya
public static boolean comprbarInvertida(char a [][]){
    int contador1=0,contador2=0;
    for(int i=0;i<a.length;i++){
            if (a[i][2-i]=='X')contador1++;
            if (a[i][2-i]=='O') contador2++;
    }
    if (contador1==3) return true;
    if (contador2==3) return true;
    return false;
    }
}
