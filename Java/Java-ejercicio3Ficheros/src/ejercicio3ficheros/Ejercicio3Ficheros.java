package ejercicio3ficheros;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import javax.swing.JOptionPane;

public class Ejercicio3Ficheros {

    static String entrada[] = new String[2];
    static String ficheroNuevo;

    public static void main(String[] args) throws IOException {
        //C:\Users\Programacion\Desktop\a.txt
        //C:\Users\Programacion\Desktop\b.txt
        //C:\Users\Programacion\Desktop\
        // hacer en array los 3 y asi con un for recorrer cada 1

        for (int i = 0; i < entrada.length; i++) {
            entrada[i] = JOptionPane.showInputDialog("Escribe la ruta del fichero " + (i + 1) + " para copiar");
            comprobarFichero(entrada[i]);
        }
        String nombreNuevo = JOptionPane.showInputDialog("Ruta donde copiar el fichero");
        ficheroNuevo = nombreNuevo + nuevoNombreFichero(entrada);
        System.out.println(ficheroNuevo);
        escrituraFichero(ficheroNuevo);
        leerFichero(ficheroNuevo);
    }

      public static void leerFichero(String ruta) throws IOException {
        // funcion para leer los ficheros
        try {
            String texto = "";
            BufferedReader traducirFichero = new BufferedReader(new InputStreamReader(new FileInputStream(ruta), StandardCharsets.UTF_8));
            int valor = traducirFichero.read();
            while (valor != -1) {
                if ((char) valor != ' ') {
                    texto = texto + (char) valor;
                }
                valor = traducirFichero.read();
            }
            System.out.println(texto);
        } catch (FileNotFoundException ex) {
            System.out.println("no se pue leer");
        }
    }
    public static boolean comprobarFichero(String a) {
        // funcion para comprobar que existen los ficheros que le pasan
        File archivo = new File(a);
        if (archivo.exists()) {
            System.out.println("Existe");
            return true;
        }
        System.out.println("No existe");
        return false;
    }

    public static String nuevoNombreFichero(String a[]) {
        // construirnombrefichero
        //funcion que extrae las dos rutas el nombre del fichero sin el punto
        int barra1, barra2, punto1, punto2;
        barra1 = a[0].lastIndexOf("\\") + 1;
        barra2 = a[1].lastIndexOf("\\") + 1;
        punto1 = a[0].lastIndexOf(".");
        punto2 = a[1].lastIndexOf(".");
        return a[0].substring(barra1, punto1) + "_" + a[1].substring(barra2, punto2) + ".txt";
    }

    public static void escrituraFichero(String a) throws IOException {
        try (FileWriter fichero = new FileWriter(a)) {
            BufferedReader fich;
            int caracter;
            for (int i = 0; i < 2; i++) {
                fich = new BufferedReader(new InputStreamReader(new FileInputStream(entrada[i]), StandardCharsets.UTF_8));
                caracter = fich.read();
                while (caracter != -1) {
                    caracter = fich.read();
                    fichero.write((char) caracter);
                }
                fichero.write((char)10);
            }
        }catch(IOException e){
            System.out.println(e.toString());
        }
    }
}
