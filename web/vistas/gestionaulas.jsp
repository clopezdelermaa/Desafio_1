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
                var nuevaclase = "<tr><td><input type='text' name='aula' value=''></td><td><input type='text' name='descripcion' value=''></td><td><input type='button' name='editar' value='Editar'></td><td><input type='button' name='borrar' value='Borrar'></td><td><input type='button' name='guardar' value='Guardar'></td></tr>";
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


        <table id="aulario">
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
                    <td><input type="button" name="guardar" value="Guardar"></td>
                        <%

                            if (request.getParameter("guardar") != null) {
                                ConexionEstatica.nueva();
                                int cod_aula = Integer.parseInt(request.getParameter("aula"));
                                String descripcion = request.getParameter("descripcion");
                                ConexionEstatica.Insertaraula(cod_aula, descripcion);
                        }%>
                </tr>
                <%
                    }

                %>
            </tbody>  

        </table>
        <input type="button" name="add" value="Añadir Aula" onclick="nuevaaula();"> 


        <a href="admingeneral.jsp"><input type="button" name="volver" value="Volver"></a>

        <a href="../index.jsp"><input type="submit" name="cerrarsesion" value="Cerrar Sesión"></a><br>
    </body>
</html>
