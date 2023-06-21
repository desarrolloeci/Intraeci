/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package EnlaceNovasoft;

import BDintraeci.*;
import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

/**
 *
 * @author Juan Pablo Garcia
 */
public interface EnlaceRemoteHome extends EJBHome {

    EnlaceNovasoft.EnlaceRemote create()  throws CreateException, RemoteException;
    
    
    EnlaceNovasoft.EnlaceRemote create(String idEmp, String idC)  throws CreateException, RemoteException;

}
