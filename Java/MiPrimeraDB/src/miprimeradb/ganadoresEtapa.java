package miprimeradb;


public class ganadoresEtapa {
    
private String nombre;
private String salida;
private String llegada;

public ganadoresEtapa(){
    this.nombre="";
    this.salida="";
    this.llegada="";
}

public ganadoresEtapa(String nombre, String salida, String llegada){
    this.nombre=nombre;
    this.salida=salida;
    this.llegada=llegada;
}

    public String getNombre() {
        return nombre;
    }

    public String getSalida() {
        return salida;
    }

    public String getLlegada() {
        return llegada;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSalida(String salida) {
        this.salida = salida;
    }

    public void setLlegada(String llegada) {
        this.llegada = llegada;
    }

    @Override
    public String toString() {
        return "ganadoresEtapa: {" + "nombre -> " + nombre + ", salida -> " + salida + ", llegada -> " + llegada + '}';
    }
    
}
