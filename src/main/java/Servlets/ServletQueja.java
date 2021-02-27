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

@WebServlet(name = "ServletQueja")
public class ServletQueja extends HttpServlet {

    //ArrayList de quejas.
    ArrayList<Queja> listadequejas = new ArrayList<>();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Obtiene el número filial de origen.
        String numerofilialorig = request.getParameter("numerofilialorigen");
        //Obtiene el número filial de destino.
        String numerofilialdest = request.getParameter("numerofilialdestino");
        //Obtiene la descripción.
        String descrip = request.getParameter("descripcion");
        //Obtiene la fecha.
        String fech = request.getParameter("fecha");
        //Obtiene el estado.
        String estado = request.getParameter("selectestado");

        //Crea objeto queja.
        Queja miqueja = new Queja(numerofilialorig, numerofilialdest, descrip, fech, estado);
        //Agrega el objeto a la lista.
        listadequejas.add(miqueja);
        //Establece la lista con request y el identificador "queja".
        request.getSession().setAttribute("queja", listadequejas);
        //Llama al método actualizar.
        actualizar(request, response);


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private  void actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       //Actualiza la página.
        RequestDispatcher rq = request.getRequestDispatcher("Crear_EditarQueja.jsp");
        rq.forward(request, response);

    }
}
