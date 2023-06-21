/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BDintraeci;

import java.rmi.RemoteException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.ejb.EJBObject;

/**
 *
 * @author jgarcia
 */
public interface BDproyectoRemote extends EJBObject {

    void conectarBD() throws RemoteException;

    void inicializar(String idEmp) throws Exception;

    void desconectarBD() throws RemoteException;

    ArrayList consultar(String consulta, int nroCampos, int preg) throws RemoteException, SQLException;

    HashMap[] getListaPlanes(String res) throws Exception;

    HashMap[] getListaProyectos() throws Exception;

    HashMap getProyecto(String idproy) throws Exception;

    HashMap[] getlisFases(String idpr) throws Exception;

    HashMap getFase(String idf) throws Exception;

    HashMap[] getLisDedicacion(String idEnt) throws Exception;

    HashMap[] getLisEntregas() throws Exception;

    HashMap getEntregable(String ide) throws Exception;

    HashMap[] getLisSeguimiento(String idpap, String tipo) throws Exception;

    HashMap getSeguimiento(String idseg, String tipo) throws Exception;

    int salSeguimiento(String etapa, String res, String estado, String sem, String ing, String gastp, String otrgas, String inv, String accionTomar, String soporte, String tipo, String avance, String obsv) throws Exception;

    int actualizar(String consulta) throws SQLException, RemoteException;

    int salEntregable(String nombre, String fechaInicio, String fechaFin, String descripcion, String estado, String responsable, String centroCosto, String ingresos, String gastosPer, String otros, String inversion) throws Exception;

    public int salFase(String nombre, String numero, String descripcion, String ano, String mesInicio, String diaInicio, String mesFin, String diaFin, String gastoPerson, String gastoOtros, String inversion, String ingreso, String estado, String caso, String cCosto) throws Exception;

    public int salProyecto(String nombre, String estado, String fechaInicio, String fechaFin, String objetivo, String justificacion, String responsable, String gerente, String tipo, String unidad, String area, String duracion) throws Exception;

    public int salDedicacion(String id, String horas, String semanas, String fechaInicio, String fechaFin) throws Exception;

    public int deleteDedicacion(String id) throws Exception;

    public HashMap[] getResumenSegui() throws Exception;

    public int insertDedicacion(String recurso, String unidad, String horas, String semanas, String fechaInicio, String fechaFin, String idEnt) throws Exception;

    public int insertFase(String nombre, String numero, String descripcion, String ano, String mesInicio, String diaInicio, String mesFin, String diaFin, String gastoPerson, String gastoOtros, String inversion, String ingreso, String estado, String control, String centroCostos) throws Exception;

    public int insertProyecto(String estado, String nombre, String tipo, String fechaInicio, String fechaFin, String duracion, String objetivo, String justificacion, String responsable, String gerente, String unidad, String area) throws Exception;

    public int insertEntregable(String nombre, String responsable, String centroCosto, String fechaInicio, String fechaFin, String descripcion, String estado, String ingresos, String gastosPer, String otros, String inversion) throws Exception;

    public HashMap[] getProyToApro() throws Exception;

    public HashMap getPerXTipo(String tipo) throws RemoteException;

    public void setComentario(String comentario) throws Exception;

    public void setIdPlan(String idPlan) throws RemoteException;

    public void setIdProyecto(String idProyecto) throws RemoteException;

    public void setIdFase(String idFase) throws RemoteException;

    public void setNivelFase(String idUniDir) throws RemoteException;

    public String getIdPlan() throws RemoteException;

    public String getIdFase() throws RemoteException;

    public int setPromFase(String parameter) throws Exception;

    public HashMap<String, HashMap> getPerDir() throws Exception;

    public HashMap[] getListComentario() throws Exception;

    public HashMap[] getLisDedicacionSeguimiento() throws Exception;

    public int salDediSeguim(String idDedSeg, String horas) throws Exception;

    public int salObservacionesSegui(String obsvDir) throws Exception;

    public int deleteDediSegui(String id) throws Exception;

    public int insertDediSegui(String recurso) throws Exception;
}
