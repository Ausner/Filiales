<%@ page import="Clases.Login" %><%--
  Created by IntelliJ IDEA.
  User: usuario59
  Date: 31/10/2020
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="index.css" type="text/css">
</head>
<body>
<%
    //Obtiene el objeto user.
Login user = (Login)request.getSession().getAttribute("usuario");
if(user != null){ //Si es diferente de nulo.
    user.setLogeado(false); //Coloca logeado como falso.
    request.getSession().setAttribute("usuario", user); //Establece el objeto user con request.
}
%>
<!--Muestra un nav con el id "barradenavegacion"-->
<nav id="barradenavegacion">
    <!--Muestra un link-->
    <a href="Crear_EditarQueja.jsp">Crear y Editar Queja</a>
</nav>
<br>
<!--Muestra un título-->
<h1 id="tituloprincipal">Login:</h1>
<!--Muestra una sección con el id "inciarsesion"-->
<section id="iniciarsesion">
    <!--Muestra un formulario con los campos de usuario y contraseña-->
<form action="principal" method="post">
    Digite los siguientes datos:
    <br><br>
    Nombre de usuario:
    <input type="text" name="nombredeusuario" id="NombreDeUsuario" required>
    <br>
    <br>
    Contraseña:
    <input type="password" name="contrasena" id="Contrasena" required>
    <br>
    <br>
    <input type="submit" name="btnLogin" id="BTNLOGIN" value="Ingresar">
</form>
</section>

</body>
</html>
