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
public interface ConvocatoriaRemote extends EJBObject {

    public int crear(String nombre, String descripcion, String fechaInicio, String fechaFin, String tipo, String asignatura, String periodo, String Responsable, String director) throws Exception;
    
    public int editar(String idconv, String nombre, String descripcion, String fechaInicio, String fechaFin, String tipo, String asignatura, String periodo, String Responsable, String director) throws Exception;

    public String getRefProceso(int _Convocatoria) throws Exception;

    public HashMap getUsuarioBPM() throws Exception;

    public String getCentroCosto() throws Exception;

    public HashMap getConvocatoria() throws Exception;

    public int setEstado(String estado) throws Exception;
}
