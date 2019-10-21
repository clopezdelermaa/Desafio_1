<%-- 
    Document   : gestionaulas
    Created on : 21-oct-2019, 12:25:49
    Author     : daw206
--%>

<%@page import="Conexiones.ConexionEstatica"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Datos.Aula"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/miestilo.css">
    </head>
    <body>
        <%
            LinkedList<Aula> listaulas = ConexionEstatica.Obteneraulas();
            Aula a;
            for (int i = 0; i <listaulas.size(); i++) {
                a = listaulas.get(i);
                

        %>
        <table>
            <thead>
                <tr>
                    <th>NOMBRE</th>
                    <th>DESCRIPCION</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" name="aula1" value="<%=a.getCod_Aula()%>"></td>
                    <td><input type="text" name="descripcion1" value="<%=a.getDescripcion()%>"></td>
                    <td><input type="button" name="editar" value="Editar"></td>
                    <td><input type="button" name="borrar" value="Borrar"></td>
                </tr>
                <tr>
                    <td><input type="text" name="aula1" value="<%=a.getCod_Aula()%>"></td>
                    <td><input type="text" name="descripcion1" value="<%=a.getDescripcion()%>"></td>
                    <td><input type="button" name="editar" value="Editar"></td>
                    <td><input type="button" name="borrar" value="Borrar"></td>
                </tr>
                <tr>
                    <td><input type="text" name="aula1" value="<%=a.getCod_Aula()%>"></td>
                    <td><input type="text" name="descripcion1" value="<%=a.getDescripcion()%>"></td>
                    <td><input type="button" name="editar" value="Editar"></td>
                    <td><input type="button" name="borrar" value="Borrar"></td>
                </tr>
                <tr>
                    <td><input type="text" name="aula1" value="<%=a.getCod_Aula()%>"></td>
                    <td><input type="text" name="descripcion1" value="<%=a.getDescripcion()%>"></td>
                    <td><input type="button" name="editar" value="Editar"></td>
                    <td><input type="button" name="borrar" value="Borrar"></td>
                </tr>
                <tr>
                    <td><input type="text" name="aula1" value="<%=a.getCod_Aula()%>"></td>
                    <td><input type="text" name="descripcion1" value="<%=a.getDescripcion()%>"></td>
                    <td><input type="button" name="editar" value="Editar"></td>
                    <td><input type="button" name="borrar" value="Borrar"></td>
                </tr>
                <tr>
                   <td><input type="text" name="aula1" value="<%=a.getCod_Aula()%>"></td>
                    <td><input type="text" name="descripcion1" value="<%=a.getDescripcion()%>"></td>
                    <td><input type="button" name="editar" value="Editar"></td>
                    <td><input type="button" name="borrar" value="Borrar"></td>
                </tr>
            </tbody>
        </table>
        <% }
        %>
        <a href="index.jsp"><input type="button" name="volver" value="Volver"></a>
    </body>
</html>
