<%-- 
    Document   : admingeneral
    Created on : 20-oct-2019, 11:30:06
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="../css/miestilo.css">
    </head>
    <body>
        <header>
            <h1>Administrador General</h1>
        </header>
        <nav>
            <ul>
                <li><a href="#">Gestión de usuarios</a></li>
                <li><a href="#">Ver Bitácora</a></li>
                <li>
                    <a href="#">Aulas</a>
                    <ul>
                        <li><a href="#">Ver cuadrante</a></li>
                        <li><a href="gestionaulas.jsp">Gestión de aulas</a></li>
                        <li><a href="gestionhoras.jsp">Gestión de horas</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        
    </body>
</html>
