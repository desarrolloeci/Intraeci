/*
 * PopupAuthenticator.java
 *
 * Created on 11 de mayo de 2007, 02:41 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package utiles;
import javax.mail.*;

 

/**
 *
 * @author alexgz
 */
public class PopupAuthenticator extends Authenticator {
    String usrname;
    String passwd;
    
    public PopupAuthenticator(String usuario, String clave){
        usrname = usuario;
        passwd = clave;
    }
    /** Creates a new instance of PopupAuthenticator */
    public PasswordAuthentication PopupAuthenticator() {
        return new PasswordAuthentication(usrname, passwd);
    }
    
    /*public PasswordAuthentication getPasswordAuthentication(String usuario, String clave) {
        return new PasswordAuthentication(usuario, clave);
  }*/
}
