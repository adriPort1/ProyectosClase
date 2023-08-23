package ahorcado;
import javax.swing.JOptionPane;
public class Ahorcado {
    public static boolean[] aciertos;
    public static String palabra;
    static int numfallo;
    public static final int FALLOSP = 9;

    public static void main(String[] args) {
        pedirPalabra();
        System.out.println("Comienza el ahorcado");
        System.out.println("Tienes " + FALLOSP + " intentos");
        do {       
            tamanoPalabra();
            if(!comprobar(letra())) numfallo++;
            System.out.println("llevas "+numfallo+" fallos");
        } while (numfallo<=FALLOSP && !solucion());
        if(numfallo>FALLOSP) System.out.println("Mala suerte, fallaste la palabra"+palabra);
        else System.out.println("Acertaste!");
    }

    public static String pedirPalabra() {
        // En esta funcion se pide la palabra con la que se va a jugar
        palabra = JOptionPane.showInputDialog("Escribe la palabra para adivinar");
        palabra = palabra.toLowerCase();
        aciertos = new boolean[palabra.length()];
        return palabra;
    }

    public static void tamanoPalabra() {
        // En esta funcion se rellena la palabra con guiones bajos para dar la pista del tamaño
        for (int i = 0; i < palabra.length(); i++) {
            if (aciertos[i]) {
                System.out.println(palabra.charAt(i));
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
}
