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
 * Clase aula con todos los atributos de la misma
 */
public class Aula {
    private int cod_Aula;
    private String Descripcion;
    private String estado;
    
  //-----------------CONSTRUCTOR-----------------

    public Aula(int cod_Aula, String Descripcion) {
        this.cod_Aula = cod_Aula;
        this.Descripcion = Descripcion;
    }
    
    
    
    public Aula(int cod_Aula, String Descripcion, String estado) {
        this.cod_Aula = cod_Aula;
        this.Descripcion = Descripcion;
        this.estado = estado;
    }
    
    
    //----------------GETTER Y SETTER----------------

    public int getCod_Aula() {
        return cod_Aula;
    }

    public void setCod_Aula(int cod_Aula) {
        this.cod_Aula = cod_Aula;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
      //----------------TO STRING-------------

    @Override
    public String toString() {
        return "Aula{" + "cod_Aula=" + cod_Aula + ", Descripcion=" + Descripcion + '}';
    }
    
    
}
