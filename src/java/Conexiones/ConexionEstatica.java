/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexiones;

import Auxiliar.Constantes;
import Datos.Aula;
import Datos.Profesor;
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
            
        }catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        }
    }
    
    public static void cerrarBD () {
        try {
        Conex.close();
        System.out.println("Desconectado de la base de datos");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error al desconectar de la base de datos", JOptionPane.ERROR_MESSAGE);
        }
    }
    
    public static Profesor Existeusuario (String usuario) {
        Profesor existe = null;
        try {
            String sentencia = "SELECT * FROM " + Constantes.tablaprofesores + "WHERE usuario='" + usuario + "'";
            Conj_registros = Sentencia_sql.executeQuery(sentencia);
            if (Conj_registros.next()) {
                existe = new Profesor (Conj_registros.getInt("cod_profesor"), Conj_registros.getString("nombre"), Conj_registros.getString("usuario"), Conj_registros.getString("passwd"), Conj_registros.getInt("rol"));
            }
        } catch (SQLException ex) {
            System.out.println("Error al acceder a la base de datos");
        }
        return existe; // Si el resultado es nulo quiere decir que el usuario no existe en la base de datos
    }
    
    public static boolean Existeusuario2 (String usuario, String passwd) {
        Profesor existe = null;
        boolean esta = false;
        
        try {
             String sentencia = "SELECT * FROM " + Constantes.tablaprofesores + "WHERE usuario='" + usuario + "'";
            Conj_registros = Sentencia_sql.executeQuery(sentencia);
            if (Conj_registros.next()) {
                existe = new Profesor (Conj_registros.getInt("cod_profesor"), Conj_registros.getString("nombre"), Conj_registros.getString("usuario"), Conj_registros.getString("passwd"), Conj_registros.getInt("rol"));
            }
            
        }catch (SQLException ex) {
            System.out.println("Error al acceder a la base de datos");
        }
        return esta; // Si el resultado es nulo es que el usuario no está
    }
    
    /**
     * Sirve para añadir todos los usuarios a una LinkedList
     * @return lista de los usuarios registrados hecha con LinkedList
     */
    
    public static LinkedList Obtenerusuarios() {
        LinkedList listausuarios = new LinkedList<>();
        Profesor p = null;
        
        try {
            String sentencia = "SELECT * FROM profesores";
            Conj_registros = Sentencia_sql.executeQuery(sentencia);
            while (Conj_registros.next()) {
               p = new Profesor (Conj_registros.getInt("cod_profesor"), Conj_registros.getString("nombre"), Conj_registros.getString("usuario"), Conj_registros.getString("passwd"), Conj_registros.getInt("rol"));
               listausuarios.add(p);
            }
        } catch (SQLException ex) {
            
        }
        return listausuarios;
    }
    /**
     * Sirve para meter los usuarios mediante su direccion de correo (en la base de datos es el campo usuario)
     * @return lista de usuarios hecha por LinkedList
     */
    
    public static LinkedList Obtenerusuarios2 (String usuario) {
        LinkedList listausuarios = new LinkedList();
        Profesor p;
          try {
            String sentencia = "SELECT * FROM profesores WHERE usuario='" + usuario + "'";
            Conj_registros = Sentencia_sql.executeQuery(sentencia);
            while (Conj_registros.next()) {
               p = new Profesor (Conj_registros.getInt("cod_profesor"), Conj_registros.getString("nombre"), Conj_registros.getString("usuario"), Conj_registros.getString("passwd"), Conj_registros.getInt("rol"));
               listausuarios.add(p);
            }
        } catch (SQLException ex) {
            
        }
        return listausuarios;
    }
    
    public static LinkedList Obteneraulas () {
        LinkedList listaulas = new LinkedList<>();
        Aula a;
        try {
            String sentencia = "SELECT * FROM aulas";
            Conj_registros = Sentencia_sql.executeQuery(sentencia);
            while (Conj_registros.next()) {
                a = new Aula (Conj_registros.getInt("cod_aula"), Conj_registros.getString("Descripcion"));
                listaulas.add(a);
            }
        }catch (SQLException ex) {
            
        }
        return listaulas;
    }
    
    
    //--------MÉTODOS DE INSERCIÓN, MODIFICACION Y BORRADO PROVISIONALES----------
    
     public static void ModificarDato (String tabla, String email, int nuevaedad) throws SQLException {
       String sentencia = "UPDATE " + Constantes.tablaprofesores + " SET edad =" + nuevaedad + " WHERE email='" + email + "'";
       Sentencia_sql.executeUpdate(sentencia);
   }
   
    public static void Insertarprofesores ( int cod, String nombre, String usuario, String passwd) throws SQLException {
        
        String sentencia = "INSERT INTO " + Constantes.tablaprofesores + "VALUES(" + cod + ",'" + nombre + "','" + usuario + "','" + passwd + "')";
        Sentencia_sql.executeQuery(sentencia);
        
    }
     
   public static void Insertarusuario (String tabla, String email, String nombre, int edad, String passwd, String tipo) throws SQLException {
       String sentencia = "INSERT INTO " + Constantes.tablaprofesores + " VALUES('" + email + "'," + "'" + nombre + "'," + edad + ", '" + passwd + "'," + "'" + tipo + "')";
       Sentencia_sql.executeUpdate(sentencia);
   }
   
   public static void Borrarusuario (String tabla, String email) throws SQLException {
       String sentencia = "DELETE FROM " + Constantes.tablaprofesores + " WHERE email ='" + email + "'";
       Sentencia_sql.executeUpdate(sentencia);
   }
}
