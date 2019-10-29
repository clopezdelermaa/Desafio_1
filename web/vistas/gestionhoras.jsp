<%-- 
    Document   : gestionhoras
    Created on : 21-oct-2019, 19:24:40
    Author     : Celia
//Pantalla de bienvenida para todos los usuarios
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Conexiones.ConexionEstatica"%>
<%@page import="Datos.Horario"%>
<%@page import="Datos.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de horarios</title>
        <link rel="stylesheet" type="text/css" href="../css/miestilo.css">
        <script>
            function nuevahora() {
                var nuevahora = "<tr><td><input type='text' name='hora' value=''></td><td><input type='text' name='comienzo' value=''></td><td><input type='text' name='final' value=''></td><td><input type='button' name='reservar' value='Reservar'></td></tr>";
                document.getElementById("horas").innerHTML += nuevahora;
                        
            }
        </script>
    </head>
    <body>
        <br>
        <h1>Gestión de horas</h1>
        <br>


        <table id="horario">
            <thead>
                <tr>
                    <th>NÚMERO</th>
                    <th>COMIENZO</th>
                    <th>FINAL</th>
                </tr>
            </thead>
            <tbody>
                <tr id="horas">
                    <%
                        LinkedList<Horario> listahoras = (LinkedList<Horario>) session.getAttribute("listahoras");

                        for (int i = 0; i < listahoras.size(); i++) {
                            Horario h = listahoras.get(i);

                    %>
                    <td><input type="text" name="hora" value="<%=h.getNumero()%>"></td>
                    <td><input type="text" name="comienzo" value="<%=h.getComienzo()%>"></td>
                    <td><input type="text" name="final" value="<%= h.getFin()%>"></td>
                    <td><input type="button" name="reservar" value="Reservar"></td>  
                </tr>
                <% }
                %>
            </tbody>
        </table>

        <a href="admingeneral.jsp"><input type="button" name="volver" value="Volver"></a>
        <a href="../index.jsp"><input type="submit" name="cerrarsesion" value="Cerrar Sesión"><br>
    </body>
</html>
