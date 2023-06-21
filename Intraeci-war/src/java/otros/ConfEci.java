/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package otros;

import java.io.File;
import java.io.FileInputStream;
import java.util.Properties;

/**
 *
 * @author alexgz
 */
public class ConfEci {
    private String perAcad ;        /* Periodo Academico Actual */
    private String perAcadSig ;     /* Periodo Academico Siguiente */
     private String IPbd ;           /* Direccion IP donde recide la Base de Datos*/ 
    private String usuBdReg ;       /* Usuario de la Base de Datos Registro*/ 
    private String passBdReg ;      /* Password de la Base de Datos Registro*/
    private String usuBdApolo ;     /* Usuario de la Base de Datos Apolo*/     
    private String passBdApolo ;    /* Password de la Base de Datos Apolo*/      
    private String dirmodreg ;    /* Dirección ip del modificador de registro*/   
    private String perHorario ;     /* Periodo Academico Siguiente */    
    private String msjerror; 
    private String perOrdenes;
    private String perOrdenesPos;
    private String perInscripciones;
    private int ValInscrip;
    private String perIntermedio;
    private String perAcadPreins ;     /* Periodo Academico para preinscripcion */
    /** Creates new configECI */
    public ConfEci() {   
        String ruta;
        ruta = new String("/usr/local/tomcat5.5/confEci/");
        File arc = new File(ruta);
        if (!arc.exists())
            ruta = new String("C:/Tomcat 5.5/confEci/");
        String FICHERO_CONFIGURACION = ruta + "ServEci.properties";
        Properties propiedades;
        try {
            FileInputStream f = new FileInputStream(FICHERO_CONFIGURACION);
            propiedades = new Properties();
            propiedades.load(f);
            f.close();
            this.perAcad = propiedades.getProperty("perAcad");
            this.perAcadSig = propiedades.getProperty("perAcadSig");
            this.IPbd = propiedades.getProperty("IPbd");
            this.usuBdReg= propiedades.getProperty("usuBdReg");
            this.passBdReg = propiedades.getProperty("passBdReg");
            this.usuBdApolo= propiedades.getProperty("usuBdApolo");
            this.passBdApolo = propiedades.getProperty("passBdApolo");
            this.dirmodreg = propiedades.getProperty("dirmodreg");
            this.perHorario = propiedades.getProperty("perHorario");
            this.perOrdenes = propiedades.getProperty("perOrdenes");
            this.perOrdenesPos = propiedades.getProperty("perOrdenesPos");
            this.perInscripciones = propiedades.getProperty("perInsc");
            this.ValInscrip = Integer.parseInt(propiedades.getProperty("ValInsc"));
            this.perIntermedio = propiedades.getProperty("perIntermedio");
            this.perAcadPreins = propiedades.getProperty("perAcadPreins");
        } catch (Exception e) {
            msjerror = "ERROR: " + e.getMessage();
        }
    }
    
    /**
    * @return String Periodo Actual Para las operaciones de registro
    */  
    public String getPeriodoActual (){
        return  this.perAcad;
    }

   
    /**
    * @return String Periodo Siguiente Para las operaciones de registro
    */  
    public String getPeriodoHor (){
        return  this.perHorario;
    }


    /**
     *
     * @return
     */
    public String getPeriodoSig(){
        return  this.perAcadSig;
    }
    
    /**
    * @return String Direccion IP de la Base de Datos
    */  
    public String getIPBd(){
        return  this.IPbd;
    }

    /**
    * @return String Usuario de la Base de Datos de Registro
    */      
    public String getUsuarioBdReg(){
        return  this.usuBdReg;
    }

    /**
    * @return String Password de la Base de Datos de Registro
    */  
    public String getPasswdBdReg(){
        return  this.passBdReg;
    }
    
    /**
    * @return String Usuario de la Base de Datos de Apolo
    */  
    public String getUsuarioBdApolo(){
        return  this.usuBdApolo;
    }
    
        /**
    * @return String Password de la Base de Datos de Apolo
    */  
    public String getPasswdBdApolo(){
        return  this.passBdApolo;
    }
    
    /**
     *
     * @return
     */
    public String getDirModReg(){
        return  this.dirmodreg;
    }
    
    /**
     *
     * @return
     */
    public String getPerOrdenes(){
        return  this.perOrdenes;
    }


    public String getPerOrdenesPos(){
        return  this.perOrdenesPos;
    }
    /**
     *
     * @return
     */
    public String getPerInscripciones(){
        return this.perInscripciones;
    }
    
    /**
     *
     * @return
     */
    public int getValInscrip(){
        return this.ValInscrip;
    }
    
    /**
     *
     * @return
     */
    public String getperIntermedio(){
        return this.perIntermedio;
    }
}
