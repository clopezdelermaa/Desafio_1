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
 * Creación de la clase roles para asignar los privilegios a cada uno de los usuarios que van a acceder al programa
 */
public class Roles {
    private int rol;
    private String tipo_rol;
    
    //----------------------CONSTRUCTOR---------------

    public Roles(int rol, String tipo_rol) {
        this.rol = rol;
        this.tipo_rol = tipo_rol;
    }
    
    //-----------------GETTER Y SETTER-----------------

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }

    public String getTipo_rol() {
        return tipo_rol;
    }

    public void setTipo_rol(String tipo_rol) {
        this.tipo_rol = tipo_rol;
    }
    
    //----------------- TO STRING ---------------------

    @Override
    public String toString() {
        return "Roles{" + "rol=" + rol + ", tipo_rol=" + tipo_rol + '}';
    }
    
    
}

