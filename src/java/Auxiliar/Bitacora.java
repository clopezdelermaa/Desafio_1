/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Auxiliar;
import java.io.FileWriter;
import java.io.IOException;

/**
 *
 * @author Celia 
 * @since 18/10/2019
 * Clase bitacora que almacenará los datos de registro dentro de un fichero txt
 */
public class Bitacora {
    /**
     * Método para escribir en el archivo de bitácora
     * Este archivo estará creado en el servidor: glassfish5(en este caso)/glassfish/domains/domains1/config
     * @param m 
     */
    public static void Escribirbitacora (String m) {
        FileWriter fw = null;
        System.out.println(m);
        try {
            fw = new FileWriter(Constantes.ficherobitacora, true);
            fw.write(m + "\r\n");
            fw.close();
        }catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
