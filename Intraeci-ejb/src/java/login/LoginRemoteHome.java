
package login;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;


/**
 * This is the home interface for Login enterprise bean.
 */
public interface LoginRemoteHome extends EJBHome {
    
    LoginRemote create()  throws CreateException, RemoteException;
    
    
}
