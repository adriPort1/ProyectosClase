package ahorcadoconfichero;

import javax.swing.JOptionPane;
import java.io.FileReader;
import java.io.IOException;

public class AhorcadoConFichero {

    // generar array strings para guardar palabra en cada posicion, de dicho array
    // variables para usar en todo el proyecto
    public static String palabra;
    public static boolean[] aciertos;
    static int numfallo;
    public static final int FALLOSP = 9;

    public static void main(String[] args) {
       palabrajuego(leefichero());
       aciertos = new boolean[palabra.length()];
        System.out.println("Comienza el ahorcado");
        System.out.println("Tienes " + FALLOSP + " intentos");
        do {
            tamanoPalabra();
            if (!comprobar(letra())) {
                numfallo++;
            }
            System.out.println("llevas " + numfallo + " fallos");
        } while (numfallo <= FALLOSP && !solucion());
        if (numfallo > FALLOSP) {
            System.out.println("Mala suerte, fallaste la palabra " + palabra);
        } else {
            System.out.println("Acertaste!");
        }
    }

    public static void palabrajuego(String[] a) {
        int numeroPalabra,contador,codigo;
         String entrada;
        do{
         entrada=JOptionPane.showInputDialog("Introduce que letra no quieres que aparezca");
         entrada=entrada.toLowerCase();
         codigo=entrada.charAt(0);
         if(codigo==241)entrada="ñ";
        }while(entrada.length()>1|| codigo < 97 || codigo > 122);
         do{  
         numeroPalabra = (int) (Math.random() * a.length);
         palabra = a[numeroPalabra];
         contador=0;
           for(int i=0;i<palabra.length();i++){
               if (palabra.charAt(i)==entrada.charAt(0)){
                  contador++;
               }
           }
        }while(contador!=0||entrada.length()>1);
    }

    public static void tamanoPalabra() {
        // En esta funcion se rellena la palabra con guiones bajos para dar la pista del tamaño
        for (int i = 0; i < palabra.length(); i++) {
            if (aciertos[i]) {
                System.out.print(palabra.charAt(i));
            } else {
                System.out.print("_");
            }
            System.out.print(" ");
        }
        System.out.println();
    }

    public static char letra() {
        // En esta funcion pedimos la letra, y controlamos que sea una letra
        String pedir;
        char letra;
        int codigo;
        do {
            pedir = JOptionPane.showInputDialog("Introduce una letra");
            letra = pedir.charAt(0);
            codigo = letra;
        } while (pedir.length() != 1 || codigo < 97 || codigo > 122);
        return letra;
    }

    public static boolean comprobar(char b) {
        // En esta funcion comprobamos que la letra sea parte de la palabra 
        boolean existeLetra = false;
        for (int i = 0; i < palabra.length(); i++) {
            if (palabra.charAt(i) == b) {
                aciertos[i] = true;
                existeLetra = true;
            }

        }
        return existeLetra;
    }

    public static boolean solucion() {
        // funcion que comprueba si el array booleano esta entero o tiene algun caracter
        for (int i = 0; i < aciertos.length; i++) {
            if (aciertos[i] == false) {
                return false;
            }
        }
        return true;
    }

    public static String[] leefichero() {
        // se usa para ver el fichero 
        final String nomFichero = "C:\\Users\\Programacion\\Desktop\\ahorcadoaleatorio.txt";
        try {
            FileReader fich = new FileReader(nomFichero);
            String texto = "";
            int caracteres = 0;
            int valor = fich.read();
            int letra = 0;
            // para meter en un string para leer en el programa
            while (valor != -1) {
                texto = texto + (char) valor;
                valor = fich.read();
                if ((char) valor == ',') {
                    caracteres++;
                }
                letra++;
            }
            // numero de palabras
            String palabras[] = new String[caracteres + 1];
            for (int i = 0; i < palabras.length; i++) {
                palabras[i] = "";
            }
            fich = new FileReader(nomFichero);
            int posiciones = 0;
            valor = fich.read();
            //while para meter las palabras en un nuevo string esta vez en array
            while (valor != -1) {
                if ((char) valor == ',') {
                    posiciones++;
                } else {
                    palabras[posiciones] += (char) valor;
                }
                valor = fich.read();
            }
            return palabras;
        } catch (IOException e) {
            System.out.println("Fichero inexistente o ruta incorrecta" + e);
        }
        String nada[] = {""};
        return nada;
    }

}
