<%-- 
    Document   : recuperarpasswd
    Created on : 23-oct-2019, 8:42:36
    Author     : Celia
// Formulario para realizar la recuperación de las contraseñas
--%>

<%@page import="Conexiones.ConexionEstatica"%>
<%@page import="Email.Passwords"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Datos.Profesor"%>
<%@page import="Email.Email"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recuperar contraseña</title>
        <link rel="stylesheet" type="text/css" href="css/miestilo.css">
    </head>
    <body>
        <form name="recuperarpasswd" action="" method="POST">
            <input type="email" name="email" placeholder="Escriba su email">
            <input type="submit" name="recuperar" value="Recuperar Contraseña">
            <%
                Email mail = new Email();
                ConexionEstatica.nueva();
                LinkedList<Profesor> listausuarios = ConexionEstatica.Obtenerusuarios();
                session.setAttribute("usuarios", listausuarios);
                ConexionEstatica.cerrarBD();

                if (request.getParameter("recuperar") != null) {
                    String email = request.getParameter("email");
                    String mensaje = "";
                    String pass = "";
                    boolean enviado = false;

                    pass = Passwords.getPassword(8);

                    mensaje = "Hemos cambiado la contraseña del usuario " + email + " por " + pass;

                    enviado = mail.enviarCorreo(request.getParameter("email"), mensaje, "Recuperar Contraseña");

                    if (enviado) {
                        for (Profesor p : listausuarios) {
                            if (p.getUsuario().equals(email)) {
                                p.setPasswd(pass);
                                session.setAttribute("usuarios", listausuarios);
                            }
                        }

                        out.println("El mensaje para recuperar la contraseña ha sido enviado");
                    } else {
                        out.println("No hemos podido enviar el correo. Por favor, vuelva a intentarlo");
                    }

                }
                

            %>
            <br>

            <a href="index.jsp"><input type="button" name="volver" value="Volver"></a>
        </form>
    </body>
</html>
