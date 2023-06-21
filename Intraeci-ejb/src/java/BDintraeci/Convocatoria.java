/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BDintraeci;

import java.util.HashMap;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;

/**
 *
 * @author Juan Pablo Garcia
 */
public class Convocatoria extends Persistencia implements SessionBean {

    private SessionContext context;
    private String idEmp;
    private String id;

    // <editor-fold defaultstate="collapsed" desc="EJB infrastructure methods. Click the + sign on the left to edit the code.">;
    // TODO Add code to acquire and use other enterprise resources (DataSource, JMS, enterprise bean, Web services)
    // TODO Add business methods or web service operations
    /**
     * @see javax.ejb.SessionBean#setSessionContext(javax.ejb.SessionContext)
     */
    public void setSessionContext(SessionContext aContext) {
        context = aContext;
    }

    /**
     * @see javax.ejb.SessionBean#ejbActivate()
     */
    public void ejbActivate() {
    }

    /**
     * @see javax.ejb.SessionBean#ejbPassivate()
     */
    public void ejbPassivate() {
    }

    /**
     * @see javax.ejb.SessionBean#ejbRemove()
     */
    public void ejbRemove() {
    }

    // </editor-fold>;
    /**
     * See section 7.10.3 of the EJB 2.0 specification
     * See section 7.11.3 of the EJB 2.1 specification
     */
    public void ejbCreate() {
    }

    public void ejbCreate(String idEmp) {
        this.idEmp = idEmp;
    }

    public void ejbCreate(String idEmp, String idC) {
        this.id = idC;
        this.idEmp = idEmp;
    }

    public HashMap getUsuarioBPM() throws Exception {
        return getRegistro("select ID, NombreCompleto from [10.1.5.207].AuraPortal_BPMS.dbo.AP_WSSV_AP__EmpleadosFichas where CodigoERP='" + idEmp + "'");
    }

   public String getCentroCosto(String responsable) throws Exception {
        return getRegistro("select cod_cl1 from novasoft.dbo.rhh_emplea where cod_emp='" + responsable + "'").get("cod_cl1").toString();
    }

    public int crear(String nombre, String descripcion, String fechaInicio, String fechaFin, String tipo, String asignatura, String periodo, String responsable, String director) throws Exception {
        
        
        if (0 < actualizar("insert into odi.convoca (idcon, nombre, descon,unidad, fini, ffin, tipo, asig,peracad,estado,idadm,dirunidad)"
                + "(select SIG_SEC,'" + nombre + "','" + descripcion+ "','"+ getCentroCosto(responsable) + "','" + fechaInicio + "','" + fechaFin + "','" +tipo + "','0','" + periodo + "', 'Abierta','"+ responsable+"','"+director+"' from registro.secuencias where NOMBRE='CONVOCATORIA')")) {
            if (0 < actualizar("update registro.secuencias set sig_sec=(sig_sec + incr) where nombre='CONVOCATORIA'")) {
                return Integer.parseInt(getRegistro("select (sig_sec - incr) num from registro.secuencias where nombre='CONVOCATORIA'").get("num").toString());
            }
        }
        return -1;
    }
    
    public int editar(String idconv, String nombre, String descripcion, String fechaInicio, String fechaFin, String tipo, String asignatura, String periodo, String responsable, String director) throws Exception {
        if (0 < actualizar( "UPDATE odi.convoca " +
                            "SET nombre = '" + nombre + "', " +
                                "descon = '" + descripcion + "', " +
                                "fini = '" + fechaInicio + "', " +
                                "ffin = '" + fechaFin + "', " +
                                "tipo = '" + tipo + "', " +
                                "peracad = '" + periodo + "', " +
                                "idadm = '" + responsable + "', " +
                                "dirunidad = '" + director + "' " +
                            "WHERE idcon = '" + idconv + "'")) {
            return 1;
        }
        return -1;
    }

    public String getRefProceso(int _Convocatoria) throws Exception {
        return getRegistro("select Referencia from [10.1.5.207].AuraPortal_BPMS.dbo.AP__BPM_Procesos where idMensajeInicioAsc=" + _Convocatoria).get("Referencia").toString();
    }

   public HashMap getConvocatoria() throws Exception {
        return getRegistro("select idcon, nombre, descon, convert(varchar(10),fini,103) fini, convert(varchar(10),ffin,103) ffin, 'Actulizando' unidad, tipo, estado, peracad, isnull(a.nom_asig + ' - ' + a.cod_asig, 'No aplica') asig from odi.convoca c"
                + " left outer join registro.asignatura a on a.id_asig=c.asig"
                + " where c.idcon=" + id);
    }


    public int setEstado(String estado) throws Exception {
        return actualizar("update odi.convoca set estado='" + estado + "' where idcon=" + id);
    }

}
