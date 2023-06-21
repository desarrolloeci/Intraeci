
package BDintraeci;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;


/**
 * This is the home interface for BDprofesor enterprise bean.
 */
public interface BDprofesorRemoteHome extends EJBHome {
    
    BDprofesorRemote create()  throws CreateException, RemoteException;
    
    
}
