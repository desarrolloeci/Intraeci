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
public interface AspiranteRemoteHome extends EJBHome {

    BDintraeci.AspiranteRemote create()  throws CreateException, RemoteException;
    
}
