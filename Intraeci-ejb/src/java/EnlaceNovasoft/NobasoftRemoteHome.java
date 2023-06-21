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
public interface NobasoftRemoteHome extends EJBHome {

    EnlaceNovasoft.NobasoftRemote create()  throws CreateException, RemoteException;
    
    EnlaceNovasoft.NobasoftRemote create(String idEmp, String idC)  throws CreateException, RemoteException;

}
