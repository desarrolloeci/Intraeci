/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BDintraeci;

import java.util.HashMap;
import javax.ejb.EJBObject;

/**
 *
 * @author Juan Pablo Garcia
 */
public interface UtilesRemote extends EJBObject {

    public HashMap[] getListCentroCostos(String nombre) throws Exception;

    public HashMap[] getListAsignaturas(String nombre) throws Exception;

    public HashMap[] getListEmpleados(String nombre) throws Exception;

    public HashMap[] getListaCargos(String nombre) throws Exception;
}
