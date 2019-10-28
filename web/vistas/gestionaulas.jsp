<%-- 
    Document   : gestionaulas
    Created on : 21-oct-2019, 12:25:49
    Author     : Celia
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
        <title>Gestión de aulas</title>
        <link rel="stylesheet" type="text/css" href="../css/miestilo.css">
        <script>
            function nuevaaula() {
                var nuevaclase = "<tr><td><input type='text' name='aula' value=''></td><td><input type='text' name='descripcion' value=''></td><td><input type='button' name='editar' value='Editar'></td><td><input type='button' name='borrar' value='Borrar'></td></tr>";
                document.getElementById("aulas").innerHTML += nuevaclase;
            }
            function borraraula() {
                var aulaborrar;
                document.getElementById("clases").innerHTML -= aulaborrar;
            }
        </script>
    </head>
    <body>
        <br>
        <h1>Gestión de aulas</h1>
        <br>


        <table>
            <thead>
                <tr>
                    <th>NOMBRE</th>
                    <th>DESCRIPCION</th>
                </tr>
            </thead>
            <tbody id="aulas">
                <tr id="clases">
                    <%
                        LinkedList<Aula> listaula = (LinkedList<Aula>) session.getAttribute("listaula");

                        for (int i = 0; i < listaula.size(); i++) {
                            Aula a = listaula.get(i);

                    %>
                    <td><input type="text" name="aula" value="<%=a.getCod_Aula()%>"></td>
                    <td><input type="text" name="descripcion" value="<%=a.getDescripcion()%>"></td>
                    <td><input type="button" name="editar" value="Editar"></td>
                    <td><input type="button" name="borrar" value="Borrar" onclick="borraraula()"></td>

                </tr>
                <%
                    }
                %>
            </tbody>  
            
        </table>
            <input type="button" name="add" value="Añadir Aula" onclick="nuevaaula();"> 

        <a href="admingeneral.jsp"><input type="button" name="volver" value="Volver"></a>
    </body>
</html>
