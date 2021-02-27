package Servlets;

import Clases.Queja;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletEditarQueja")
public class ServletEditarQueja extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Obtiene el número de filial origen.
        String numerofilialorig = request.getParameter("editselect");
        //Obtiene el número de filial destino.
        String numerofilialdest = request.getParameter("editnumerofilialdestino");
        //Obtiene la descripción.
        String descrip = request.getParameter("editdescripcion");
        //Obtiene la fecha.
        String fech = request.getParameter("editfecha");
        //Obtiene el estado.
        String estado = request.getParameter("editselectestado");

        //Crea objeto queja.
        Queja miqueja = new Queja(numerofilialorig, numerofilialdest, descrip, fech, estado);
        //Llama al método buscar_editar.
        buscar_editar(request, response, miqueja);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void buscar_editar(HttpServletRequest request, HttpServletResponse response, Queja miqueja) throws ServletException, IOException{
        //Obtiene el ArrayList de quejas con request.
        ArrayList<Queja> listadequejas = (ArrayList<Queja>)request.getSession().getAttribute("queja");

        //Recorre la lista.
        for(Queja x : listadequejas){
            //Si el número filial origen coincide.
            if(x.getNfilialOrigen().equals(miqueja.getNfilialOrigen())){
                //Edita los atributos.
                x.setNfilialDestino(miqueja.getNfilialDestino());
                x.setDescripcion(miqueja.getDescripcion());
                x.setFecha(miqueja.getFecha());
                x.setEstado(miqueja.getEstado());
            }
        }
        //Establece la lista con request.
        request.getSession().setAttribute("queja", listadequejas);
        //Llama al método actualizar.
        actualizar(request, response);

    }

    private void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Actualiza la página.
        RequestDispatcher rq = request.getRequestDispatcher("Crear_EditarQueja.jsp");
        rq.forward(request, response);

    }

}
