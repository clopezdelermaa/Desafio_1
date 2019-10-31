<%-- 
    Document   : profesor
    Created on : 20-oct-2019, 11:30:34
    Author     : Celia
--%>

<%@page import="Auxiliar.Bitacora"%>
<%@page import="Datos.Profesor"%>
<%@page import="Datos.Reserva"%>
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
        <title>Reserva de aula</title>
        <link rel="stylesheet" type="text/css" href="../css/miestilo.css">
    </head>
    <body>

        <form name="formularioprofesor" action="controladorindex.jsp" method="POST">
            Elija fecha<input type="date" id="fecha" name="fecha" value="" min=""><br>
            <br>
            Elija aula
            <br>
            <%
                LinkedList<Aula> listaulas = (LinkedList<Aula>) session.getAttribute("listaaulas");
                LinkedList<Horario> listahora = (LinkedList<Horario>) session.getAttribute("listahoras");


            %>
            <select id="au">
                <% for (int i = 0; i < listaulas.size(); i++) {

                        Aula a = listaulas.get(i);

                %><option><%=a.getCod_Aula()%></option><%

                %>
            </select>
            <br>
            <br>
            <h3>FECHA</h3>
            <br>
            <h3>AULA</h3>

            <table id="reservaclase">

                <thead>
                    <tr>
                        <th>HORA COMIENZO</th>
                        <th>HORA FINAL</th>
                        <th>RESERVADO</th>
                    </tr>
                </thead>
                <tbody>
                    <%      for (int c = 0; c < listahora.size(); c++) {
                            Horario h = listahora.get(c);
                    %>
                    <tr>
                        <td><%=h.getComienzo()%></td>
                        <td><%=h.getFin()%></td>
                        <td><input type="button" name="reserva" value="Libre"></td>
                    </tr>

                </tbody>
                <%
                    

                    LinkedList<Reserva> listareserva = new LinkedList();

                    if (request.getParameter("reserva") != null && request.getParameter("reserva").equals("Libre")) {
                        if (listareserva.isEmpty()) {

                            listareserva = new LinkedList();
                        } else {
                            listareserva = ConexionEstatica.Obtenerreservas();
                            java.sql.Date fecha = java.sql.Date.valueOf(request.getParameter("fecha"));
                            int aula = a.getCod_Aula();
                            String descripcion = a.getDescripcion();
                            String comienzo = h.getComienzo();
                            String fin = h.getFin();
                            String profesor = session.getAttribute("user").toString();
                            int cod_reserva = listareserva.size() + 1;
                            Reserva r = new Reserva(cod_reserva, aula, descripcion, comienzo, fin, fecha, profesor);
                            listareserva.add(r);
                            Bitacora.Escribirbitacora("El usuario " + session.getAttribute("user").toString() + " ha reservado el aula " + aula + " en las horas " + comienzo + ", " + fin + "\r\n");
                        }
                %>
                <input type="button" name="reserva" value="Reservado">
                <%
                                session.setAttribute("listareservas", listareserva);
                            }
                        }
                    }

                %>
            </table>

            <br>
            <a href="profesor.jsp"><input type="submit" name="volverprofesor" value="Volver"></a><br>
            <a href="../index.jsp"><input type="submit" name="cerrarsesion" value="Cerrar Sesión"></a><br>
        </form>
    </body>
</html>
