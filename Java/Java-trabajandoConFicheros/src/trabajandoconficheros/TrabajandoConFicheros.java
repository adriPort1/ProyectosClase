package trabajandoconficheros;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import javax.swing.JOptionPane;

public class TrabajandoConFicheros {
    public static void main(String[] args) throws IOException {
      //C:\Users\Programacion\Desktop\ahorcadoaleatorio.txt
        String ruta;
        String entrada=JOptionPane.showInputDialog("Escribe 1 si quieres leer el fichero, 2 si quieres leer y moodificar el fichero y cualquier tecla para salir");
        switch(entrada){
            case "1":
                ruta=JOptionPane.showInputDialog("Escribe la ruta del fichero a modificar");
                 escanearFichero(ruta);
            break;
            case "2":
                ruta=JOptionPane.showInputDialog("Escribe la ruta del fichero a modificar");
                 escribirFichero(ruta);
                 escanearFichero(ruta);
            break;
            default:
                System.out.println("Saliste");
            break;
        }
    }
    public static void escanearFichero(String a){
        //funcion para leer el texto del archivo 
        try{
           FileReader fichero = new FileReader(a);
           String texto="";
           int valor=fichero.read();
           while(valor!=-1){
            if((char)valor==' ') texto=texto+(char)valor;   
            valor=fichero.read();
            texto+=(char)valor;
           }
            System.out.println(texto);
        } catch(IOException e){
            System.out.println("Fichero no existe o ruta equivocada");
        }
    }
    
    public static void escribirFichero(String a) throws IOException{
        // esta es la funcion para modificar el texto
        String texto =JOptionPane.showInputDialog("Introduce el texto que quieres escribir en el archivo");
        try(FileWriter fich = new FileWriter(a, true)){
            // escribimos el texto en el fichero
           /*
            esto es para mostrar si existe o no el fichero
             if(mifichero.exists())System.out.println("Fichero existe");
            else System.out.println("Fichero inexistente");*/
            fich.write(texto);
            fich.close();
            FileReader fr= new FileReader(a);
            int caracter=fr.read();
            // y ahora lo mostramos para comprobar que esta bien
            while(caracter!=-1){
                caracter=fr.read();
            }
           
        } catch (IOException e){
            System.out.println("Problema con la lectura/escritura en el fichero "+e);
        }
    }
    
    public static void leeFichero(){
        final String nomFichero="C:\\Users\\Programacion\\Desktop\\alga.txt";
        try{
            FileReader fich= new FileReader(nomFichero);
            String texto="";
            int caracteres=0;
            int valor = fich.read();
            while(valor!= -1){
                if((char)valor!=' ') texto=texto+(char)valor;
                valor= fich.read();
                caracteres++;
            }
            System.out.println(texto);
            System.out.println("Numero de caracteres "+caracteres);
        } catch(IOException e){
            System.out.println("Fichero no existe o ruta fichero incorrecta"+e);
        }
    }
}
