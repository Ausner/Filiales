<%@ page import="Servlets.ServletLogin" %>
<%@ page import="Clases.Login" %>
<%@ page import="Clases.Queja" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: usuario59
  Date: 1/11/2020
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mostrar Quejas</title>
    <link rel="stylesheet" href="Quejas.css" type="text/css">
</head>
<body>
<%
    //Obtiene el objeto user.
    Login user = (Login)request.getSession().getAttribute("usuario");
    //Obtine el ArrayList de quejas.
    ArrayList<Queja> listadequejas = (ArrayList<Queja>)request.getSession().getAttribute("queja");
    /*request.setAttribute("usuario", user);*/
    //Si el usuario es nulo o está sin logear.
    if (user == null || user.isLogeado() == false){
%>
<!--Muestra un div con el id "sinlogear"-->
<div id="sinlogear">
    <br/>
    <!--Muestra una imagen-->
    <img id="imagen" src="imagenes/AccesDenied.png">
    <br/>
    <!--Muestra un texto y un link-->
    <h3>Atención: <br/>Debes logearte para tener acceso a esta página</h3>
    <br/>
    <a href="index.jsp">Ir a logearme</a>
</div>
<%
    //Si el usuario está logeado.
}else if(user.isLogeado()){


%>

<!--Muestra un nav con el id "barradenavegacion"-->
<nav id="barradenavegacion">
    <!--Muestra links-->
    <a class="link" href="index.jsp">Logout</a>
    <a class="link" href="CrearCondominio.jsp">Crear condominio</a>
</nav>
<br/>
<br/>

<%
    //Si la lista de quejas no está vacia.
    if(listadequejas != null){
        //Recorre la lista.
        for(Queja x : listadequejas){ %>
            <!--Muestra un div con el id "comentarios"-->
            <div id="comentarios">
                <!--Muestra los datos de las quejas-->
                <h3>Número filial origen: <%out.print(x.getNfilialOrigen());%></h3>
                <h3>Número filial destino: <%out.print(x.getNfilialDestino());%></h3>
                <h3>Descripción: <%out.print(x.getDescripcion());%></h3>
                <h3>Fecha: <%out.print(x.getFecha());%></h3>
                <h3>Estado: <%out.print(x.getEstado());%></h3>

            </div>
            <%
        }
    //Sino.
    }else{
        %>
        <!--Muestra un div con el id "nocoments"-->
        <div id="nocoments">
            <!--Muestra un texto-->
            <h1>No hay comentarios para mostrar</h1>
        </div>
<%
    }

    }%>

</body>
</html>
