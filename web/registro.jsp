<%-- 
    Document   : registro
    Created on : 21-oct-2019, 13:00:28
    Author     : daw206
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/miestilo.css">
       
    </head>
    <body>
         <div id="regis">
            <fieldset>
                <form name="formulario" action="controlador.jsp" method="POST">
                    <label for="usuario">Email </label>
                    <input type="email" name="email" id="usuario" required="" placeholder="Escriba su email"><br>

                    <label for="nombre">Nombre </label>
                    <input type="text" name="nombre" id="nombre" required="" placeholder="Escriba su nombre"><br>


                    <label for="clave">Clave </label>
                    <input type="password" name="passwd" id="passwd" required="" placeholder="Escriba su contraseña"><br>

                    <label for="rclave">Repite la clave </label>
                    <input type="password" name="rpasswd" id="rpasswd" required="" placeholder="Repita su contraseña" onblur="comprobarContrasena()"><br>

                    <fieldset>
                        <legend>Tipo de usuario</legend>
                        <input type="radio" name="tipo" value="profesor" checked="">Profesor<br>
                        <input type="radio" name="tipo" value="admingeneral">Administrador general<br>
                        <input type="radio" name="tipo" value="adminaula">Administrador general<br>

                    </fieldset>

                    <input type="submit" name="aceptaregistro" id="acept" value="Aceptar">
                    <input type="submit" name="volver" id="volver" value="Volver">
                </form>
            </fieldset>
        </div>
    </body>
</html>
