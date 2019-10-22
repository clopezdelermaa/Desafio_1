<%-- 
    Document   : controlador
    Created on : 21-oct-2019, 10:57:17
    Author     : daw206
--%>

<%@page import="Auxiliar.Bitacora"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Conexiones.ConexionEstatica"%>
<%@page import="Datos.Profesor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //-----Esto es cuando le das a aceptar en el index
    if (request.getParameter("iniciar") != null) {
        ConexionEstatica.nueva();
        if (ConexionEstatica.Existeusuario2(request.getParameter("usuario"), request.getParameter("passwd"))) {
            Profesor p = ConexionEstatica.Existeusuario(request.getParameter("usuario"), request.getParameter("passwd"));
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

    if (request.getParameter("aceptaregistro") != null ) {
        ConexionEstatica.nueva();
        int adming = 0;
        int adminau = 0;
        int cod = 0;
        
        if (request.getParameter("usuario").equals("admingeneral")) {
            adming = 1;
        } else {
            if (request.getParameter("usuario").equals("adminaula")) {
                adminau = 1;
            }
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
