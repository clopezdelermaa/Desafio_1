/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

/**
 * Creacion de clase horario con el número de la hora, cuando empieza y cuando
 * acaba
 *
 * @author Celia
 * @since 21/10/2019
 */
public class Horario {

    private int numero;
    private String comienzo;
    private String fin;

    //-----------------CONSTRUCTOR-----------------
    public Horario(int numero, String comienzo, String fin) {
        this.numero = numero;
        this.comienzo = comienzo;
        this.fin = fin;
    }

    //----------------GETTER Y SETTER----------------
    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getComienzo() {
        return comienzo;
    }

    public void setComienzo(String comienzo) {
        this.comienzo = comienzo;
    }

    public String getFin() {
        return fin;
    }

    public void setFin(String fin) {
        this.fin = fin;
    }

    //----------------TO STRING-------------
    @Override
    public String toString() {
        return "Horario{" + "numero=" + numero + ", comienzo=" + comienzo + ", fin=" + fin + '}';
    }

}
