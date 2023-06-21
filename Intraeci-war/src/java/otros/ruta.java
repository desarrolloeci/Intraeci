/*
 * ruta.java
 *
 * Created on 3 de noviembre de 2006, 09:59 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package otros;

import java.io.File;


public class ruta {
    
    /** Creates a new instance of ruta */
    public ruta() {
    }
    
    public String valruta(){
        String ruta;
        ruta = new String("/usr/local/SUN/config/");
        File arc = new File(ruta);
        if (arc.exists()){
            return ruta;
        }
        else{
            ruta = new String("C:/Sun/AppServer/config/");
            return ruta;
        }
    }
}
