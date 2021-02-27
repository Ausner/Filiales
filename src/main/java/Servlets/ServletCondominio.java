package Servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import Clases.Condominio;

@WebServlet(name = "ServletCondominio")
public class ServletCondominio extends HttpServlet {
    //ArrayList de condominios.
    ArrayList<Condominio> listaCondominios = new ArrayList<Condominio>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Se obtiene el parametro del botón cancelar.
        String cancel = request.getParameter("btncancelar");
        //Si es diferente de nulo.
        if(cancel != null){
            //Obtiene el objeto condominio que se calculó.
            Condominio mifilial = (Condominio)request.getSession().getAttribute("filial");
            //Se asigna a null.
            mifilial = null;
            //Se vuelve a establecer con request.
            request.getSession().setAttribute("filial", mifilial);
            //Llama al método Actualizar.
            Actualizar(request, response);

        }else { //Sino.

            //Se obtiene la cedula como string.
            String cedula = request.getParameter("cedula");
            String cedulasinguion = "";
            //Quita los guiones del string y la convierte a int.
            for (int x = 0; x < cedula.length(); x++) {
                if (x != 2 && x != 7) {
                    cedulasinguion += cedula.charAt(x);
                }
            }
            int ncedula = Integer.parseInt(cedulasinguion);

            //Obtiene el nombre.
            String nombre = request.getParameter("nombrecompleto");

            //Obtiene el teléfono como string.
            String telefono = request.getParameter("telefono");
            //Se quita el guión del string y se convierte a int.
            String telefonosinguion = "";
            for (int x = 0; x < telefono.length(); x++) {
                if (x != 4) {
                    telefonosinguion += telefono.charAt(x);
                }
            }
            int ntelefono = Integer.parseInt(telefonosinguion);

            //Se obtiene el número de filial como entero.
            int nfilial = Integer.parseInt(request.getParameter("numerofilial"));
            //Se obtiene el tipo de filial.
            String tipofilial = request.getParameter("select");
            //Se obtiene si es moroso o no.
            String moroso = request.getParameter("moroso");

            //Evavlua si es moroso.
            boolean esmoroso = false;
            if (moroso.equals("Si")) { //Si el string es "Si".
                esmoroso = true; //Moroso es true.
            } else { //Sino.
                esmoroso = false; //Moroso es false.
            }
            //Obtiene el pendiente de cuota y agua mensual.
            Double p_cuotamensual = Double.parseDouble(request.getParameter("mp_cuotamensual"));
            Double p_aguamensual = Double.parseDouble(request.getParameter("mp_aguamensual"));
            //Obtiene el pendiente acumulado de cuota y agua.
            Double p_cuotaacumulado = Double.parseDouble(request.getParameter("mp_cuotaacumulado"));
            Double p_aguaacumulado = Double.parseDouble(request.getParameter("mp_aguaacumulado"));
            //Obtiene el monto a favor.
            Double p_montoafavor = Double.parseDouble(request.getParameter("montoafavor"));
            //Obtiene la cantidad de vehiculos.
            int cantvehiculos = Integer.parseInt(request.getParameter("cantvehiculos"));

            //Crea objeto condominio.
            Condominio filial = new Condominio(ncedula, nombre, ntelefono, nfilial, tipofilial, esmoroso, p_cuotamensual, p_aguamensual, p_cuotaacumulado, p_aguaacumulado, p_montoafavor, cantvehiculos);
            //Lo agrega a la lista.
            listaCondominios.add(filial);
            //Obtiene el objeto condominio que se calculó.
            Condominio mifilial = (Condominio) request.getSession().getAttribute("filial");
            //Lo asigna a null.
            mifilial = null;
            //Lo establece con request.
            request.getSession().setAttribute("filial", mifilial);
            //Crea string activar.
            String activar = "activar";
            //Lo establece con request y el identificador "Exito".
            request.getSession().setAttribute("Exito", activar);
            //Llama al método Exito.
            Exito(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private  void Actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Refrezca la página.
        RequestDispatcher req = request.getRequestDispatcher("CrearCondominio.jsp");
        req.forward(request, response);
    }

    private  void Exito(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Lleva a la página CondominioCreado.jsp
        RequestDispatcher req = request.getRequestDispatcher("CondominioCreado.jsp");
        req.forward(request, response);
    }

}
