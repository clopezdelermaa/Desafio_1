<%-- 
    Document   : adminaula
    Created on : 20-oct-2019, 11:30:22
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adminnistrador de Aula</title>
        <link rel="stylesheet" type="text/css" href="../css/miestilo.css">
    </head>
    <body>
        <form name="adminaula" action="" method="POST">
            <a href="cuadrante.jsp"><input type="button" name="cuadrante" value="Ver cuadrante"></a>
            <br>
            <a href="gestionaulas.jsp"><input type="button" name="gestionaula" value="Gestionar aulas"></a>
            <br>
            <a href="gestionarhorario.jsp"><input type="button" name="gestionhorario" value="Gestionar Franjas Horarias"></a>
            <br>
        </form>
    </body>
</html>
