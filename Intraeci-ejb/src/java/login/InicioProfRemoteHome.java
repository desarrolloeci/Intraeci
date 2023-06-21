
package login;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.RemoveException;
import javax.ejb.EJBHome;


/**
 * This is the home interface for InicioProf enterprise bean.
 */
public interface InicioProfRemoteHome extends EJBHome {
    
    //InicioProfRemote create(String info, String clave)  throws CreateException, RemoteException;
    InicioProfRemote create(String info)  throws CreateException, RemoteException;
    InicioProfRemote create()  throws CreateException, RemoteException;
    
}
