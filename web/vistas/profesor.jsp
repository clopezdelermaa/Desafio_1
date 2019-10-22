<%-- 
    Document   : profesor
    Created on : 20-oct-2019, 11:30:34
    Author     : PC
--%>

<%@page import="Datos.Horario"%>
<%@page import="Conexiones.ConexionEstatica"%>
<%@page import="Datos.Aula"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profesor</title>
        <link rel="stylesheet" type="text/css" href="css/miestilo.css">
    </head>
    <body>
        <script>
            function reservar() {
                var reservado;
                 if( document.getElementById("reserva").equals("Libre")) {
                     reservado = document.getElementById("reserva").value = "Reservado";
                 } else {
                     reservado = document.getElementById("reserva"). value = "Libre";
                 }
            }
        </script>
        
        <%
            if (request.getParameter("iniciar") != null) {
                if (request.getParameter("usuario").equals("profesor")) {

                    LinkedList<Aula> listaulas = ConexionEstatica.Obteneraulas();
                    LinkedList<Horario> listahoras = ConexionEstatica.Obtenerhoras();
                    for (int j = 0; j < listahoras.size(); j++) {
                        Horario h = listahoras.get(j);
                        h.getComienzo();
                        h.getFin();

        %>
        <form name="formularioprofesor" action="controlador.jsp" method="POST">
            Elija fecha<input type="date" id="fecha" name="fecha" value="" min=""><br>
            Elija aula
            <br>
            <select>
                <% for (int i = 0; i < listaulas.size(); i++) {
                %><option><%listaulas.get(i);%></option><%
                    }
                %>
            </select>
            <br>
            <h4>FECHA</h4>
            <h4>AULA</h4>
            <br>
            <br>
            <table>
                <thead>
                    <tr>
                        <th>HORA COMIENZO</th>
                        <th>HORA FINAL</th>
                        <th>RESERVADO</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=h.getComienzo()%></td>
                        <td><%=h.getFin()%></td>
                        <td><input type="button" name="reserva" value="Libre" onclick="reservar()"></td>
                    </tr>
                    <tr>
                        <td><%=h.getComienzo()%></td>
                        <td><%=h.getFin()%></td>
                        <td><input type="button" name="reserva" value="Libre" onclick="reservar()"></td>
                    </tr>
                    <tr>
                        <td><%=h.getComienzo()%></td>
                        <td><%=h.getFin()%></td>
                        <td><input type="button" name="reserva" value="Libre" onclick="reservar()"></td>
                    </tr>
                    <tr>
                        <td><%=h.getComienzo()%></td>
                        <td><%=h.getFin()%></td>
                        <td><input type="button" name="reserva" value="Libre" onclick="reservar()"></td>
                    </tr>
                    <tr>
                        <td><%=h.getComienzo()%></td>
                        <td><%=h.getFin()%></td>
                        <td><input type="button" name="reserva" value="Libre" onclick="reservar()"></td>
                    </tr>
                    <tr>
                        <td><%=h.getComienzo()%></td>
                        <td><%=h.getFin()%></td>
                        <td><input type="button" name="reserva" value="Libre" onclick="reservar()"></td>
                    </tr>
                </tbody>
            </table>
            <%
                        }
                    }
                }
            %>
            <br>
            <input type="submit" name="volverindex" value="Volver"><br>
            <input type="submit" name="cerrarsesion" value="Cerrar Sesión"><br>
        </form>
    </body>
</html>
