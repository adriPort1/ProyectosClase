package com.mycompany.ejerciciosarraylist2;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class EjerciciosArrayList2 {

    public static void main(String[] args) {
        
        // escribir programa que pida tamaño de arraylist, genere numeros 
        //entre 1 y 100, luego pedira otro numero al usuario y lo sustituira por un 0
        // en todo el arrayList. el programa debe mostrar por pantalla el valor borrado, 
        // el numero de vece que aparece ese valor, el arraylist inicial y el arraylist final
        ejercicio1();
    }
    public static void ejercicio1(){
       // variable contador para los numeros que se repitan
        int contador=0;
        int n;
        System.out.println("Escribe el tamaño de la lista de arrays");
        n=pedirNum();
        // arralist con el tamaño pedido
        ArrayList <Integer> numeros = new ArrayList<Integer>(n);
        // funcion para rellenar la matriz
        rellenamatriz(numeros,n);
        // iterador para mostrar
        Iterator <Integer> num= numeros.iterator();
        // funcion para imprimir
        imprimir(num);
        System.out.println();
        System.out.println("que numero quieres sutituir en el ArrayList");
        n=pedirNum();
        num= numeros.iterator();
        int iterador=0;
        while(num.hasNext()){
            if(num.next()==(n)){
              contador++;
              numeros.set(iterador, 0);
            }
            iterador++;
        }
        num=numeros.iterator();
        imprimir(num);
        System.out.println();
        System.out.println(contador+" aparece el numero en el arrayList");
    }
    public static void imprimir(Iterator b){
        while(b.hasNext()){
            System.out.print(b.next()+", ");       
        }
    }
    
    public static ArrayList rellenamatriz(ArrayList n,int d){
        int m;
        for (int i=0;i<d;i++){
         m= (int)(Math.random()*100+1);
         n.add(m);
        }
        return n;
    }
    public static int pedirNum(){
        Scanner entrada= new Scanner (System.in);
        int numero= entrada.nextInt();
        return numero;
    }
}
