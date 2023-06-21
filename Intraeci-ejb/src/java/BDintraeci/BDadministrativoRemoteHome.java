
package BDintraeci;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;


/**
 * This is the home interface for BDadministrativo enterprise bean.
 */
public interface BDadministrativoRemoteHome extends EJBHome {
    
    BDadministrativoRemote create()  throws CreateException, RemoteException;
    
    
}
