/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexiones;

import Auxiliar.Constantes;
import Datos.Aula;
import Datos.Horario;
import Datos.Profesor;
import Datos.Reserva;
import Datos.Roles;
import java.sql.SQLException;
import java.util.LinkedList;
import javax.swing.JOptionPane;

/**
 *
 * @author daw206
 */
public class ConexionEstatica {

    private static java.sql.Connection Conex;
    private static java.sql.Statement Sentencia_sql;
    private static java.sql.ResultSet Conj_registros;

    public static void nueva() {
        try {
            String controlador = "com.mysql.jdbc.Driver";
            Class.forName(controlador);
            String URL_BD = "jdbc:mysql://localhost/" + Constantes.BBDD;
            Conex = java.sql.DriverManager.getConnection(URL_BD, Constantes.usuario, Constantes.password);
            Sentencia_sql = Conex.createStatement();
            System.out.println("Conexión realizada con éxito");

        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }
    }

    public static void cerrarBD() {
        try {
            Conex.close();
            System.out.println("Desconectado de la base de datos");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error al desconectar de la base de datos", JOptionPane.ERROR_MESSAGE);
        }
    }

    /**
     * Metodo para comprobar si el usuario existe en la base de datos con todos
     * los datos asignados a este
     *
     * @param usuario
     * @return
     */
    public static Profesor Existeusuario(String usuario) {
        Profesor existe = null;
        try {
            String sentencia = "SELECT * FROM profesores WHERE usuario='" + usuario + "'";
            Conj_registros = Sentencia_sql.executeQuery(sentencia);
            if (Conj_registros.next()) {
                existe = new Profesor(Conj_registros.getInt("profesores.cod_profesor"), Conj_registros.getString("profesores.nombre"), Conj_registros.getString("profesores.usuario"), Conj_registros.getString("profesores.passwd"));
                if (existe.getRol() == 0) {
                    String sentencia2 = "SELECT RolProfesor.rol FROM profesores, RolProfesor WHERE profesores.cod_profesor=RolProfesor.cod_profesor";
                    Conj_registros = Sentencia_sql.executeQuery(sentencia2);
                    while (Conj_registros.next()) {
                        existe.setRol(Conj_registros.getInt("rol"));
                      
                    }

                }

            }
        } catch (SQLException ex) {
            System.out.println("Error al acceder a la base de datos");
        }
        return existe; // Si el resultado es nulo quiere decir que el usuario no existe en la base de datos
    }

    /**
     * Para comprobar si existe el usuario mediante su email y contraseña para
     * ver si coinciden con lo que hay en la base de datos
     *
     * @param usuario
     * @param passwd
     * @return
     */
    public static boolean Existeusuario2(String usuario) {
        Profesor existe = null;
        boolean esta = false;

        try {
            String sentencia = "select profesores.usuario, RolProfesor.rol from profesores, RolProfesor where profesores.usuario='" + usuario + "' and profesores.cod_profesor= RolProfesor.cod_profesor";
            Conj_registros = Sentencia_sql.executeQuery(sentencia);
            if (Conj_registros.next()) {
                existe = new Profesor(Conj_registros.getInt("cod_profesor"), Conj_registros.getString("nombre"), Conj_registros.getString("usuario"), Conj_registros.getString("passwd"), Conj_registros.getInt("rol"));
            }

        } catch (SQLException ex) {
            System.out.println("Error al acceder a la base de datos");
        }
        return esta; // Si el resultado es nulo es que el usuario no está
    }

    /**
     * Sirve para añadir todos los usuarios a una LinkedList
     *
     * @return lista de los usuarios registrados hecha con LinkedList
     */
    public static LinkedList Obtenerusuarios() {
        LinkedList listausuarios = new LinkedList<>();
        Profesor p = null;

        try {
            String sentencia = "SELECT * FROM profesores";
            Conj_registros = Sentencia_sql.executeQuery(sentencia);
            while (Conj_registros.next()) {
                p = new Profesor(Conj_registros.getInt("cod_profesor"), Conj_registros.getString("nombre"), Conj_registros.getString("usuario"), Conj_registros.getString("passwd"), Conj_registros.getInt("rol"));
                listausuarios.add(p);
            }
        } catch (SQLException ex) {

        }
        return listausuarios;
    }

    /**
     * Sirve para meter los usuarios mediante su direccion de correo (en la base
     * de datos es el campo usuario)
     *
     * @return lista de usuarios hecha por LinkedList
     */
    public static LinkedList Obtenerusuarios2(String usuario) {
        LinkedList listausuarios = new LinkedList();
        Profesor p;
        try {
            String sentencia = "SELECT * FROM profesores WHERE usuario='" + usuario + "'";
            Conj_registros = Sentencia_sql.executeQuery(sentencia);
            while (Conj_registros.next()) {
                p = new Profesor(Conj_registros.getInt("cod_profesor"), Conj_registros.getString("nombre"), Conj_registros.getString("usuario"), Conj_registros.getString("passwd"), Conj_registros.getInt("rol"));
                listausuarios.add(p);
            }
        } catch (SQLException ex) {

        }
        return listausuarios;
    }

    /**
     * Método para obtener todas las aulas que hay en la base de datos y
     * meterlas en una lista
     *
     * @return
     * @since 21/10/2019
     */
    public static LinkedList Obteneraulas() {
        LinkedList listaulas = new LinkedList<>();
        Aula a;
        try {
            String sentencia = "SELECT * FROM aulas";
            Conj_registros = Sentencia_sql.executeQuery(sentencia);
            while (Conj_registros.next()) {
                a = new Aula(Conj_registros.getInt("cod_aula"), Conj_registros.getString("Descripcion"));
                listaulas.add(a);
            }
        } catch (SQLException ex) {

        }
        return listaulas;
    }

    /**
     * Método para meter todas las horas de la franja horaria en una lista y
     * poder manejar con ella
     *
     * @return
     * @since 21/10/2019
     */
    public static LinkedList Obtenerhoras() {
        LinkedList listahoras = new LinkedList<>();
        Horario h;
        try {
            String sentencia = "SELECT * FROM Horario";
            Conj_registros = Sentencia_sql.executeQuery(sentencia);
            while (Conj_registros.next()) {
                h = new Horario(Conj_registros.getInt("numero"), Conj_registros.getString("comienzo"), Conj_registros.getString("final"));
                listahoras.add(h);
            }
        } catch (SQLException ex) {

        }
        return listahoras;
    }

    /**
     * Método para guardar en una LinkedList los datos de las reservas de las
     * aulas
     *
     * @return
     */
    public static LinkedList Obtenerreservas() {
        LinkedList listareservas = new LinkedList<>();
        Reserva r;
        int contres = 0;
        try {
            String sentencia = "SELECT cod_Aula, Descripcion, Comienzo, Final, nombre From Aula, Horario, profesores";
            Conj_registros = Sentencia_sql.executeQuery(sentencia);
            while (Conj_registros.next()) {
                r = new Reserva(contres, Conj_registros.getInt("cod_aula"), Conj_registros.getString("Descripcion"), Conj_registros.getString("Comienzo"), Conj_registros.getString("Final"), Conj_registros.getString("nombre"));
                contres++;
                listareservas.add(r);
            }
        } catch (SQLException e) {

        }
        return listareservas;
    }

    //--------MÉTODOS DE INSERCIÓN, MODIFICACION Y BORRADO PROVISIONALES----------
    public static void ModificarDato(String tabla, String email, int nuevaedad) throws SQLException {
        String sentencia = "UPDATE " + Constantes.tablaprofesores + " SET edad =" + nuevaedad + " WHERE email='" + email + "'";
        Sentencia_sql.executeUpdate(sentencia);
    }

    public static void Insertarprofesores(int cod, String nombre, String usuario, String passwd) throws SQLException {

        String sentencia = "INSERT INTO " + Constantes.tablaprofesores + "VALUES(" + cod + ",'" + nombre + "','" + usuario + "','" + passwd + "')";
        Sentencia_sql.executeQuery(sentencia);

    }

    public static void Insertarusuario(String tabla, String email, String nombre, int edad, String passwd, String tipo) throws SQLException {
        String sentencia = "INSERT INTO " + Constantes.tablaprofesores + " VALUES('" + email + "'," + "'" + nombre + "'," + edad + ", '" + passwd + "'," + "'" + tipo + "')";
        Sentencia_sql.executeUpdate(sentencia);
    }

    public static void Borrarusuario(String tabla, String email) throws SQLException {
        String sentencia = "DELETE FROM " + Constantes.tablaprofesores + " WHERE email ='" + email + "'";
        Sentencia_sql.executeUpdate(sentencia);
    }
}
