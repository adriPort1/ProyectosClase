package com.mycompany.ejercicioarraylist;

import java.util.ArrayList;
import java.util.Iterator;
import javax.swing.JOptionPane;


public class EjercicioArrayList {

    public static void main(String[] args) {
        //ejercicio1();
        ejercicio2();
    }
    // creando arraylist por primera vez 
    public static void ejercicio1(){
        ArrayList<Integer> enteros = new ArrayList<Integer>();
        String pedirNum="";
        int n=0; 
        do{
        pedirNum=JOptionPane.showInputDialog("ESCRIBE NUMEROS, 0 PARA SALIR");
        n=Integer.valueOf(pedirNum);
        if(n!=0){
         enteros.add(n);   
        }
        }while(Integer.valueOf(pedirNum)!=0);
        for(int i=0;i<enteros.size();i++){
            System.out.print(enteros.get(i)+", ");
        }
       }
    public static void ejercicio2(){
        ArrayList<Integer> enteros = new ArrayList<Integer>();
        String pedirNum="";
        int n=0; 
        do{
            pedirNum=JOptionPane.showInputDialog("ESCRIBE NUMEROS, 0 PARA SALIR");
            n=Integer.valueOf(pedirNum);
        if(n!=0){
            enteros.add(n);   
        }
        }while(Integer.valueOf(pedirNum)!=0);
        
        Iterator <Integer> num = enteros.iterator();
        while(num.hasNext()){
         System.out.println(num.next());
        }
    }
}
