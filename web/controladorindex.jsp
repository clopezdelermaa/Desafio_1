<%-- 
    Document   : controlador
    Created on : 21-oct-2019, 10:57:17
    Author     : Celia
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="Datos.Horario"%>
<%@page import="Datos.Aula"%>
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
            ConexionEstatica.nueva();
            LinkedList<Profesor> listausuarios = ConexionEstatica.Obtenerusuarios();
            int cod_profesor = listausuarios.size() + 1;
            String usuario = request.getParameter("email");
            String nombre = request.getParameter("nombre");
            String passwd = request.getParameter("passwd");

            int rol = 0;

            if (request.getParameter("tipo").equals("admingeneral")) {
                rol = 1;
            }
            if (request.getParameter("tipo").equals("adminaula")) {
                rol = 2;
            }
            if (request.getParameter("tipo").equals("profesor")) {
                rol = 3;
            }

            ConexionEstatica.Insertarprofesores(cod_profesor, nombre, usuario, passwd);
            ConexionEstatica.Insertarrol(cod_profesor, rol);
            ConexionEstatica.cerrarBD();
            response.sendRedirect("index.jsp");
        }

//----------------------------- Para volver a la página index desde la pantalla de registro--------------
        if (request.getParameter("volverindex") != null) {
            response.sendRedirect("index.jsp");
        }

//----------------------------------Para guardar las aulas en la sesión ------------------------
        ConexionEstatica.nueva();
        LinkedList<Aula> listaula = ConexionEstatica.Obteneraulas();
        session.setAttribute("listaula", listaula);
        ConexionEstatica.cerrarBD();

//-----------------------------------Para guardar las horas en la sesión------------------------
        ConexionEstatica.nueva();
        LinkedList<Horario> listahoras = ConexionEstatica.Obtenerhoras();
        session.setAttribute("listahoras", listahoras);
        ConexionEstatica.cerrarBD();

//----------------------------------------Para guardar las aulas y las horas en la sesión------------------
        ConexionEstatica.nueva();
        LinkedList<Aula> listaulas = ConexionEstatica.Obteneraulas();
        LinkedList<Horario> listahora = ConexionEstatica.Obtenerhoras();
        session.setAttribute("listahoras", listahora);
        session.setAttribute("listaaulas", listaulas);
        ConexionEstatica.cerrarBD();

//--------------------------------Cuando el usuario pulsa cerrar sesión------------
        if (request.getParameter("cerrarsesion") != null) {
            session.invalidate();
            response.sendRedirect("index.jsp");
        }

//---------------------------------Para obtener todos los usuarios registrados--------------
        ConexionEstatica.nueva();
        LinkedList<Profesor> listausuarios = ConexionEstatica.Obtenerusuarios();
        session.setAttribute("listausuarios", listausuarios);
        ConexionEstatica.cerrarBD();



%>
