package construir.funciones;
import java.util.Scanner;
import javax.swing.JOptionPane;
public class ConstruirFunciones {
    public static void main(String[] args) {
        //notas();
        //divisionMayorMenor();
        //maxMinMedia();
        //Compara();
        //calculadora();
        //circulo(); 
        //buscaDivisor();
        //factorial();
       // sumadivisores2y3();
       //adivinar();
       //acertarRandom();
       //leeCifras();
        //cuboOpar();
        //imprimirTablaMultiplicar();
        numeroMatriculados();
    }
// creamos la clase publica vacia, recibe notas 
    public static void notas() {
        String nota = JOptionPane.showInputDialog("escribe tu nota");
        int n;
        n = Integer.parseInt(nota);
        switch (n) {
            case 1, 2, 3, 4 -> System.out.println("Supsenso");
            case 5 -> System.out.println("suficiente");
            case 6 -> System.out.println("bien");
            case 7, 8 -> System.out.println("notable");
            case 9, 10 -> System.out.println("sobresaliente");
            default -> System.out.println("no es posible ");
        }
        // este se hizo con double que acepta enteros, ahora cambiare a int para el swicht
        /*if (num < 5){
            System.out.println("Suspenso");
        }else if(num >= 5 && num < 7){
            System.out.println("aprobado");
        }else if (num >= 7 && num <9){
            System.out.println("notable");
        }else if (num >= 9 && num <= 10){
            System.out.println("sobresaliente");
        }else if (num > 10){
            System.out.println("no es posible");
        }*/
    }
    /* creamos una clase para el ejercicio, donde hay que sacar
    de dos numeros la division del mayor entre el menor */
    public static void divisionMayorMenor() {

        String num1 = JOptionPane.showInputDialog("dame un numero");
        String num2 = JOptionPane.showInputDialog("Dame otro numero");
        double n1 = Double.parseDouble(num1);
        double n2 = Double.parseDouble(num2);
        if (n1 >= n2) {
            double m = n1 / n2;
            System.out.println(n1 + "/" + n2 + "=" + m);
        } else if (n2 > n1) {
            double f = n2 / n1;
            System.out.println(n2 + "/" + n1 + "=" + f);
        }
    }
    public static void maxMinMedia() { // clase para funcion de max, min y media
        int c;  // c para introducir variables
        int d = 0; // d para sumar los valores
        int j = 0; // j para saber la cantidad de numeros que mete
        int g = 0, p = 0;// g para el numero grande y pe para el pequeño 
        // mientras no pulse 0, que introduzca numeros 
        do {
            // sacar el mensaje para los numeros 
            String m = JOptionPane.showInputDialog("escribe un numero");
            c = Integer.parseInt(m); // transformar a enteros 
            d = d + c; // la suma de los valores introducidos
            if (j == 0) {
                g = c; // lo igualamos a c para que haga las comparaciones
                p = c; // de los siguientes if
            }
            j = j + 1; // contador para la division en la media 
            if (c > g && c != 0) {
                g = c; // hallar el numero grande
            }
            if (c < p && c != 0) {
                p = c; // hallar el numero pequeño 
            }
        } while (c != 0);
        // le restamos uno al contador para que no tenga en cuenta al 0
        double k = d / (j - 1);
        // sacarlo todo 
        System.out.println("el numero mas grande es: " + g);
        System.out.println("el numero mas pequeño es: " + p);
        System.out.println("la media es: " + k);
    }
    public static void Compara() {
        // creamos el cuadro para los valores 
        double n1, n2, n3; // variables para leer
        do { // repite esto hasta que sean numeros diferentes 
            String num1 = JOptionPane.showInputDialog("introduce un numero, no se pueden repetir");
            n1 = Double.parseDouble(num1); // leer numero 1
            String num2 = JOptionPane.showInputDialog("introduce un numero, no se pueden repetir ");
            n2 = Double.parseDouble(num2); // leer numero 2
            String num3 = JOptionPane.showInputDialog("introduce un numero, no se pueden repetir");
            n3 = Double.parseDouble(num3); // leer numero 3
        } while (n1 == n2 || n1 == n3 || n2 == n3); //condicion sean diferentes 

        // numero 1 mayor y menor el 3
        if (n1 > n2 && n2 > n3) {
            System.out.println("El mayor es: " + n1);
            System.out.println("El menor es: " + n3);
        } // numero 2 mayor y 3 menor
        else if (n1 > n3 && n2 > n1) {
            System.out.println("El mayor es: " + n2);
            System.out.println("El menor es: " + n3);
        } // numero 3 mayor y 2 menor 
        else if (n3 > n1 && n1 > n2) {
            System.out.println("El mayor es: " + n3);
            System.out.println("El menor es: " + n2);
        } // numero 1 mayor y 2 menor 
        else if (n1 > n3 && n3 > n2) {
            System.out.println("El mayor es: " + n1);
            System.out.println("El menor es: " + n2);
        } // numero 2 mayor y 1 menor
        else if (n2 > n3 && n3 > n1) {
            System.out.println("El mayor es: " + n2);
            System.out.println("El menor es: " + n1);
        } // numero 3 mayor y 1 menor 
        else if (n3 > n2 && n2 > n1) {
            System.out.println("El mayor es: " + n3);
            System.out.println("El menor es: " + n1);
        }
    }
    public static void calculadora() {
        int n1;
        int n2;
        String signo;
        do {
            signo = JOptionPane.showInputDialog("muestra un numero entero");
            n1 = Integer.parseInt(signo);
            signo = JOptionPane.showInputDialog("Otro numero entero");
            n2 = Integer.parseInt(signo);
            signo = JOptionPane.showInputDialog("escoge una operacion entre +, -, *, /");
        } while (!signo.equals("+") && !signo.equals("-") && !signo.equals("*") && !signo.equals("/"));
        switch (signo) {
            case "+":                            //se puede hacer con if, pero 
                System.out.println(n1 + n2);    // hay que poner signo.equals
                break;                         // porque sino no lo recoge,
            case "-":                         // ya que para String son 
                System.out.println(n1 - n2); // operandos diferentes
                break;
            case "*":
                System.out.println(n1 * n2);
                break;
            case "/":
                System.out.println((double) n1 / n2); // con esto lo pasa a variable con decimales 
                break;                               // esto se llama casting (creo que es asi escrito)
        }
    }
    public static void circulo() {
        String radio = JOptionPane.showInputDialog("dame un radio");
        Double nrad = Double.parseDouble(radio);
        System.out.println(Math.PI * Math.pow(nrad, 2));
        //para redondear  será Math.round(area*100.0/100.0) area es como se llamó 
        // al resultado en otra variable, yo no hice eso
    }
// ejercicio nuevo escribir algoritmo que pida num y devuelva el 4 divisor de ese numero si lo tiene, sino que diga que tiene menos de 4
    public static void buscaDivisor() {
        String divisor = JOptionPane.showInputDialog("dame un numero y te digo su 4º divisor");
        int num = Integer.parseInt(divisor);
        int contador = 0;
        int divisores = 0;
        if (!numPrimos(num)){
        while (contador < 4 && divisores <= num ) {
            divisores++;
            if (num % divisores == 0) contador++ ;
        }
        if (contador == 4) {
            System.out.println("el cuarto divisor es: " + divisores);
        } else {
            System.out.println("no tiene 4º divisor");
            } 
        }
        else System.out.println("El número es primo");
    }
    public static boolean numPrimos(int num){
    int contador = 0;
    int divisores = 0;
        do  {
             divisores++;
             if (num % divisores == 0) contador++ ;
             if (contador>1) return false;
        } while(divisores < num/2 );
    return true;
    } 
    public static void factorial(){
     String factor = JOptionPane.showInputDialog("escribe un numero y te digo su resultado factorial");
     int fac = Integer.parseInt(factor);
     double facto=1;
     for (int i=1;i<=fac;i++){
         facto= facto*i;
     }
        System.out.println(facto);
    }
    public static double factorialrecursivo(double numero){
         if (numero <=1) // esta la uso para llamar en la anterior                           
                return 1;//que es lo mismo pero esta más simple y eficiente
         return numero * factorialrecursivo(numero-1);
  // esto es una función recursiva, realiza el calculo del numero y sigue hasta 1,
  //haciendo la multiplicacion para hallar el factorial
    }
    public static void sumadivisores2y3(){
      String numero = JOptionPane.showInputDialog("dame un numero");
      int numer=Integer.parseInt(numero);
      boolean negativo=false;
      int sumadivisorespar=0;
      int sumadivisorestre=0;
      if (numer<0){
           numer=Math.abs(numer);
           negativo=true;
      }
      
      for (int i=1;i<=numer;i++){
            if (i%2==0) sumadivisorespar = sumadivisorespar + i;
            if (i%3==0) sumadivisorestre = sumadivisorestre + i; 
      }   
       if (negativo)
       {
          sumadivisorespar*=-1;
          sumadivisorestre*=-1;
       }
        System.out.println("la suma de divisores de 2 hasta 200 es: "+sumadivisorespar);
        System.out.println("la suma de divisores de 3 hasta 200 es: "+sumadivisorestre);
      }
    public static void adivinar(){  
        int numer;
        int numerPrueba;
        int contador=0;
        boolean acertado=false;
      do {
         String numero = JOptionPane.showInputDialog("dame un numero secreto");
         numer =Integer.parseInt(numero);
      }while(numer>10||numer<1);
      do {
          String numero2=JOptionPane.showInputDialog("acierta el numero");
          numerPrueba=Integer.parseInt(numero2);
          contador +=1;
          if (numer==numerPrueba) acertado=true;
      } while(numer!=numerPrueba && acertado==false && contador<4);
      if (acertado==true)  System.out.println("acertaste");
      else System.out.println("fallaste");
  }
  public static void acertarRandom(){
   int numer;
   int aleatorio =(int)( Math.random()*20+1);
   int contador=0;
      do {
         String numero = JOptionPane.showInputDialog("adivina el numero");
         numer =Integer.parseInt(numero);
         contador++;
      }while(numer!=aleatorio);
      System.out.println("acertaste! el numero era: "+numer);
      System.out.println("lo intentaste: "+contador+" veces.");
  }
  public static void leeCifras(){
  String numero = JOptionPane.showInputDialog("dame un numero y te digo las cifras que tiene" );
  try { //captura el numero que le pido, y la uso para comparar si es entera o no
   Integer.valueOf(numero); //si es entero pasa
   System.out.println("las cifras del numero son: " + numero.length());//escribe esto
  } catch (NumberFormatException l){ //capturo excepciones y tomo acciones según convenga
      System.out.println("no es un numero entero, " + l); //escribo esto para todo lo que no sea la condición que tenia que cumplir
   }// soy el puto amo
  }// uso el try and catch como if para que evalue lo que no es, así emitir el texto que meten y solo evaluar enteros
  public static void cuboOpar(){
    Scanner entrada = new Scanner(System.in); 
       int panel=0;
       int operar;
      while (panel !=3){
      System.out.println("[1] Cubo de un numero");
      System.out.println("[2] Par o impar");
      System.out.println("[3] Salir");
      System.out.println("Escribe una opción:");
      panel = entrada.nextInt();
       switch (panel) {
            case 1 -> {
                System.out.println("escribe un numero para operar");
                operar = entrada.nextInt();
                operar = operar*operar*operar;
                System.out.println(operar);
            }
            case 2 -> {
                System.out.println("escribe un numero para operar");
                operar = entrada.nextInt();
                if (operar%2==0) System.out.println("Par");
                else System.out.println("Impar");
            }
            default -> System.out.println("Ese numero no es una opcion");
        }
      }
  }
  
  public static void imprimirTablaMultiplicar(){
      int numeroI;
      do{
      System.out.println("dame un numero del 1 al 10");
      Scanner entrada = new Scanner (System.in);
      numeroI = entrada.nextInt();
      }while(numeroI>10||numeroI<1);
      for(int i=1;i<numeroI+1;i++){
          System.out.println("Tabla del "+i);
          for(int j=1;j<11;j++){
              System.out.println(i+" X "+j+" = "+i*j);
          }
      }  
  }
  public static void numeroMatriculados(){   // pedir 3 datos, nº alumnos programacion, nº entorno desarrollo y nº bases de datos
                                             // mostrar %  de alumnos matriculados en cada uno de los 3 modulos. Extra, mostrar un decimal solo
     System.out.println("dime el nº de alumnos de programacion:");
     Scanner entrada = new Scanner(System.in);
    int Alpor = entrada.nextInt();
     System.out.println("dime el nº de alumnos de Entornos de desarrollo:");
     entrada= new Scanner(System.in);
    int Alentorno = entrada.nextInt();
     System.out.println("dime el nº de alumnos de bases de datos:");
     entrada= new Scanner(System.in);
    int Albases = entrada.nextInt();        
    float media= Alpor+Alentorno+Albases;
     System.out.printf("la media de alumnos de programacion es: %.1f %%\n", (Alpor/media*100));
     System.out.printf("la media de alumnos de entornos de desarrollo es: %.1f %%\n", (Alentorno/media*100));
     System.out.printf("la media de alumnos de bases de datos es: %.1f %%\n", (Albases/media*100));
  }
}