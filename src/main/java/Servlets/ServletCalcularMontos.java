package Servlets;

import Clases.Condominio;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletCalcularMontos")
public class ServletCalcularMontos extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Obtengo la cedula como string.
        String cedula = request.getParameter("cedula");
        //Se quitan los guiones y se convierte a int.
        String cedulasinguion = "";
        for(int x = 0; x<cedula.length(); x++){
            if(x != 2 && x != 7){
                cedulasinguion += cedula.charAt(x);
            }
        }
        int ncedula = Integer.parseInt(cedulasinguion);

        //Obtengo el nombre.
        String nombre = request.getParameter("nombrecompleto");

        //Obtengo el número de teléfono.
        String telefono = request.getParameter("telefono");
        //Se quita el guión y se convierte a int.
        String telefonosinguion = "";
        for(int x=0; x<telefono.length(); x++){
            if(x != 4){
                telefonosinguion += telefono.charAt(x);
            }
        }
        int ntelefono = Integer.parseInt(telefonosinguion);

        //Se obtiene el número de filial como int.
        int nfilial = Integer.parseInt(request.getParameter("numerofilial"));
        //Se obtiene el tipo de filial.
        String tipofilial = request.getParameter("select");
        //Se obtiene el pendiente de cuota y agua mensual.
        Double p_cuotamensual = Double.parseDouble(request.getParameter("mp_cuotamensual"));
        Double p_aguamensual = Double.parseDouble(request.getParameter("mp_aguamensual"));
        //Se obtiene el pendiente de cuota y agua acumulado.
        Double p_cuotaacumulado = Double.parseDouble(request.getParameter("mp_cuotaacumulado"));
        Double p_aguaacumulado = Double.parseDouble(request.getParameter("mp_aguaacumulado"));
        //Se obtiene el monto a favor.
        Double montoafavor = Double.parseDouble(request.getParameter("montoafavor"));
        //Se obtiene la cantidad de vehiculos.
        int cantvehiculos = Integer.parseInt(request.getParameter("cantvehiculos"));

        //Se calcula si es moroso a partir de los montos.
        boolean esmoroso = false;
        if(p_cuotamensual > 0 || p_aguamensual > 0){ //Si algún pendiente mensual es mayor que 0.
            esmoroso = true; //Si es moroso.
        }else{ //Sino.
            esmoroso = false; //No es moroso.
        }

        //Crea objeto condominio y lo establece con request.
        Condominio mifilial = new Condominio(ncedula, nombre, ntelefono, nfilial, tipofilial, esmoroso, p_cuotamensual, p_aguamensual, p_cuotaacumulado, p_aguaacumulado, montoafavor, cantvehiculos);
        request.getSession().setAttribute("filial", mifilial);
        //Llama al método Actualizar.
        Actualizar(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private  void Actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Lleva a la misma página, es decir, la actualiza.
        RequestDispatcher req = request.getRequestDispatcher("CrearCondominio.jsp");
        req.forward(request, response);
    }
}
