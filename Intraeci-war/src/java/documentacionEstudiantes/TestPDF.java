/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package documentacionEstudiantes;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;

/**
 *
 * @author andres.rojas
 */
public class TestPDF {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        OpenPDF openPDF = new OpenPDF();
        openPDF.abrirErchivoPdf("");
    }
    
}
