/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package BDintraeci;

import java.rmi.RemoteException;
import javax.ejb.CreateException;
import javax.ejb.EJBHome;

/**
 *
 * @author Juan Pablo Garcia
 */
public interface ConvocatoriaRemoteHome extends EJBHome {

    BDintraeci.ConvocatoriaRemote create()  throws CreateException, RemoteException;

    BDintraeci.ConvocatoriaRemote create(String idEmp)  throws CreateException, RemoteException;

    BDintraeci.ConvocatoriaRemote create(String idEmp, String idC)  throws CreateException, RemoteException;

}
