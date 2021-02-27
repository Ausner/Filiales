package Servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
//import java.io.IOException;
import java.io.*;
import Clases.Login;

@WebServlet(name = "ServletLogin")
public class ServletLogin extends HttpServlet {



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Obtiene el nombre de usuario.
        String nombreusuario = request.getParameter("nombredeusuario");
        //Obtiene la contraseña.
        String contrasena = request.getParameter("contrasena");
        //Crea valor booleano.
        boolean logeado = false;
        //Crea objeto de tipo Login.
        Login user = new Login(nombreusuario, contrasena, logeado);

        //Evalua el nombre de usuario y la contraseña.
        if(nombreusuario.equals("Admin") && contrasena.equals("123*456")){
            user.setLogeado(true); //Coloca logeado como verdadero.
            Acceder(request, response, user); //Llama al método acceder.

        }else{ //Sino.
            user.setLogeado(false); //Coloca logeado como falso.
            Actualizar(request, response); //Llama al método Actualizar.

        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void Acceder(HttpServletRequest request, HttpServletResponse response, Login user) throws ServletException, IOException {
        //Establece el objeto user con request.
        request.getSession().setAttribute("usuario",user);
        //Lleva a la página CrearCondominio.
        RequestDispatcher req = request.getRequestDispatcher("CrearCondominio.jsp");
        req.forward(request, response);

    }


    private void Actualizar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Actualiza la página.
        RequestDispatcher req = request.getRequestDispatcher("index.jsp");
        req.forward(request, response);

    }

}
