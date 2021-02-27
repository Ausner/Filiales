package Clases;

public class Condominio {
    //Atributos.
    private int cedula;
    private String nombre;
    private int telefono;
    private int nfilial;
    private String tipofilial;
    private boolean moroso;
    private double p_cuotamensual;
    private double p_aguamensual;
    private double p_cuotaacumulado;
    private double p_aguaacumulado;
    private double montoafavor;
    private int cantvehiculos;

    //Constructor.
    public Condominio(int cedula, String nombre, int telefono, int nfilial, String tipofilial, boolean moroso, double p_cuotamensual, double p_aguamensual, double p_cuotaacumulado, double p_aguaacumulado, double montoafavor, int cantvehiculos) {
        this.cedula = cedula;
        this.nombre = nombre;
        this.telefono = telefono;
        this.nfilial = nfilial;
        this.tipofilial = tipofilial;
        this.moroso = moroso;
        this.p_cuotamensual = p_cuotamensual;
        this.p_aguamensual = p_aguamensual;
        this.p_cuotaacumulado = p_cuotaacumulado;
        this.p_aguaacumulado = p_aguaacumulado;
        this.montoafavor = montoafavor;
        this.cantvehiculos = cantvehiculos;
    }

    //Métodos getter y setter.
    public int getCedula() {
        return cedula;
    }

    public void setCedula(int cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public int getNfilial() {
        return nfilial;
    }

    public void setNfilial(int nfilial) {
        this.nfilial = nfilial;
    }

    public String getTipofilial() {
        return tipofilial;
    }

    public void setTipofilial(String tipofilial) {
        this.tipofilial = tipofilial;
    }

    public boolean isMoroso() {
        return moroso;
    }

    public void setMoroso(boolean moroso) {
        this.moroso = moroso;
    }

    public double getP_cuotamensual() {
        return p_cuotamensual;
    }

    public void setP_cuotamensual(double p_cuotamensual) {
        this.p_cuotamensual = p_cuotamensual;
    }

    public double getP_aguamensual() {
        return p_aguamensual;
    }

    public void setP_aguamensual(double p_aguamensual) {
        this.p_aguamensual = p_aguamensual;
    }

    public double getP_cuotaacumulado() {
        return p_cuotaacumulado;
    }

    public void setP_cuotaacumulado(double p_cuotaacumulado) {
        this.p_cuotaacumulado = p_cuotaacumulado;
    }

    public double getP_aguaacumulado() {
        return p_aguaacumulado;
    }

    public void setP_aguaacumulado(double p_aguaacumulado) {
        this.p_aguaacumulado = p_aguaacumulado;
    }

    public double getMontoafavor() {
        return montoafavor;
    }

    public void setMontoafavor(double montoafavor) {
        this.montoafavor = montoafavor;
    }

    public int getCantvehiculos() {
        return cantvehiculos;
    }

    public void setCantvehiculos(int cantvehiculos) {
        this.cantvehiculos = cantvehiculos;
    }


}
