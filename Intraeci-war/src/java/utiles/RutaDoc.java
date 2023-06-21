/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package utiles;

/**
 *
 * @author Mario Martínez
 */

import java.io.File;

public class RutaDoc {
    String ruta;
    String carpeta;
    String tempFolder;
            
    public RutaDoc(String carpeta) {
        this.ruta = "/usr/local/SUN/2/glassfish/domains/domain1/docroot/";
        this.carpeta = carpeta + "/";
        this.tempFolder = "temp" + "/";
        
        File file = new File(this.ruta);
        if (!file.exists()) this.ruta = "C:/archivosContextos/";

        file = new File(this.ruta + this.carpeta);
        if (!file.exists()) file.mkdir();
        
        file = new File(this.ruta + this.tempFolder);
        if (!file.exists()) file.mkdir();
    }
    
    public String getRuta() {
        return (this.ruta + this.carpeta);
    }
    
    public String getRutaTemp () {
        return (this.ruta + this.tempFolder);
    }
}
