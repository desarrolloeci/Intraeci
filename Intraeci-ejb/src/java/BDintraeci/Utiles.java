/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BDintraeci;

import java.util.ArrayList;
import java.util.HashMap;
import javax.ejb.SessionBean;
import javax.ejb.SessionContext;
import utiles.ConsultaException;

/**
 *
 * @author Juan Pablo Garcia
 */
public class Utiles extends Persistencia implements SessionBean {

    private SessionContext context;

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
        // TODO implement ejbCreate if necessary, acquire resources
        // This method has access to the JNDI context so resource aquisition
        // spanning all methods can be performed here such as home interfaces
        // and data sources.
    }

    public HashMap[] getListCentroCostos(String nombre) throws Exception {
        return getRegistros("select idcen id, descen nombre, cdcen cod from apolo.uge.centros where descen like '%" + nombre + "%'");
    }

    public HashMap[] getListAsignaturas(String nombre) throws Exception {
        return getRegistros("select id_asig id, nom_asig + ' - ' + cod_asig nombre from registro.asignatura where nom_asig like '%" + nombre + "%' or"+
                   " cod_asig = '" + nombre + "' order by nombre");
    }

    public HashMap[] getListEmpleados(String nombre) throws Exception {
        return getRegistros("select cod_emp, nombres, cod_cl1 cod_ccosto, centro_operativo nom_ccosto, est_lab from dbo.empnomina where nombres like'%" + nombre + "%' order by nombres");
    }

    public HashMap[] getListaCargos(String nombre) throws Exception {
        return getRegistros("SELECT cod_car, nom_car, sal_bas, des_car FROM odi.cargosnomina WHERE nom_car like '%" + nombre + "%' ORDER BY nom_car");
    }
}
