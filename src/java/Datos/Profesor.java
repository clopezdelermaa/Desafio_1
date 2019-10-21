/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

/**
 *
 * @author Celia
 * @since 18/10/2019
 * Clase profesor con todos los atributos del mismo
 */
public class Profesor {
    private int cod_profesor;
    private String nombre;
    private String usuario;
    private String passwd;
    private int rol;
    
    //-----------------CONSTRUCTOR-----------------

    public Profesor(int cod_profesor, String nombre, String usuario, String passwd, int rol) {
        this.cod_profesor = cod_profesor;
        this.nombre = nombre;
        this.usuario = usuario;
        this.passwd = passwd;
        this.rol = rol;
    }

    
    //----------------GETTER Y SETTER----------------
    
    public int getCod_profesor() {
        return cod_profesor;
    }

    public void setCod_profesor(int cod_profesor) {
        this.cod_profesor = cod_profesor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }
    
    //----------------TO STRING-------------

    @Override
    public String toString() {
        return "Profesor{" + "cod_profesor=" + cod_profesor + ", nombre=" + nombre + ", usuario=" + usuario + ", passwd=" + passwd + '}';
    }
    
    
}
