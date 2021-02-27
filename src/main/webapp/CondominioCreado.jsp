<%@ page import="Clases.Login" %>
<%@ page import="Clases.Condominio" %><%--
  Created by IntelliJ IDEA.
  User: usuario59
  Date: 3/11/2020
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Condominio Creado</title>
    <link href="CondominioCreado.css" type="text/css" rel="stylesheet">

</head>
<body>
<%
//Obtiene el objeto user para verificar si esta logeado.
    Login user = (Login)request.getSession().getAttribute("usuario");
    /*request.setAttribute("usuario", user);*/
    if (user == null || user.isLogeado() == false){ //Si está nulo o no está logeado.
%>
<!--Muestra un div con el id "sinlogear"-->
<div id="sinlogear">
    <br/>
    <!--Muestra una imagen-->
    <img src="imagenes/AccesDenied.png" id="imagen">
    <br/>
    <!--Muestra un texto y un link-->
    <h3>Esta página solo está disponible para la creación de filiales</h3>
    <br/>
    <a href="index.jsp">Ir a logearme</a>
</div>
<%
}else if(user.isLogeado()){ //Si esta logeado.
    //Obtiene la cadena activar.
    String activar = (String) request.getSession().getAttribute("Exito");
if(activar != null){ //Si la cadena es diferente de null, muestra el contenido.
%>
<!--Muestra un div con el id "condominiocreado"-->
<div id="condominiocreado">
    <br/>
    <!--Muestra una imagen de éxito-->
    <img src="imagenes/check.png" id="picture">
    <br/>
    <!--Muestra un texto y un link-->
    <h3>¡Condominio creado con éxito!</h3>
    <br/>
    <a href="CrearCondominio.jsp"><button id="btnvolver">Volver</button></a>

</div>

<%}else{  //Sino. %>
<!--Muestra un div con el id "sincrear"-->
<div id="sincrear">
    <br/>
    <!--Muestra una imagen-->
    <img src="imagenes/AccesDenied.png" id="miimagen">
    <br/>
    <!--Muestra un texto y un link-->
    <h3>Debe crear un condominio para mostrar esta página</h3>
    <br/>
    <a href="CrearCondominio.jsp">Ir a crear condominio</a>
</div>
<%}}%>
</body>
</html>
