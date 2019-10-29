<%-- 
    Document   : gestionusuarios
    Created on : 29-oct-2019, 9:15:43
    Author     : Celia
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Datos.Profesor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestión de usuarios</title>
        <link rel="stylesheet" type="text/css" href="../css/miestilo.css">
    </head>
    <body>
        <header>
            <h1>Gestión de usuarios</h1>
        </header>
        <form  id="crud" name="CRUD" action="" method="POST">
            <% 
            LinkedList<Profesor> listausuarios = (LinkedList<Profesor>) session.getAttribute("listausuarios");
            for (int i = 0; i < listausuarios.size(); i++) {
                    
                Profesor p = listausuarios.get(i);
                
            
            %>
            <input type="email" name="email" value="<%=p.getUsuario()%>">
            <input type="text" name="nombre" value="<%=p.getNombre()%>">
            <input type="passwd" name="passwd" value="<%=p.getPasswd()%>">
            <button type="submit" name="boton" id="delete" value="Eliminar">Eliminar</button>
            <button type="submit" name="boton" id="modify" value="Modificar">Modificar</button><br>   
            <%
                 }
                 %>   
        </form>
           
                 <a href="admingeneral.jsp"><button type="button" name="Volver">Volver</button></a>
                 <a href="../registro.jsp"><button type="button" name="anadir">Añadir</button></a>
    </body>
</html>
