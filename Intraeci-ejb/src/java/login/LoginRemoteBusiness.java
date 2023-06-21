
package login;


/**
 * This is the business interface for Login enterprise bean.
 */
public interface LoginRemoteBusiness {
    //int getInicio(String usuario, String clave) throws java.rmi.RemoteException;

    java.lang.String getInicio(String usuario, String clave) throws java.rmi.RemoteException;
    java.lang.String getInicioDoble(String codigo) throws java.rmi.RemoteException;
    
}
