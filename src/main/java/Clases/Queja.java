package Clases;


public class Queja {
    //Atributos.
    private String nfilialOrigen;
    private String nfilialDestino;
    private String descripcion;
    private String fecha;
    private String estado;

    //Constructor.
    public Queja(String nfilialOrigen, String nfilialDestino, String descripcion, String fecha, String estado) {
        this.nfilialOrigen = nfilialOrigen;
        this.nfilialDestino = nfilialDestino;
        this.descripcion = descripcion;
        this.fecha = fecha;
        this.estado = estado;
    }


    //Métodos getter y setter.
    public String getNfilialOrigen() {
        return nfilialOrigen;
    }

    public void setNfilialOrigen(String nfilialOrigen) {
        this.nfilialOrigen = nfilialOrigen;
    }

    public String getNfilialDestino() {
        return nfilialDestino;
    }

    public void setNfilialDestino(String nfilialDestino) {
        this.nfilialDestino = nfilialDestino;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}