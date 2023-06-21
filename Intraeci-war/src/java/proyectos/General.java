/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectos;

/**
 *
 * @author Juan Pablo Garcia
 */
public class General {

    public static String getColorSemSegui(String tipo) {
        String color = "#FFFFFF";
        if (tipo.equals("V")) {
            color = "#00CC00";
        } else if (tipo.equals("A")) {
            color = "#FFFF66";
        } else if (tipo.equals("R")) {
            color = "#CC0000";
        }
        return color;
    }
}
