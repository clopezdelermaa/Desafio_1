<%-- 
    Document   : registro
    Created on : 21-oct-2019, 13:00:28
    Author     : Celia
// Formulario de registro del usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de usuarios</title>
        <link rel="stylesheet" type="text/css" href="css/miestilo.css">
        <script>
            function passiguales() {
                var c1 = document.getElementById("passwd").value;
                var c2 = document.getElementById("rpasswd").value;
                if (c1 !== c2) {
                    alert("Las contraseñas no coinciden");
                }
            }
        </script>
    </head>
    <body>
        <div>
            <fieldset>

                <form name="formulario" id="registrarse" onsubmit="passiguales()" action="controladorindex.jsp" method="POST">
                    <label for="usuario">Email </label>
                    <input type="email" name="email" id="usuario" required="" placeholder="Escriba su email"><br>

                    <label for="nombre">Nombre </label>
                    <input type="text" name="nombre" id="nombre" required="" placeholder="Escriba su nombre"><br>


                    <label for="clave">Clave </label>
                    <input type="password" name="passwd" id="passwd" required="" placeholder="Escriba su contraseña"><br>

                    <label for="rclave">Repite la clave </label>
                    <input type="password" name="rpasswd" id="rpasswd" required=""  placeholder="Repita su contraseña"><br>

                    <fieldset>
                        <legend>Tipo de usuario</legend>
                        <input type="radio" name="tipo" value="profesor" checked="">Profesor<br>
                        <input type="radio" name="tipo" value="admingeneral">Administrador general<br>
                        <input type="radio" name="tipo" value="adminaula">Administrador de Aula<br>

                    </fieldset>
                    <label for="foto"> Foto de perfil: </label>
                    <input type="file" name="fichero"/></br> 
                    <input type="submit" value="Subir fichero"/> 
                    <br>

                    <input type="submit" name="Registrarse" id="regist" value="Registrarse">
                    <input type="submit" name="volverindex" id="volver" value="Volver">
                </form>
            </fieldset>
        </div>

    </body>
</html>
