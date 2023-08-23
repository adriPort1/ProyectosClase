package separadoporcomas;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;

public class SeparadoPorComas {
    // generar array strings para guardar palabra en cada posicion, de dicho array
    // variables para usar en todo el proyecto
    public static void main(String[] args) {
      leefichero();    
    }
    
    public static String [] leefichero(){
        // se usa para ver el fichero 
        final String nomFichero="C:\\Users\\Programacion\\Desktop\\ahorcado aleatorio.txt";
        // metodo try & catch
        try{
            FileReader fich= new FileReader(nomFichero);
            String texto="";
            int caracteres=0;
            int valor=fich.read();
            int letra=0;
        // para meter en un string para leer en el programa
            while(valor!= -1){
                texto=texto+(char)valor;
                valor=fich.read();
                if((char)valor==',') caracteres++;
                letra++;
                }   
        // numero de palabras
            String palabras[]=new String[caracteres+1];
            for(int i=0;i<palabras.length;i++) palabras[i]="";
            fich= new FileReader(nomFichero);
            int posiciones=0;
            valor=fich.read();
        //while para meter las palabras en un nuevo string esta vez en array
            while(valor!=-1){
            if((char) valor==','){
                posiciones++;
            } else{
                palabras[posiciones]+=(char) valor;
            } 
            valor=fich.read();
        }
            System.out.println(Arrays.toString(palabras)); 
            return palabras;
        }catch(IOException e){
            System.out.println("Fichero inexistente o ruta incorrecta"+e );
        }   
        String nada[]={""};
        return nada;
    }
     
}
