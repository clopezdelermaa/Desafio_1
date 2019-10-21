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
    
//-----------------------Cuando el usuario hace el registro----------------------

    if (request.getParameter("aceptaregistro") != null ) {
        ConexionEstatica.nueva();
        int adming = 0;
        int adminau = 0;
        int cod = 0;
        
        if (request.getParameter("usuario").equals("admingeneral")) {
            adming = 1;
        }
        ConexionEstatica.Insertarprofesores(cod, request.getParameter("nombre"), request.getParameter("email"), request.getParameter("passwd"));
        session.setAttribute("listausuarios", ConexionEstatica.Obtenerusuarios());
        String usuario = (String) (session.getAttribute("usuario"));
        LinkedList<Profesor> listaprofesores = ConexionEstatica.Obtenerusuarios2(usuario);
        session.setAttribute("usuarios", usuario);
        if (session.getAttribute("origen") != null) {
            response.sendRedirect("vistas/admingeneral.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
        ConexionEstatica.cerrarBD();
    }

%>
