<%@ page import="Clases.Login" %>
<%@ page import="Clases.Condominio" %><%--
  Created by IntelliJ IDEA.
  User: usuario59
  Date: 31/10/2020
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Condominio</title>
    <link rel="stylesheet" href="CrearCondominio.css" type="text/css">
</head>
<body>

<%
    //Obtiene el string activar para quitar el acceso a la página "CondominioCreado.jsp".
    String activar = (String) request.getSession().getAttribute("Exito");
    if(activar != null){ //Si es diferente de nulo.
        activar = null; //Lo hace nulo.
        request.getSession().setAttribute("Exito", activar); //Lo establece con request.
    }
    //Obtiene el objeto mifilial de tipo condominio.
    Condominio mifilial = (Condominio) request.getSession().getAttribute("filial");
    //Obtiene el objeto user de tipo Login.
    Login user = (Login)request.getSession().getAttribute("usuario");
    /*request.setAttribute("usuario", user);*/
    //Si el usuario es igual a nulo o no está logeado.
    if (user == null || user.isLogeado() == false){
%>
<!--Muestra un div con el id "sinlogear"-->
<div id="sinlogear">
    <br/>
    <!--Muestra una imagen-->
    <img src="imagenes/AccesDenied.png" id="imagen">
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
    <!--Muestra los links-->
    <a class="link" href="index.jsp">Logout</a>
    <a class="link" href="MostrarQuejas.jsp">Listar Quejas</a>
</nav>

<%
    //Si mifilial es nulo.
    if(mifilial == null){
%>
<!--Muestra una sección con el id "formulariocondominio"-->
<section id="formulariocondominio">
    <!--Muestra un formulario con los campos para ingresar un condominio-->
    <!--el action de este formulario es el servlet "ServletCalcularMontos"-->
    <form action="CalcularMontos" method="post" id="formulario">
        <h1>Crear condomio</h1>
        <br>
        Cédula:
        <input type="text" name="cedula" id="Cedula" minlength="12" maxlength="12" placeholder="0#-####-####" title="Formato correcto: 0#-####-####" pattern="[0]{1}[0-9]{1}[-]{1}[0-9]{4}[-]{1}[0-9]{4}" required>
        <br><br>
        Nombre completo:
        <input type="text" name="nombrecompleto" id="NombreCompleto" minlength="10" maxlength="60" required>
        <br><br>
        Teléfono:
        <input type="text" name="telefono" id="Telefono" minlength="9" maxlength="9" placeholder="####-####" pattern="[0-9]{4}[-]{1}[0-9]{4}" title="Formato correcto: ####-####" required>
        <br><br>
        Número de filial:
        <input type="number" name="numerofilial" id="NumeroFilial" minlength="1" maxlength="18" required>
        <br><br>
        Tipo de filial:
        <select name="select" id="Select">
            <option value="Modelo Rio">Modelo Rio</option>
            <option value="Modelo Cascada">Modelo Cascada</option>
            <option value="Modelo Mar">Modelo Mar</option>
        </select>
        <br><br>
        Moroso: *Se calcula al presionar el botón de calcular*
        <br><br>
        Monto pendiente cuota mensual:
        <input type="number" name="mp_cuotamensual" id="MP_CuotaMensual" value="0" min="0" required>
        <br><br>
        Monto pendiente agua mensual:
        <input type="number" name="mp_aguamensual" id="MP_AguaMensual" min="0" value="0" required>
        <br><br>
        Monto pendiente cuota acumulado:
        <input type="number" name="mp_cuotaacumulado" id="MP_CuotaAcumulado" value="0" min="0" required>
        <br><br>
        Monto pendiente agua acumulado:
        <input type="number" name="mp_aguaacumulado" id="MP_AguaAcumulado" value="0" min="0" required>
        <br><br>
        Monto a favor:
        <input type="number" name="montoafavor" id="MontoAFavor" value="0" min="0" required>
        <br><br>
        Cantidad de vehiculos:
        <input type="number" name="cantvehiculos" id="CantVehiculos" required value="0" min="0" max="3">
        <br><br>
        <input type="submit" name="btncrearcondomnio" id="btncrearcondominio" value="Calcular morosidad">
    </form>




</section>
<%
        //Sino.
    }else{ %>
<!--Muestra una seccion con el id "formulariocondominio"-->
<section id="formulariocondominio">
    <!--Muestra un form con los campos completados del objeto mifilial-->
    <!--El action de este formulario es el servlet "ServletCondominio"-->
    <form action="condominio" method="post" id="formulario2">
        <h1>Crear condomio</h1>
        <br/>
        <h4>*Presiona el botón verde para crear el condominio</h4>
        <br/>
        Cédula:
        <input type="text" name="cedula" id="Cedula2" minlength="12" maxlength="12" value="
<%
//Obtiene la cedula y la convierte a string.
String ced = "0"+Integer.toString(mifilial.getCedula());
String nuevaced = "";
//Le agrega los guiones.
    for(int i = 0; i<ced.length(); i++){
        if(i == 1 || i == 5){
            nuevaced += ced.charAt(i)+"-";
        }else{
            nuevaced += ced.charAt(i);
        }

    }

       out.print(nuevaced);%>
" placeholder="0#-####-####" title="Formato correcto: 0#-####-####" readonly pattern="[0]{1}[0-9]{1}[-]{1}[0-9]{4}[-]{1}[0-9]{4}" required>
        <br><br>
        Nombre completo:
        <input type="text" name="nombrecompleto" id="NombreCompleto2" minlength="10" maxlength="60" readonly value="<%out.print(mifilial.getNombre());%>" required>
        <br><br>
        Teléfono:
        <input type="text" name="telefono" id="Telefono2" minlength="9" maxlength="9" value="
<%
//Obtiene el telefono como string.
String tel = Integer.toString(mifilial.getTelefono());
String nuevotel = "";
//Le agrega el guión.
    for(int i = 0; i<tel.length(); i++){
        if(i == 3){
            nuevotel += tel.charAt(i)+"-";
        }else{
            nuevotel += tel.charAt(i);
        }

    }

       out.print(nuevotel);


        %>" placeholder="####-####" pattern="[0-9]{4}[-]{1}[0-9]{4}" title="Formato correcto: ####-####" required readonly>
        <br><br>
        Número de filial:
        <input type="number" name="numerofilial" id="NumeroFilial2" minlength="1" maxlength="18" value="<%out.print(mifilial.getNfilial());%>" required readonly>
        <br><br>
        Tipo de filial:
        <select name="select" id="Select2">
            <option value="<%out.print(mifilial.getTipofilial());%>"><%out.print(mifilial.getTipofilial());%></option>
        </select>
        <br><br>
        Moroso:
        <input type="text" name="moroso" id="Moroso2" value="<%
        //Si moroso es true.
        if(mifilial.isMoroso()){
            out.print("Si"); //Escribe "Si".
        }else{ //Sino.
            out.print("No"); //Escribe "No".
        }
        %>" readonly>
        <br><br>
        Monto pendiente cuota mensual:
        <input type="number" name="mp_cuotamensual" id="MP_CuotaMensual2" readonly value="<%out.print(mifilial.getP_cuotamensual());%>" min="0" required>
        <br><br>
        Monto pendiente agua mensual:
        <input type="number" name="mp_aguamensual" id="MP_AguaMensual2" readonly min="0" value="<%out.print(mifilial.getP_aguamensual());%>" required>
        <br><br>
        Monto pendiente cuota acumulado:
        <input type="number" name="mp_cuotaacumulado" id="MP_CuotaAcumulado2" readonly value="<%out.print(mifilial.getP_cuotaacumulado());%>" min="0" required>
        <br><br>
        Monto pendiente agua acumulado:
        <input type="number" name="mp_aguaacumulado" id="MP_AguaAcumulado2" readonly value="<%out.print(mifilial.getP_aguaacumulado());%>" min="0" required>
        <br><br>
        Monto a favor:
        <input type="number" name="montoafavor" id="MontoAFavor2" value="<%out.print(mifilial.getMontoafavor());%>" readonly>
        <br><br>
        Cantidad de vehiculos:
        <input type="number" name="cantvehiculos" id="CantVehiculos2" required value="<%out.print(mifilial.getCantvehiculos());%>" min="0" max="3" readonly>
        <br><br>
        <input type="submit" name="btncancelar" id="btncancelar2" value="Cancelar">
        <input type="submit" name="btncrearcondomnio" id="btncrearcondominio2" value="Crear condominio">
    </form>


<% }} %>


</body>
</html>
