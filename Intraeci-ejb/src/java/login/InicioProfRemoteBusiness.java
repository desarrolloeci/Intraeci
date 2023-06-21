
package login;

import java.rmi.RemoteException;
import java.util.Vector;

/**
 * This is the business interface for InicioProf enterprise bean.
 */
public interface InicioProfRemoteBusiness {

    //InicioProfRemote remove() throws RemoveException, java.rmi.RemoteException;

    //java.util.Vector getInfoEmp(String usuario) throws java.rmi.RemoteException, FinderException;
    //String getIdEmp() throws java.rmi.RemoteException;
    String getIdemp() throws RemoteException;

    String getNomemp() throws RemoteException;

    String getApeemp() throws RemoteException;

    String getIdProf() throws RemoteException;

    String getMenu() throws RemoteException;

    void setPeriodo(String periodo) throws RemoteException;

    String getPeriodo() throws RemoteException;

     String getNomProf() throws RemoteException;

    String getClave() throws RemoteException;

    Vector getEstudiantes() throws RemoteException;

    void setEstudiantes(Vector estudiantes) throws RemoteException;

    void limpiaVariables() throws RemoteException;

    void setTercio(String tercio) throws RemoteException;

     void setperAcadPreins(String peracadpreins) throws RemoteException;

    String getTercio() throws RemoteException;

    void setPath(String tercio) throws RemoteException;

    String getPath() throws RemoteException;
    
    String getUsrname() throws RemoteException;
    
    String getUsrExchange() throws RemoteException;
    
    String getDocumProf() throws RemoteException;

    void setTextoCorreo(String texto) throws RemoteException;

    String getTextoCorreo() throws RemoteException;

    void setperHorario(String perhorario) throws RemoteException;

    String getPerHorario() throws RemoteException;

    String getperAcadPreins() throws RemoteException;
    
    String getClanum() throws RemoteException;

}
