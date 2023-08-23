package ficheros;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import javax.swing.JOptionPane;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

public class Ficheros {
        //C:\Users\Programacion\Desktop\ahorcadoaleatorio.txt
        //C:\Users\Programacion\Desktop\palabritas.txt

    public static void main(String[] args) throws IOException {
        String entrada=JOptionPane.showInputDialog("Escribe 1 para escribirfichero, 2 para ejer 2 ficheros");
        switch(entrada){
            case "1":
                escribirFichero();
                break;
            case "2":
                numeroCaracteres();
                break;
            default:
                System.out.println("Salir");
                break;
        }
        // este es de teoria
        // escribirFichero();
        // ejercicio2 ficheros, el 1 esta en trabajando con ficheros
        
    }
    //esta funcion es para escribir en ficheros en los que haya ruta
    public static void escribirFichero() throws IOException{
        String ruta="C:\\Users\\Programacion\\Desktop\\ahorcado aleatorio.txt";
        String texto =JOptionPane.showInputDialog("Introduce el texto que quieres escribir en el bloc de notas");
        try(FileWriter fich = new FileWriter(ruta, true)){
            // escribimos el texto en el fichero
            File mifichero=new File(ruta);
            if(mifichero.exists())System.out.println("Fichero existe");
            else System.out.println("Fichero inexistente");
            fich.write(texto);
            fich.close();
            FileReader fr= new FileReader(ruta);
            int caracter=fr.read();
            // y ahora lo mostramos para comprobar que esta bien
            while(caracter!=-1){
                caracter=fr.read();
            }
        } catch (IOException e){
            System.out.println("Problema con la lectura/escritura en el fichero "+e);
        }
    }
    public static void numeroCaracteres(){
        String ruta=JOptionPane.showInputDialog("Escribe la ruta del fichero para saber si existe");
        try{           
            File fichero =new File(ruta);   
            BufferedReader leefichero = new BufferedReader(new InputStreamReader(new FileInputStream(ruta),StandardCharsets.UTF_8));
            if(fichero.exists()) System.out.println("Existe fichero");
            else System.out.println("No existe el fichero");
            //esta no es exacta porque falla por el idioma, con buffered sale exacta FileReader leefichero = new FileReader(ruta);
            int valor=0;
            int caracteres=0,palabras=1;
            String texto="";
            while(valor!=-1){
                valor=leefichero.read();
                texto=texto+(char)valor;
                // para las palabras que no esten seguidas de comas como nuestro ejercicio
                // poner solo espacio o punto, las comas siempre van seguidas de espacio
                if((char)valor==' '||(char)valor==','||(char)valor=='.'){
                    palabras++;
                } else caracteres++;
            } 
            System.out.println(palabras);
            System.out.println(caracteres);
            System.out.println(texto);
        } catch(IOException e){
            System.out.println("no existe ruta");
        }        
    }
}
