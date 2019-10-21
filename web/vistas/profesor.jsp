<%-- 
    Document   : profesor
    Created on : 20-oct-2019, 11:30:34
    Author     : PC
--%>

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
        <%

            /* Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("MM/dd/yyyy");
            Date fecha = ft.format(dNow);  */
            LinkedList<Aula> listaulas = ConexionEstatica.Obteneraulas();


        %>
        <form name="formularioprofesor" action="" method="POST">
            Elija fecha<input type="date" id="fecha" name="fecha" value="" min=""><br>
            Elija aula
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
                        <td>8:30</td>
                        <td>9:25</td>
                        <td></td>
                    </tr>
                     <tr>
                        <td>9:25</td>
                        <td>10:20</td>
                        <td></td>
                    </tr>
                     <tr>
                        <td>10:20</td>
                        <td>11:15</td>
                        <td></td>
                    </tr>
                     <tr>
                        <td>11:45</td>
                        <td>12:40</td>
                        <td></td>
                    </tr>
                     <tr>
                        <td>12:40</td>
                        <td>13:35</td>
                        <td></td>
                    </tr>
                     <tr>
                        <td>13:35</td>
                        <td>14:30</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <br>
            <input type="submit" name="volverindex" value="Volver"><br>
            <input type="submit" name="cerrarsesion" value="Cerrar Sesión"><br>
        </form>
    </body>
</html>
