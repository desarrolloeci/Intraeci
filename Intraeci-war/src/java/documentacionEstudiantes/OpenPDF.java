/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package documentacionEstudiantes;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.util.logging.Logger;

/**
 *
 * @author andres.rojas
 */
public class OpenPDF {
    public Boolean abrirErchivoPdf(String path){
        Boolean ans = false;
        /**
        if (Desktop.isDesktopSupported()) {
            try {
                File myFile = new File(path);
                Desktop.getDesktop().open(myFile);
                ans=true;
            } catch (IOException ex) {
                System.out.println("ERROR abriendo el PDF");
            }
        }
        * */
        
        
        try {
            
            if ((new File(path)).exists()) {
                Process p = Runtime
                   .getRuntime()
                   .exec("rundll32 url.dll,FileProtocolHandler "+path);
                p.waitFor();
                ans=true;
            }
        } catch (Exception ex) {
        }
        return ans;
    }
}
