<%@ page import="Clases.Queja" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: usuario59
  Date: 31/10/2020
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear y Editar Queja</title>
    <link rel="stylesheet" href="Crear_EditarQueja.css" type="text/css">
</head>
<body>
<%
    //Obtiene el ArrayList de quejas.
    ArrayList<Queja> listadequejas = (ArrayList<Queja>)request.getSession().getAttribute("queja");

%>
<!--Muestra un nav con el id "barradenavegacion"-->
    <nav id="barradenavegacion">
        <!--Muestra un link-->
        <a href="index.jsp">Login</a>
    </nav>
    <br>
    <br>
<!--Muestra una sección con el id "Crear"-->
    <section id="Crear">
        <!--Muestra un formulario con los campos de una queja-->
    <form id="formulariocrearqueja" action="queja" method="post">
        <h1>Crear Queja:</h1>
        <br>
        Número de filial que pone la queja:
        <input type="text" name="numerofilialorigen" id="NumeroFilialOrigen" required>
        <br>
        <br>
        Número de filial destino de la queja:
        <input type="text" name="numerofilialdestino" id="NumeroFilialDestino" required>
        <br>
        <br>
        Descripción de la queja:
        <br>
        <textarea name="descripcion" id="Descripcion" cols="40" rows="10" maxlength="500" required></textarea>
        <br>
        <br>
        Fecha de la queja:
        <input type="date" name="fecha" id="Fecha" required>
        <br>
        <br>
        Estado:
        <select name="selectestado" id="SelectEstado">
            <option name="opcionenviada" id="OpcionEnviada">Enviada</option>
            <option name="opcionenproceso" id="OpcionEnProceso">En proceso</option>
            <option name="opcioncerrada" id="OpcionCerrada">Cerrada</option>
            <option name="opcionobservaciondeladmin" id="OpcionObservacionDelAdmin">En observaciones del administrador</option>
        </select>
        <br>
        <br>
        <input type="submit" name="btnCrearQueja" id="BTNCREARQUEJA" value="Crear Queja">
    </form>
    </section>
    <br>
    <br>

    <section id="Editar">
        <%
            //Si la lista de quejas es diferente de nula.
            if(listadequejas != null){
        %>
<!--Muestra un formulario con el id "formularioeditarqueja"-->
    <form id="formularioeditarqueja" action="Editarqueja" method="post">
        <h1>Editar Queja:</h1>
        <br>
        Seleccione el número de filial del que pone la queja para editarla:
        <br>
        <!--Muestra un select con todas las opciones de la lista de quejas-->
        <select name="editselect" id="EditSelect">
            <%
                //Recorre la lista.
                for(Queja x : listadequejas){
            %>
            <!--Agrega el número filial de la queja como opción.-->
            <option><%out.print(x.getNfilialOrigen());%></option>
            <%}%>
        </select>
        <br>
        <br>
        <!--Muestra los demás campos de la queja para introduir los nuevos datos.-->
        Coloque el  nuevo número de filial destino de la queja:
        <input type="text" name="editnumerofilialdestino" id="EditNumeroFilialDestino"  required>
        <br>
        <br>
        Coloque la nueva descripción de la queja:
        <br>
        <textarea cols="40" rows="10" name="editdescripcion" id="EditDescripcion" maxlength="500"  required></textarea>
        <br>
        <br>
        Coloque la nueva fecha de la queja:
        <input type="date" name="editfecha" id="EditFecha" required>
        <br>
        <br>
        Coloque el nuevo estado:
        <select name="editselectestado" id="EditSelectEstado">
            <option name="editopcionenviada" id="EditOpcionEnviada">Enviada</option>
            <option name="editopcionenproceso" id="EditOpcionEnProceso">En proceso</option>
            <option name="editopcioncerrada" id="EditOpcionCerrada">Cerrada</option>
            <option name="editopcionobservaciondeladmin" id="EditObservacionDelAdmin">En observaciones del administrador</option>
        </select>
        <br>
        <br>
        <input type="submit" name="btnEditarQueja" id="BTNEDITARQUEJA" value="Editar Queja">
    </form>
        <% //Sino.
            }else{ %>
        <!--Muestra un div cone el id "nocoments"-->
        <div id="nocoments">
            <!--Muestra un texto-->
            <h1>¡No hay comentarios para editar!</h1>
        </div>
        <%}%>
</section>

</body>
</html>
