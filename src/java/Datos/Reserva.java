/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import java.sql.Date;

/**
 *Creación de la clase reserva para luego almacenar los datos mas tarde
 * @author Celia
 * @since 22/10/2019
 */
public class Reserva {
  private int cod_reserva;
  private int cod_Aula;
  private String Descripcion;
  private String Comienzo;
  private String Fin;
  private Date Fecha;
  private String Profesor;
  
  //---------------------------CONSTRUCTOR----------------------

    public Reserva(int cod_reserva, int cod_Aula, String Descripcion, String Comienzo, String Fin, Date Fecha, String Profesor) {
        this.cod_reserva = cod_reserva;
        this.cod_Aula = cod_Aula;
        this.Descripcion = Descripcion;
        this.Comienzo = Comienzo;
        this.Fin = Fin;
        this.Fecha = Fecha;
        this.Profesor = Profesor;
    }

    public Reserva(int cod_reserva, int cod_Aula, String Descripcion, String Comienzo, String Fin, String Profesor) {
        this.cod_reserva = cod_reserva;
        this.cod_Aula = cod_Aula;
        this.Descripcion = Descripcion;
        this.Comienzo = Comienzo;
        this.Fin = Fin;
        this.Profesor = Profesor;
    }

    
    
     //--------------------------GETTER Y SETTER------------------------
  
    public int getCod_reserva() {
        return cod_reserva;
    }


    public void setCod_reserva(int cod_reserva) {
        this.cod_reserva = cod_reserva;
    }

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

    public String getComienzo() {
        return Comienzo;
    }

    public void setComienzo(String Comienzo) {
        this.Comienzo = Comienzo;
    }

    public String getFin() {
        return Fin;
    }

    public void setFin(String Fin) {
        this.Fin = Fin;
    }

    public Date getFecha() {
        return Fecha;
    }

    public void setFecha(Date Fecha) {
        this.Fecha = Fecha;
    }

    
    

    public String getProfesor() {
        return Profesor;
    }

    public void setProfesor(String Profesor) {
        this.Profesor = Profesor;
    }
    
    //----------------------TO STRING ------------------------

    @Override
    public String toString() {
        return "Reserva{" + "cod_reserva=" + cod_reserva + ", cod_Aula=" + cod_Aula + ", Descripcion=" + Descripcion + ", Comienzo=" + Comienzo + ", Fin=" + Fin + ", Fecha=" + Fecha + ", Profesor=" + Profesor + '}';
    }

   
    
  
}
