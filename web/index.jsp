<%-- 
    Document   : index
    Created on : 21-oct-2019, 10:54:43
    Author     : daw206
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link rel="stylesheet" type="text/css" href="css/miestilo.css">
    </head>
    <body>
        <div>
            <form name="indice" action="controlador.jsp" method="POST">
                <label for="usuario">Usuario</label>
                <input type="usuario" name="usuario" id="usuario" placeholder="Introduzca su usuario"><br>
                
                <label for="pass">Contraseña</label>
                <input type="password" name="passwd" id="passwd" placeholder="Escriba su contraseña"><br>
                
                <a href="registro.jsp">Registrarse</a>
                <a href="recuperarpasswd.jsp">¿Ha olvidado su contraseña?</a><br>
                
                <input type="submit" name="aceptarlogin" value="Aceptar">
            </form>
        </div>
        
    </body>
</html>
