package matricesbidimensionales;

import java.util.Arrays;
import java.util.Scanner;
import javax.swing.JOptionPane;
import static matricesbidimensionales.MatricesBidimensionales.ordenamatriz;

public class MatricesBidimensionales {

    public static void main(String[] args) {
        //tablaMultiplicar();
        //alumNota();
        //alpelandia();
        //DosMatrices();
        //MatrizAcabada();
        //MatrizDiagonal();
        //generarMatriz();
        //heridoMuerto();
        //filaColumna();
        //fusionaEnteros();
        //matriz3d ();
        mayorColumnaPrimero();
    }

    public static void tablaMultiplicar() {
        int[][] matriz = new int[10][10];
        // primer for para recorrer la primera variale
        for (int i = 0; i < matriz.length; i++) {
            // segundo for para recorrer la segunda variable 
            // tambien lo usaremos para imprimir
            for (int j = 0; j < matriz.length; j++) {
                matriz[i][j] = (i + 1) * (j + 1);
                System.out.printf("%3d", matriz[i][j]);
                System.out.print(" ");
            }
            System.out.println();
        }
    }
    public static void alumNota() {
        String alumno;
        int notas[][] = new int[10][10];
        for (int i = 0; i < 10; i++) {
            alumno = JOptionPane.showInputDialog("Escribe el nombre del alumno");
            String.valueOf(i);
            for (int j = 0; j < 1; j++) {
                notas[i][j] = (int) (Math.random() * 11);
                System.out.println(alumno + (" tiene un ") + notas[i][j]);
            }
        }
    }

    public static void alpelandia() {
        double temperatura[][] = new double[12][30];
        for (int i = 0; i < 12; i++) {
            for (int j = 0; j < 30; j++) {
                temperatura[i][j] = (int) (Math.random() * 35);
            }
        }
        Scanner entrada;
        int mes;
        do {
            System.out.println("introduce un numero para indicar el mes");
            entrada = new Scanner(System.in);
            mes = entrada.nextInt() - 1;
        } while (mes < 1 || mes > 12);
        System.out.println("Las temperaturas del mes han sido:");
        for (int i = 0; i < 30; i++) {
            System.out.printf("Dia " + (i + 1) + ": " + "%.2f %n", temperatura[mes][i]);
        }
    }

    public static void DosMatrices() {
        System.out.println("Escribe el numero del tamaño de la matriz");
        Scanner entrada = new Scanner(System.in);
        int num = entrada.nextInt();
        int matriz[][] = new int[num][num];
        int matriz2[][] = new int[num][num];
        int suma[][] = new int[num][num];
        System.out.println("Martiz 1: ");
        for (int i = 0; i < num; i++) {
            for (int j = 0; j < num; j++) {
                matriz[i][j] = (int) (Math.random() * 100 + 1);
                System.out.print(matriz[i][j] + " ");
            }
            System.out.println();
        }
        System.out.println("Matriz 2:");
        for (int i = 0; i < num; i++) {
            for (int j = 0; j < num; j++) {
                matriz2[i][j] = (int) (Math.random() * 100 + 1);
                System.out.print(matriz2[i][j] + " ");
            }
            System.out.println();
        }
        System.out.println("La Suma es: ");
        for (int i = 0; i < num; i++) {
            for (int j = 0; j < num; j++) {
                suma[i][j] = matriz[i][j] + matriz2[i][j];
                System.out.print(suma[i][j] + " ");
            }
            System.out.println();
        }
    }

    public static void MatrizAcabada() {
        System.out.println("Escribe el tamaño de la matriz");
        Scanner entrada = new Scanner(System.in);
        int num = entrada.nextInt();
        int Matriz[] = new int[num];
        int terminacion;
        int matrizNum[];
        int contador1 = 0;
        do {
            System.out.println("escribe la terminacion del numero que quiras sacar (del 0 al 9)");
            entrada = new Scanner(System.in);
            terminacion = entrada.nextInt();
        } while (terminacion < 0 || terminacion > 9);

        for (int i = 0; i < num; i++) {
            Matriz[i] = (int) (Math.random() * 300 + 1);
            if (terminacion == Matriz[i] % 10) {
                contador1++;
            }
        }

        System.out.println();
        matrizNum = new int[contador1];
        for (int i = 0; i < Matriz.length; i++) {
            if (terminacion == Matriz[i] % 10) {
                matrizNum[contador1 - 1] = Matriz[i];
                contador1--;
            }
        }
        System.out.println(Arrays.toString(Matriz));
        System.out.println(Arrays.toString(matrizNum));
    }

    public static void MatrizDiagonal() {
        int matriz[][] = new int[4][4];
        boolean chachi = false;
        int opcion = 0, suma, fila = 0, columna = 0;
        double media;
        int inversa=matriz.length-1;
        //       int pedir;    usar esta variable cuando use el metodo de pedir para rellenar, que ahora esta comentado para las pruebas 
        Scanner entrada;
        while (opcion != 7) {
            System.out.println("Elige una opcion:");
            System.out.println("1: Rellena la matriz 4 x 4");
            System.out.println("2: Rellena la matriz 4 x 4");
            System.out.println("3: Rellena la matriz 4 x 4");
            System.out.println("4: Rellena la matriz 4 x 4");
            System.out.println("5: Rellena la matriz 4 x 4");
            System.out.println("6: Rellena la matriz 4 x 4");
            System.out.println("7: Salir");
            entrada = new Scanner(System.in);
            opcion = entrada.nextInt();
            switch (opcion) {
                case 1:
                    for (int i = 0; i < 4; i++) {
                        for (int j = 0; j < 4; j++) {
                            /*                              System.out.println("Escoge el numero de la matriz posicion: " + (i + 1) + ", " + (j + 1));
                            entrada = new Scanner(System.in);
                            pedir = entrada.nextInt();
                            matriz[i][j] = pedir; 
metodo hecho para rellenar la matriz con numeros pedidos por teclado al usuario  */
                            matriz[i][j] = (int) (Math.random() * 100 + 1);
                        }
                    }
                    chachi = true;
                    System.out.println(Arrays.deepToString(matriz));
                    break;
                case 2:
                    if (chachi == true) {
                        do {
                            System.out.println("Escoge la fila a sumar del 1 al 4");
                            entrada = new Scanner(System.in);
                            fila = entrada.nextInt();
                        } while (fila < 1 || fila > 4);
                        suma = 0;
                        fila = fila - 1;
                        for (int i = 0; i < 4; i++) {
                            suma += matriz[fila][i];
                        }
                        System.out.println("La suma de la fila " + (1 + fila) + " es: " + suma);
                    } else {
                        System.out.println("Debes rellenar la matriz primero");
                    }
                    break;
                case 3:
                    if (chachi == true) {
                        do {
                            System.out.println("Escoge la columna a sumar del 1 al 4");
                            entrada = new Scanner(System.in);
                            columna = entrada.nextInt();
                        } while (columna < 1 || columna > 4);
                        suma = 0;
                        columna = columna - 1;
                        for (int i = 0; i < 4; i++) {
                            suma += matriz[i][columna];
                        }
                        System.out.println("La suma de la columna " + (columna + 1) + " es: " + suma);
                    } else {
                        System.out.println("Debes rellenar la matriz primero");
                    }
                    break;
                case 4:
                    if (chachi == true) {
                        suma = 0;
                        for (int i = 0; i < 4; i++) {
                            suma += matriz[i][i];
                        }
                        System.out.println("La suma de la diagonal principal es: " + suma);
                    } else {
                        System.out.println("Tienes que rellenar la matriz primero");
                    }
                    break;
                case 5:
                    if (chachi == true) {
                        System.out.println("la suma de la diagonal inversa da: ");
                        suma = 0;
                        for (int i = 0; i < 4; i++) {
                            suma = matriz[i][inversa];
                            inversa--;
                        }
                        System.out.println("La suma de la diagonal inversa es: " + suma);
                    } else {
                        System.out.println("Tienes que rellenar la matriz primero");
                    }
                    break;
                case 6:
                    if (chachi == true) {
                        suma = 0;
                        for (int i = 0; i < 4; i++) {
                            for (int j = 0; j < 4; j++) {
                                suma += matriz[i][j];
                            }
                        }
                       media=(double) suma/16;
                        System.out.println("la madie de la matriz es: " + media);
                    } else {
                        System.out.println("Debes rellenar la matriz primero");
                    }
                    break;
            }
        }
    }
  // generar matriz de 3 x 3 con num aleatorios si repetirse
  // realizar la comprobacion con una funcion externa
    public static void generarMatriz(){
        int matriz[][]=new int [3][3];
        int n;
        for(int i=0;i<3;i++){
            for(int j=0;j<3;j++){
               n=(int)(Math.random()*20+1);
               if (comprobarArray(matriz,n)) j--;
               else matriz[i][j]=n;
            }
        }
        System.out.println(Arrays.deepToString(matriz));
    }
    public static boolean comprobarArray(int[][]a, int n){
          for (int i=0;i<a.length;i++){
              for (int j=0;j<a[i].length;j++){
                  if (n==a[i][j]) return    true; 
              }
          }
        return false;
        /*modelo 2 qui a parte de pasarle la matriz y n, hay que pasarle la variable distintos
        creada acumular los numeros que sean diferentes
        int contador=0, fila=0,columna=0;
        while (contador<distintos && fila<3){
        columna=0;
        while(contador<distintos&& columna<3){
        contador++;
        if (m[fila][columna]==n)return true;
        aqui falta el else
        }
        }
        */
    }
public static boolean matrizCuadrada(int [][]a){
        if (a.length==a[0].length) return true;
        else return false;
    }

// generar un numero de 4 cifras aleatorio, e ir preguntando que adivine.
// si el numero esta es herido, y si esta y en la posicion un muerto
// el juego acaba cuando acierta los 4 numeros y sus posiciones
public static void heridoMuerto(){
    int n = 0;
    String comparanum;
    int contadorH,contadorM,contadorIntentos=0;
    do{
    n =(int)(Math.random()*8999+1000);
    }while(!numDistinto(n));
    comparanum=String.valueOf(n);
    System.out.println(n);
    String numero;
    do{
     numero=JOptionPane.showInputDialog("introduce un numero de 4 digitos, si desea no participar, escriba exit en minuscula");
     contadorM=0;
     contadorH=0;
     while(numero.length()!=4){
        numero=JOptionPane.showInputDialog("no es valido, escribe otra vez");
     }
        for(int i=0;i<4;i++){
            if(comparanum.charAt(i)==numero.charAt(i))contadorM++;
            else if(comparanum.charAt(i)==numero.charAt(0)||comparanum.charAt(i)==numero.charAt(1)||comparanum.charAt(i)==numero.charAt(2)||comparanum.charAt(i)==numero.charAt(3)) contadorH++;     
        }
        System.out.println(contadorH+" herido/s y "+contadorM+" muerto/s ");
        contadorIntentos++;
    }while(contadorM<4&&!numero.toLowerCase().equals("exit"));
    if (numero.equals("exit"))System.out.println("Saliste del juego");
    if(contadorM==4) System.out.println("acertaste el numero "+n+" con "+contadorIntentos+" veces. ");
}
public static boolean numDistinto(int n){
    String distinto=String.valueOf(n);
    for(int i=0;i<3;i++){
        for(int j=i+1;j<4;j++){
          if (distinto.charAt(i)==distinto.charAt(j)) return false;
        }
    }
    return true; 
}
// crear y cargar una tabla de tamaño 10x10, mostrar la suma de cada fila y cada columna
public static void filaColumna(){
    int matriz[][] = new int[10][10];
    for (int i=0;i<10;i++){
        for(int j=0;j<10;j++){
            matriz[i][j]=(int)(Math.random()*100+1);
        }
    }
    System.out.println(Arrays.deepToString(matriz));
    int fila=matriz.length;
    int columna=matriz[0].length;
    int sumaF[]= new int[fila];
    int sumaC[]=new int [columna];
    for(int i =0;i<fila;i++){
        for (int j=0;j<columna;j++){
            sumaF[i]+=matriz[i][j];
            sumaC[j]+=matriz[i][j];
            }
    }
        for(int i=0;i<fila;i++){
        System.out.println("la suma de la fila "+(i+1)+" es: "+sumaF[i]);
        System.out.println("La suma de la columna "+(i+1)+" es: "+sumaC[i]);
        }
  }

// leer 2 series de 10 enteros, que estaran ordenados crecientemente. 
//copiar(fusionar) las dos tablas en una tercera de forma que sigan ordenados.
public static void fusionaEnteros(){
 int serie1[] =new int[10];
 int serie2[]=new int[10];
 int serieFinal[]=new int[20];
 for (int i=0;i<10;i++){
     serie1[i]=(int)(Math.random()*100+1);
     serie2[i]=(int)(Math.random()*100+1);
 }
    System.out.println("Primera serie: "+Arrays.toString(serie1));
    System.out.println("Segunda serie: "+Arrays.toString(serie2));
    for(int i=0;i<10;i++){
        serieFinal[i]=serie1[i];
        serieFinal[i+10]=serie2[i];
    }
    
    System.out.println("Serie final: "+Arrays.toString(serieFinal));
    // imprimimos la matriz con la llamada al metodo para que imprima con la operacion ya hecha
    System.out.println("Sreie final ordenada: "+Arrays.toString(ordenamatriz(serieFinal)));
}

public static int[] ordenamatriz(int a[]){
    // metodo para ordenar matrices unidimensionales 
     int salvar;
    for(int i=0;i<a.length-1;i++){ // -1 para que no salte el out of bounds
        for(int j=0;j<a.length-1-i;j++){// con esta se recorrera los numeros, la anterior es para resetear hasta que 
            if (a[j]>a[j+1]){         // la compruebe entera
                salvar=a[j];    // guardas el numero para no ser pisado por el siguiente           
                a[j]=a[j+1];    // se igualan
                a[j+1]=salvar;  // se escribe el numero para que no desaparezca
            }
        }
    }
    return a;
 }
public static void matriz3d (){
    System.out.println("Escribe el numero de la longitud para la matriz tridimensional");
    Scanner entrada= new Scanner(System.in);
    int n=entrada.nextInt();
    int matriz[][][]=new int[n][n][n];
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            for(int z=0;z<n;z++){
             matriz[i][j][z]=(int)(Math.random()*100+1);
           //     System.out.print("["+matriz[i][j][z]+"] "+" ");
        }
        //    System.out.println();
        }   
       // System.out.println();
    }
    for(int i=0;i<n;i++){
        System.out.println(Arrays.deepToString(matriz[i]));
    }
}
// funcion llamada mayorColumnaPrimero, poner primero la columna cuya suma sea mas alta
// hacerlo con funciones sumacolumna y intercambiacolumna
public static void mayorColumnaPrimero(){
    System.out.println("Escribe el tamaño de las filas (en enteros): ");
    Scanner entrada=new Scanner(System.in);
    int entrada1=entrada.nextInt();
    System.out.println("Ahora escribe el numero de las columnas, con enteros tambien: ");
    entrada=new Scanner(System.in);
    int entrada2=entrada.nextInt();
     int matriz[][]=new int[entrada1][entrada2];
        for (int i=0;i<entrada1;i++){
            for(int j=0;j<entrada2;j++){
                /*System.out.println("Escribe el numero de la fila "+(i+1)+" columna "+(j+1));
                entrada=new Scanner(System.in);
                entrada.nextInt();*/
                matriz[i][j]=(int)(Math.random()*100+1);
            }
        }
        System.out.println(Arrays.deepToString(matriz));
        Arrays.toString(sumaColmuna(matriz));
        int maximo=0;
        int columnamax=0;
        for (int i=0;i<entrada2;i++){
           if(sumaColmuna(matriz)[i]>maximo){
               maximo=sumaColmuna(matriz)[i];
               columnamax=i;
           }
        }
        System.out.println("La suma maxima es "+maximo+" que pertenece a la columna "+(columnamax+1));
        System.out.println(Arrays.deepToString(intercambiaColumna(columnamax, matriz)));
     }
     public static int []sumaColmuna(int a[][]){
         int sumacolumna[]=new int [a[0].length];
        for (int[] a1 : a) {
            for (int j = 0; j<a[0].length; j++) {
                sumacolumna[j] += a1[j];
            }
        }
          return sumacolumna;
     }
     public static int [][]intercambiaColumna (int h, int a[][]){
           if (h!=0){
               int salvar;
               for (int[] a1 : a) {
                   salvar = a1[0];
                   a1[0] = a1[h];
                   a1[h] = salvar;
               }
         return a;
  }
     return a;
    }

}
