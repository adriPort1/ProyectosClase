package matrices;

import java.util.Arrays;
import java.util.Scanner;
import javax.swing.JOptionPane;

public class Matrices {

    public static void main(String[] args) {
        //matrizDiez();
        //Nombres();
        //MatrizCien();
        //frase();
        //Alumnonota();
        //capicua();
        //devuelveVocal();
        //numRumandom();
        //numAleatorio2();
        //ejemploPrint();
        //MaxMin();
        AleatoriosPrimos();
    }
    public static void matrizDiez() {
        int matriz[] = new int[10];
        for (int i = 0; i < 10; i++) {
            matriz[i] = (int) (Math.random() * 100 + 1);
            System.out.println(matriz[i]);
        }
    }
    public static void Nombres() {
        float[] Notas = {5.8f, 6.2f, 7.1f, 5.9f, 3.6f, 9.9f, 1.2f, 10.0f, 4.6f, 5.0f};
        String[] Nombres = new String[10];
        Nombres[0] = "Pedro";
        Nombres[1] = "Ana";
        Nombres[2] = "Luis";
        Nombres[3] = "Luis";
        Nombres[4] = "Juan";
        Nombres[5] = "Eva";
        Nombres[6] = "Mari";
        Nombres[7] = "Fran";
        Nombres[8] = "Luz";
        Nombres[9] = "Sol";
        int contador = 0;
        for (int i = 0; i < 10; i++) {
            if (Notas[i] >= 5) {
                contador++;
            }
            System.out.println(Nombres[i] + ":" + " " + Notas[i]);
        }
        System.out.println("Numero de aprobados: " + contador);
        System.out.print("aprobados: ");
        for (int i = 0; i < 10; i++) {
            if (Notas[i] >= 5) {
                System.out.print(Nombres[i] + " ");
            }
        }
    }
    public static void MatrizCien() {
        int num[] = new int[100];
        int suma = 0;
        for (int i = 0; i < num.length; i++) {
            num[i] = i + 1;
            suma = suma + num[i];
        }
        System.out.println(suma);
        System.out.println(suma / num.length);
    }
    public static void frase() {
        String frase = JOptionPane.showInputDialog("introduce una frase");
        char palabra[] = new char[frase.length()];
        for (int i = 0; i < frase.length(); i++) {
            palabra[i] = frase.charAt(i);
        }
        for (int i = palabra.length - 1; i >= 0; i--) {
            System.out.print(frase.charAt(i));
        }
    }
    public static void Alumnonota() {
        String numalumnos = JOptionPane.showInputDialog("dime el numero de alumnos");
        int numal = Integer.parseInt(numalumnos);
        String nombre;
        String nombreal[] = new String[numal];
        int nota[] = new int[numal];
        for (int i = 0; i <= numal - 1; i++) {
            nombreal[i] = JOptionPane.showInputDialog("dime el nombre del alumno");
            nombre = JOptionPane.showInputDialog("y dime la nota");
            nota[i] = Integer.parseInt(nombre);
        }
        for (int j = 0; j <= numal - 1; j++) {
            System.out.println("El alumno " + nombreal[j] + " ha sacado un " + nota[j]);
        }
    }
    public static void capicua() {
        Scanner entrada = new Scanner(System.in);
        System.out.println("Escribe un numero: ");
        int num = entrada.nextInt();
        boolean capicua = true;
        String numero = String.valueOf(num);
        int i = 0, j = numero.length() - 1;
        while (capicua && i < j) {
            if (numero.charAt(i) != numero.charAt(j)) {
                capicua = false;
            }
            i++;
            j--;
        }
        if (capicua == true) {
            System.out.println("Es capicua");
        } else {
            System.out.println("no es capicua");
        }
    }
    public static void devuelveVocal() {
        String entrada = JOptionPane.showInputDialog("Escribe una frase: ");
        String vocal = JOptionPane.showInputDialog("y ahora una vocal");
        String entrada2 = entrada.toLowerCase();
        String vocal2 = vocal.toLowerCase();
        int cuentaVocales = 0;
        for (int i = 0; i <= entrada.length() - 1; i++) {
            if (entrada2.charAt(i) == vocal2.charAt(0)) {
                cuentaVocales++;
            }
        }
        System.out.println("la vocal " + vocal + " aparece " + cuentaVocales + " veces");
    }
// programa genere array automaticamente de numeros enteros (n lo introduces pr teclaco).
//se pedira despues nº de veces que aparece si el numero existe en el array correcto  y fallo si no 

    public static void numRumandom() {
        System.out.println("Escribe el numero de datos que quieres generar");
        Scanner entrada = new Scanner(System.in);
        int n = entrada.nextInt();
        int aleatorio[] = new int[n];
        int contador = 0;
        for (int i = 0; i <= aleatorio.length - 1; i++) {
            aleatorio[i] = (int) (Math.random() * 100) + 1;
            System.out.println(aleatorio[i]);
        }
        System.out.println("introduce un numero");
        entrada = new Scanner(System.in);
        int entrada2 = entrada.nextInt();
        for (int j = 0; j <= aleatorio.length; j++) {
            if (entrada2 == aleatorio[j]) {
                contador++;
            }
        }
        System.out.println("el dato " + entrada2 + " sale " + contador + " veces");
    }
    public static void numAleatorio2() {
        // igual que el anterior pero ahora si aparece el numero y las veces que aparezca, disminuirá la matriz, generando una nueva
        System.out.println("Escribe el numero de datos que quieres generar");
        Scanner entrada = new Scanner(System.in);
        int n = entrada.nextInt();
        int aleatorio[] = new int[n];
        int contador = 0;
        int nuevaMatriz[];
        int contados = 0;
        // 1º for para iterar y generar la matriz
        for (int i = 0; i <= aleatorio.length - 1; i++) {
            aleatorio[i] = (int) (Math.random() * 100) + 1;
            System.out.println(aleatorio[i]);
        }
        System.out.println("introduce un numero que quieras eliminar de la matriz");
        entrada = new Scanner(System.in);
        int entrada2 = entrada.nextInt();
        //2º for para contar el nº de veces que aparece un dato 
        for (int j = 0; j <= aleatorio.length - 1; j++) {
            if (entrada2 == aleatorio[j]) {
                contador++;
            }
        }
        nuevaMatriz = new int[n - contador];
        System.out.println("sale " + contador + " veces");
        // 3º for para generar nueva matriz pero con los mismo numeros
        for (int s = 0; s < aleatorio.length; s++) {
            if (aleatorio[s] != entrada2) {
                nuevaMatriz[s - contados] = aleatorio[s];
                System.out.println(nuevaMatriz[s]);
            } else {
                contados++;
            }
        }
    }
    public static void ejemploPrint() {
        int aleatorios[] = new int[10];
        for (int i = 0; i < aleatorios.length; i++) {
            aleatorios[i] = (int) (Math.random() * 10 + 1);
        }
        System.out.println(Arrays.toString(aleatorios));
        // usamos Arrays to string para imprimir las matrices, con el formato [..,..,...]
        // si no gusta el formato, hacer uno con for
    }
    // encontrar el maximo y minimo y decir el lugar que ocupa
    public static void MaxMin() {
        int numeros[] = new int[10];
        int max = 0, min = 10;
        for (int i = 0; i < numeros.length; i++) {
            numeros[i] = (int) (Math.random() * 10 + 1);
            if (numeros[i] < min) {
                min = numeros[i];
            } else if (numeros[i] > max) {
                max = numeros[i];
            }
        }
        System.out.println(Arrays.toString(numeros));
        System.out.print("el maximo es " + max + " y ocupa la posicion ");
        for (int i = 0; i < 10; i++) {
            if (numeros[i] == max) {
                System.out.print((i + 1) + " ");
            }
        }
        System.out.println("");
        System.out.print("el minimo es " + min + " y ocupa la posicion ");
        for (int i = 0; i < 10; i++) {
            if (numeros[i] == min) {
                System.out.print((i + 1) + " ");
            }
        }
    }
    //escribe un programa que genere 20 num aleatorios entre 0 y 99, almacenar en array
    //generar nuevo araray con los primos que salgan, y mostrar los dos ararays
    public static void AleatoriosPrimos() {
        int aleatorios[] = new int[20];
        int primos[];
        int contador = 0, j=0;
        for (int i = 0; i < aleatorios.length; i++) {
            aleatorios[i] = (int) (Math.random() * 100 + 1);
            if (esPrimo(aleatorios[i])) {
                contador++;
            }
        }
        primos = new int[contador];
        while (contador>0){
            if(esPrimo(aleatorios[j])){
               primos[contador-1]=aleatorios[j];
               contador--;
            }
            j++;
        }
        System.out.println(Arrays.toString(aleatorios));
        System.out.println(Arrays.toString(primos));
    }

    public static boolean esPrimo(int num) {
        if (num==0) return false;
        int contador = 0;
        int divisores = 0;
        do {
            divisores++;
            if (num % divisores == 0) {
                contador++;
            }
            if (contador > 1) {
                return false;
            }
        } while (divisores < num / 2);
        return true;
    }
}
