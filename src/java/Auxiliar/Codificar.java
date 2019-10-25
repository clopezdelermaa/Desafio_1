/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Auxiliar;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * Clase para conseguir que las contraseñas no aparezcan en texto plano, sino que estén codificadas
 * @author Celia
 */
public class Codificar {
    
    public static String codifica(String cadplana) {
        String cadCodificada = DigestUtils.md5Hex(cadplana);
        return cadCodificada;
    }
}
