/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package otros;

import java.io.File;
import java.io.FileInputStream;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.Properties;

/**
 *
 * @author Juan Pablo Garcia
 */
public final class configBPM {

    private String usrAP;
    private String paswdAP;
    private String usrSQL;
    private String paswdSQL;
    private String IPbd;
    private String msjerror = "";

    /** Creates new configECI */
    public configBPM() {

        String FICHERO_CONFIGURACION = getRuta() + "ServBPM.properties";
        Properties propiedades;
        try {
            FileInputStream f = new FileInputStream(FICHERO_CONFIGURACION);
            propiedades = new Properties();
            propiedades.load(f);
            f.close();
            this.usrAP = propiedades.getProperty("usr");
            this.paswdAP = propiedades.getProperty("passwd");
            this.IPbd = propiedades.getProperty("ip");
            this.usrSQL = propiedades.getProperty("usrsql");
            this.paswdSQL = propiedades.getProperty("passwdsql");
        } catch (Exception e) {
            this.msjerror = "ERROR: " + e.getMessage();
        }
    }

    public String getRuta() {
        String ruta;
        ruta = "C:\\Inetpub\\ProgramasExternos\\";
        File arc = new File(ruta);
        if (arc.exists()) {
            return ruta;
        } else {
            ruta = "C:/BPM/";
            arc = new File(ruta);
            if (arc.exists()) {
                return ruta;
            } else {
                ruta = "/usr/local/tomcat5.5/confEci/";
                return ruta;
            }
        }
    }

    public String getIPBd() {
        return this.IPbd;
    }

    public String getusrAP() {
        return this.usrAP;
    }

    public String getpaswdAP() {
        return this.paswdAP;
    }

    public String getusrSQL() {
        return this.usrSQL;
    }

    public String getpaswdSQL() {
        return this.paswdSQL;
    }

    public static class MiAutenticador extends Authenticator {

        configBPM cfgEci = new configBPM();
        String user = cfgEci.getusrAP(); // Login
        String pass = cfgEci.getpaswdAP(); // Password

        @Override
        public PasswordAuthentication getPasswordAuthentication() {
            return (new PasswordAuthentication(user, pass.toCharArray()));
        }
    }
}