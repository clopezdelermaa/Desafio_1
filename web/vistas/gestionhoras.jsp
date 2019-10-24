<%-- 
    Document   : gestionhoras
    Created on : 21-oct-2019, 19:24:40
    Author     : PC
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
    </head>
    <body>
        <%
            LinkedList<Horario> listahoras = ConexionEstatica.Obtenerhoras();
            Horario h;
            for (int i = 0; i < listahoras.size(); i++) {
                h = listahoras.get(i);

        %>
        <table>
            <thead>
                <tr>
                    <th>NÚMERO</th>
                    <th>COMIENZO</th>
                    <th>FINAL</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" name="hora1" value="<%=h.getNumero()%>"></td>
                    <td><input type="text" name="comienzo1" value="<%=h.getComienzo()%>"></td>
                    <td><input type="text" name="final1" value="<%=h.getFin()%>"></td>
                    <td><input type="button" name="reservar" value="Reservar"></td>
                </tr>
                <tr>
                    <td><input type="text" name="hora2" value="<%=h.getNumero()%>"></td>
                    <td><input type="text" name="comienzo2" value="<%=h.getComienzo()%>"></td>
                    <td><input type="text" name="final2" value="<%=h.getFin()%>"></td>
                    <td><input type="button" name="reservar" value="Reservar"></td>
                </tr>
                <tr>
                    <td><input type="text" name="hora3" value="<%=h.getNumero()%>"></td>
                    <td><input type="text" name="comienzo3" value="<%=h.getComienzo()%>"></td>
                    <td><input type="text" name="final3" value="<%=h.getFin()%>"></td>
                    <td><input type="button" name="reservar" value="Reservar"></td>
                </tr>
                <tr>
                    <td><input type="text" name="hora4" value="<%=h.getNumero()%>"></td>
                    <td><input type="text" name="comienzo4" value="<%=h.getComienzo()%>"></td>
                    <td><input type="text" name="final4" value="<%=h.getFin()%>"></td>
                    <td><input type="button" name="reservar" value="Reservar"></td>
                </tr>
                <tr>
                    <td><input type="text" name="hora5" value="<%=h.getNumero()%>"></td>
                    <td><input type="text" name="comienzo5" value="<%=h.getComienzo()%>"></td>
                    <td><input type="text" name="final5" value="<%=h.getFin()%>"></td>
                    <td><input type="button" name="reservar" value="Reservar"></td>
                </tr>
                <tr>
                    <td><input type="text" name="hora6" value="<%=h.getNumero()%>"></td>
                    <td><input type="text" name="comienzo6" value="<%=h.getComienzo()%>"></td>
                    <td><input type="text" name="final6" value="<%=h.getFin()%>"></td>
                    <td><input type="button" name="reservar" value="Reservar"></td>
                </tr>
            </tbody>
        </table>
        <% }
        %>
        <a href="index.jsp"><input type="button" name="volver" value="Volver"></a>
    </body>
</html>
