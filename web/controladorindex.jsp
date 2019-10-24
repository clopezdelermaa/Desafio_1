<%-- 
    Document   : controlador
    Created on : 21-oct-2019, 10:57:17
    Author     : daw206
--%>

<%@page import="Auxiliar.Codificar"%>
<%@page import="Auxiliar.Bitacora"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Conexiones.ConexionEstatica"%>
<%@page import="Datos.Profesor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //-----Esto es cuando le das a aceptar en el index
    
    if (request.getParameter("inicio") != null) {
        ConexionEstatica.nueva();
            String usuario = request.getParameter("usuario");
            Profesor p = ConexionEstatica.Existeusuario(usuario);
            if (p != null) {
                
                session.setAttribute("user", p.getUsuario());
                
                switch (p.getRol()) {
                    case 1:
                        session.setAttribute("admingeneral", p.getUsuario());
                        response.sendRedirect("vistas/admingeneral.jsp");
                        break;
                    case 2:
                        session.setAttribute("adminaula", p.getUsuario());
                        response.sendRedirect("vistas/adminaula.jsp");
                        break;
                    case 3:
                        session.setAttribute("profesor", p.getUsuario());
                        response.sendRedirect("vistas/profesor.jsp");
                }
               
                Bitacora.Escribirbitacora("Usuario " + p.getUsuario() + " ha entrado en el sistema");
            

        } else {
            response.sendRedirect("vistas/incorrecto.jsp");
        }

        ConexionEstatica.cerrarBD();

    }

//-----------------------Cuando el usuario hace el registro----------------------
    if (request.getParameter("Registrarse") != null) {
        int cod= 0;
        String usuario = request.getParameter("email");
        String nombre = request.getParameter("nombre");
        String passwd = request.getParameter("passwd");
        if (request.getParameter("passwd").equals(request.getParameter("rpasswd"))) {
            String codpasswd = Codificar.codifica(passwd);
        }
        String rol = request.getParameter("tipo");
        ConexionEstatica.nueva();
        ConexionEstatica.Insertarprofesores(cod, nombre, usuario, passwd);
        ConexionEstatica.Insertarrol(cod, Integer.parseInt(rol));
        ConexionEstatica.cerrarBD();
        response.sendRedirect("index.jsp");
    }


%>
