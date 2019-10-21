<%-- 
    Document   : controlador
    Created on : 21-oct-2019, 10:57:17
    Author     : daw206
--%>

<%@page import="java.util.LinkedList"%>
<%@page import="Conexiones.ConexionEstatica"%>
<%@page import="Datos.Profesor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //-----Esto es cuando le das a aceptar en el index
    if (request.getParameter("aceptarlogin") != null) {
        ConexionEstatica.nueva();
        String usuario = request.getParameter("usuario");
        Profesor p = ConexionEstatica.Existeusuario(usuario);
        if (p != null) {
            session.setAttribute("usuarioregistrado", p);
            LinkedList<Profesor>listausuarios = ConexionEstatica.Obtenerusuarios();
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
                    
        }
    }
%>
