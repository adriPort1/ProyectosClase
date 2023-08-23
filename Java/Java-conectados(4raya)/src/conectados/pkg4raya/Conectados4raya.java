package conectados.pkg4raya;

import javax.swing.JOptionPane;

public class Conectados4raya {

    static char jugador1;
    static char jugador2;
    public static char tablero[][] = new char[6][7];
    static boolean alterno = true;

    public static void main(String[] args) {

        int columna = 0, fila1 = 0, contador = 0;
        escogeColor();
        // aqui rellenamos la matriz por primera vez, se hace aqui porque a partir de este punto 
        // ya dejará de estar vacia si van a jugar
        for (char[] tablero1 : tablero) {
            for (int j = 0; j < tablero[0].length; j++) {
                tablero1[j] = '-';
            }
        }
        mostrarTablero(tablero);
        do {
            if (alterno) {
                System.out.println("Jugador 1");
                columna = pedirColumna();
                if (!primeraFilaLibre(columna)) {
                    System.out.println("columna llena");
                } else {
                    fila1 = rellenar(columna, jugador1);
                    System.out.println("@@@@@@@@@@@@@");
                    mostrarTablero(tablero);
                    contador++;
                }
            } else {
                System.out.println("Jugador 2");
                columna = pedirColumna();
                if (!primeraFilaLibre(columna)) {
                    System.out.println("columna llena");
                } else {
                    fila1 = rellenar(columna, jugador2);
                    System.out.println("@@@@@@@@@@@@@");
                    mostrarTablero(tablero);
                    contador++;
                }
            }
            alterno = !alterno;
        } while (contador < 42 && !comprobarFila(fila1) && !comprobarColumna(columna) && !comprobarDiagonal(fila1, columna, origen(fila1, columna)) && !invertida(fila1, columna, origenInvertido(fila1, columna)));

        if (contador == 42 && (!comprobarFila(fila1) || !comprobarColumna(columna) || !comprobarDiagonal(fila1, columna, origen(fila1, columna)) || !invertida(fila1, columna, origenInvertido(fila1, columna)))) {
            System.out.println("empate");
        } else if (!alterno && (comprobarFila(fila1) || comprobarColumna(columna) || comprobarDiagonal(fila1, columna, origen(fila1, columna)) || invertida(fila1, columna, origenInvertido(fila1, columna)))) {
            System.out.println("Jugador 1 ganó");
        } else {
            System.out.println("Jugador 2 ganó");
        }

    }

    public static int pedirColumna() {
        // para pedir la columna a escoger
        int columna = 0;
        String a;
        do {
            a = JOptionPane.showInputDialog("Escoge la columna para meter ficha");
            columna = Integer.parseInt(a) - 1;
        } while (columna < 0 || columna > 6);
        return columna;
    }

    public static boolean invertida(int c, int f, int o[]) {
        // aqui se comprueba la diagonal invertida, que empezara desde la ultima columna y primera fila
        // y que decrece la columna, aumentando la fila
        int fila = o[0];
        int columna = o[1];
        int contador = 0;
        while (fila < 5 && columna > 0 && contador < 3) {
            if (tablero[fila][columna] == tablero[fila + 1][columna - 1] && tablero[fila][columna] != '-') {
                contador++;
            } else {
                contador = 0;
            }
            fila++;
            columna--;
        }
        return contador >= 3;
    }

    public static int[] origenInvertido(int f, int c) {
        // buscamos el punto de origen de las diagonales invertidas, sabiendo que empiezan en la ultima columna, primera fila
        // y que decrece la columna, aumentando la fila
        int invertido[] = new int[2];
        while (c < 6 && f > 0) {
            c++;
            f--;
        }
        invertido[0] = f;
        invertido[1] = c;
        return invertido;
    }

    public static boolean comprobarDiagonal(int c, int f, int g[]) {
        // compribamos la diagonal del punto escogido
        // y que aumenta la columna, aumentando la fila
        int fila = g[0];
        int columna = g[1];
        int contador = 0;
        while (fila < 5 && columna < 6 && contador < 3) {
            if (tablero[fila][columna] == tablero[fila + 1][columna + 1] && tablero[fila][columna] != '-') {
                contador++;
            } else {
                contador = 0;
            }
            fila++;
            columna++;
        }
        return contador >= 3;
    }

    public static int[] origen(int f, int c) {
        // buscamos el origen de la diagonal sabiendo que empuieza desde la primera fila, primera columna
        // y que aumenta la columna, aumentando la fila
        int origen[] = new int[2];
        while (f > 0 && c > 0) {
            f--;
            c--;
        }
        origen[0] = f;
        origen[1] = c;
        return origen;
    }

    public static boolean comprobarColumna(int c) {
        // comprobamos las columnas y sus valores adyacentes
        int f = 0, contador = 0;
        while (f < 5 && contador < 3) {
            if (tablero[f][c] == tablero[f + 1][c] && tablero[f][c] != '-') {
                contador++;
            } else {
                contador = 0;
            }
            f++;
        }
        return contador >= 3;
    }

    public static boolean comprobarFila(int f) {
        // comprobamos las filas y sus valores adyacentes 
        int c = 0, contador = 0;
        while (c < 6 && contador < 3) {
            if (tablero[f][c] == tablero[f][c + 1] && tablero[f][c] != '-') {
                contador++;
            } else {
                contador = 0;
            }
            c++;
        }
        return contador >= 3;
    }

    public static int rellenar(int a, char b) {
        // ponemos la fiche en lugar vacio, si esta lleno, se pone encima si esta vacia

        int fila = 5;
        while (tablero[fila][a] != '-') {
            fila--;
        }
        tablero[fila][a] = b;
        return fila;
    }

    public static boolean primeraFilaLibre(int a) {
        // buscamos que la primera fila este libre, para poder meter ficha
        if (tablero[0][a] == '-') {
            return true;
        } else {
            return false;
        }
    }

    public static void escogeColor() {
        // aqui asignamos el color a cada jugador
        String entrada;
        do {
            entrada = JOptionPane.showInputDialog("Jugador 1, escoge el color rojo o azul");
            entrada = entrada.toUpperCase();
        } while (!"AZUL".equals(entrada) && !"ROJO".equals(entrada));
        if (entrada.equals("ROJO")) {
            jugador1 = 'r';
            jugador2 = 'a';
            System.out.println("Jugador 1, eres el color rojo");
            System.out.println("jugador 2, eres el color azul");
        } else {
            jugador1 = 'a';
            jugador2 = 'r';
            System.out.println("Jugador 1, eres el color azul");
            System.out.println("jugador 2, eres el color rojo");
        }

    }

    public static void mostrarTablero(char[][] a) {
        // funcion basica para mostrar tablero
        for (int i = 0; i < tablero.length; i++) {
            for (int j = 0; j < tablero[0].length; j++) {
                System.out.print(tablero[i][j]);
                System.out.print(" ");
            }
            System.out.println(" ");
        }
    }

}
