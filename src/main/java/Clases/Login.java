package Clases;

public class Login {
    //Atributos.
    private String nombreusuario;
    private String contrasena;
    private boolean logeado;

    //Constructor.
    public Login(String nombreusuario, String contrasena, boolean logeado) {
        this.nombreusuario = nombreusuario;
        this.contrasena = contrasena;
        this.logeado = logeado;
    }

    //Métodos getter y setter.
    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public boolean isLogeado() {
        return logeado;
    }

    public void setLogeado(boolean logeado) {
        this.logeado = logeado;
    }
}
