/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package EnlaceNovasoft;

import BDintraeci.*;
import Dto.conciliacion;
import java.util.HashMap;
import java.util.List;
import javax.ejb.EJBObject;

/**
 *
 * @author Juan Pablo Garcia
 */
public interface EnlaceRemote extends EJBObject {

    public List<conciliacion> getListEnlace(String fechaIni,String fechaFin) throws Exception;

}
