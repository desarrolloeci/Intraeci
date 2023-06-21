package BDintraeci;

import java.rmi.RemoteException;
import javax.ejb.*;
import java.util.Properties;
import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;
import javax.sql.*;
import javax.naming.*;

/**
 * This is the bean class for the BDadministrativoBean enterprise bean. Created
 * 14/02/2007 03:46:07 PM
 *
 * @author
 */
public class BDadministrativoBean implements SessionBean, BDadministrativoRemoteBusiness {

    private SessionContext context;
    private boolean conectado;
    private static final String dbName = "jdbc/registro";
    // private static final String dbNameApolo = "jdbc/registro";
    private static final String dbNameApolo = "jdbc/definitivo";
    // private static final String dbName = "jdbc/definitivo";
    private Connection con;
    protected String mensaje, retorno = new String();

    // <editor-fold defaultstate="collapsed" desc="EJB infrastructure methods. Click the + sign on the left to edit the code.">
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
    // </editor-fold>

    /**
     * See section 7.10.3 of the EJB 2.0 specification See section 7.11.3 of the
     * EJB 2.1 specification
     */
    public void ejbCreate() {
        // TODO implement ejbCreate if necessary, acquire resources
        // This method has access to the JNDI context so resource aquisition
        // spanning all methods can be performed here such as home interfaces
        // and data sources.
    }

    // Add business logic below. (Right-click in editor and choose
    // "EJB Methods > Add Business Method" or "Web Service > Add Operation")
    private void conectarBD() {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup(dbName);
            con = ds.getConnection();
            conectado = true;
        } catch (Exception ex) {
            conectado = false;
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
    }

    private void conectarBDAPOLO() {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup(dbNameApolo);
            con = ds.getConnection();
            conectado = true;
        } catch (Exception ex) {
            conectado = false;
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
    }

    private void desconectarBD() {
        try {
            con.close();
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
    }

    private Vector consultar(String consulta, int nroCampos, int preg) throws SQLException {
        int cont;
        String valor, nd = new String("No disponible");
        Vector info = new Vector();
        Vector lista = new Vector();
        PreparedStatement prepStmt = con.prepareStatement(consulta);
        ResultSet rs = prepStmt.executeQuery();
        try {
            while (rs.next()) {
                Vector obj = new Vector();
                for (cont = 1; cont <= nroCampos; cont++) {
                    valor = rs.getString(cont);
                    if (rs.wasNull()) {
                        obj.addElement(nd);
                    } else {
                        obj.addElement(valor);
                    }
                }
                lista.addElement(obj);
            }
        } catch (SQLException e) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + e.getMessage();
        }
        prepStmt.close();
        if (lista.size() > 0 && preg == 0) {
            info = (Vector) lista.elementAt(0);
        } else if (preg == 1) {
            return lista;
        }
        return info;
    }

    public String getSecuencia() {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select sig_sec  "
                + " from registro.secuencias"
                + " where registro.secuencias.nombre='RESERVAS' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        if (retorno.size() > 0) {
            return (String) retorno.elementAt(0);
        } else {
            return "0";
        }
    }

    public Vector Fecha() {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select  DATEPART(year,GETDATE()) as 'Year', DATEPART(month,GETDATE()) as 'Mes' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //  String consulta = "";
    public Vector getCantReserva(java.lang.String idprof) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select sum(tblq) "
                + " from registro.usosalon, registro.salones "
                + " where prof='" + idprof + "' and registro.salones.id_sal=registro.usosalon.id_sal "
                + " and estad='S' and convert(varchar, fecuso, 102) >= convert(varchar, getdate(), 102) ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Cuenta reservas Polideportivo
    public Vector getCantReservaPoli(java.lang.String idprof) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select count (iduso) "
                + " from registro.usosalon, registro.salones "
                + " where prof='" + idprof + "' and registro.salones.id_sal=registro.usosalon.id_sal "
                + " and estad='S' and convert(varchar, fecuso, 102) >= convert(varchar, getdate(), 102) ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector getConSalon(java.lang.String rcsal, java.lang.String capac, java.lang.String fecha, java.lang.String hora, java.lang.String ndia, int horafin, String peracad) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select id_sal, cod_sal from registro.salones where disponible = 1 "
                + "and rcsal = '" + rcsal + "' and cap_max_sal >= '" + capac + "' "
                + "and id_sal not in (select id_sal from registro.usosalon "
                + "where convert(varchar, fecuso, 103) = convert(varchar, '" + fecha + "', 103) "
                + "and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > " + hora
                + ") )and estad = 'S') and id_sal not in (select id_sal from registro.sal_grupo "
                + "where per_acad = '" + peracad + "' and ((hora_ini >= " + hora + " and hora_ini < " + horafin + ") or "
                + "(hora_fin <= " + horafin + " and hora_fin > " + hora + ")) and dia = '" + ndia + "' ) "
                + "order by cap_max_sal ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

//verifica reserva salones examenes
    public Vector getConSalonExa(java.lang.String rcsal, java.lang.String capac, java.lang.String fecha, java.lang.String hora, java.lang.String ndia, int horafin, String peracad) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select id_sal, cod_sal from registro.salones where disponible = 1 "
                + " and rcsal = '" + rcsal + "' and cap_max_sal >= '" + capac + "' and id_sal not in (select id_sal from registro.usosalon "
                + " where convert(varchar, fecuso, 103) = convert(varchar, '" + fecha + "', 103) "
                + " and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > " + hora + ") )and estad = 'S') and id_sal not in (select sal_ex from registro.grupo "
                + " where per_acad = '" + peracad + "' and ((hora_ex >= " + hora + " and hora_ex < " + horafin + ") ) and dia_ex = '" + ndia + "' and sal_ex is not null)"
                + " order by cap_max_sal");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Verifcar si el coliseo esta reservado
    public Vector getConSalonPoli(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select count(*)  from registro.usosalon "
                + "where id_sal = 139   and estad='S'  "
                + " and convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and ( (hora >=  700 and hora < 1900) or (hfin <= 1900 and hfin > 700 "
                + ") ) ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
    //

    public Vector getConSalonUnico(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select count(*)  from registro.usosalon "
                + "where id_sal in (select id_sal from registro.salones where cod_sal like 'P-%')    "
                + " and convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "' "
                + ") ) ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Baloncesto completo
    public Vector BaloncestoC(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select count(*)  from registro.usosalon, registro.salones "
                + "where registro.usosalon.id_sal= registro.salones.id_sal  and estad='S'  and cod_sal like 'P-BAL%' "
                + " and convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "' "
                + ") ) ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //futbol sala
    public Vector Futbolsala(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select count(*)  from registro.usosalon, registro.salones "
                + "where registro.usosalon.id_sal= registro.salones.id_sal  and estad='S'  and (registro.salones.id_sal= " + idsal + " or cod_sal like 'P-VOL%')  "
                + " and convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "' "
                + ") ) ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

//Espejos-squash-arte-ARTE
    public Vector espejos(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select count(*)  from registro.usosalon "
                + "where id_sal= " + idsal + "  and estad='S'  "
                + " and convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "' "
                + ") ) ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

//Baloncesto -voleiboll media cancha
    public Vector BaloncestoM(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select count(*)  from registro.usosalon, registro.salones "
                + "where registro.usosalon.id_sal= registro.salones.id_sal  and estad='S' and cod_sal like 'P-BALM%' "
                + " and convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "' "
                + ") ) ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector Baloncesto(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select count(*)  from registro.usosalon "
                + "where id_sal= 130   and estad='S' "
                + " and convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "' "
                + ") ) ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //id del salon que sirve
    public Vector minimoBal(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select min(id_sal)  from registro.salones "
                + "where cod_sal like  'P-BALM%' and id_sal not in (select id_sal from registro.usosalon where "
                + "convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and  (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "' "
                + ") ) ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //volley
    public Vector Volley(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select count(*)  from registro.usosalon,registro.salones "
                + "where registro.usosalon.id_sal = registro.salones.id_sal  and estad='S' and cod_sal like 'P-VOL%' and "
                + "convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and  ((hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "') "
                + ")  ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //cant1 otra cancha de volley
    public Vector VolleyO(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select count(*)  from registro.usosalon "
                + "where id_sal= 133   and estad='S' "
                + " and convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "' "
                + ") ) ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

//mínimo volley
    public Vector minimoVol(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select min(id_sal)  from registro.salones "
                + "where cod_sal like  'P-VOL%' and id_sal not in (select id_sal from registro.usosalon where "
                + "convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "') "
                + ") ) ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Tenis de mesa
    public Vector Tenis(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select count(*)  from registro.usosalon,registro.salones "
                + "where registro.usosalon.id_sal = registro.salones.id_sal  and estad='S' and cod_sal like 'P-TDM%' and "
                + "convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and  ((hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "') "
                + ")  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //mínimo Tenis
    public Vector minimoTenis(java.lang.String idsal, java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select min(id_sal)  from registro.salones "
                + "where cod_sal like  'P-TDM%' and id_sal not in (select id_sal from registro.usosalon where "
                + "convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "') "
                + ") ) ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Buscar tarifas coliseo
    public Vector tarifas(java.lang.String idsal) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select tarifa_emp from registro.salones where id_sal = '" + idsal + "' ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //PAra reservar todo el coliseo
    public Vector getConSalonPoliEv(java.lang.String rcsal, java.lang.String fecha, java.lang.String hora, int horafin, String capac) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select count(*)  from registro.usosalon "
                + "where id_sal in (select id_sal from registro.salones  "
                + "  where cod_sal like 'P-%') and convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  "
                + " and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "') "
                + ") ");


        /*         consulta = new String(" select count(*), id_sal, cod_sal, tarifa_emp  from registro.usosalon " +
         "where (rcsal = '" + rcsal + "' or rc_sal = 'X')  " +
         " and convert(varchar, fecuso, 103) = convert(varchar,  '" + fecha + "', 103)  " +
         " and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > '" + hora + "' "+
         ") ) group by id_sal, cod_sal,tarifa_emp ");*/
        /*   consulta = new String("select  registro.salones.id_sal, cod_sal, registro.salones.cap_max_sal, tarifa_emp from registro.salones " +
         "where disponible = 1 and tipo_sal = '5' and rcsal like '%' and registro.salones.cap_max_sal >= 1 and  " +
         "registro.salones.cap_max_sal > isnull((select sum(cap) from registro.cap_usosalon where convert(varchar, fecuso, 103) = convert(varchar, '" + fecha + "', 103) and " +
         "((hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > " + hora + "))and registro.cap_usosalon.estad='S'),0) and ('" + capac + "'+isnull((select sum(cap) from registro.cap_usosalon " +
         "where convert(varchar, fecuso, 103) = convert(varchar, '" + fecha + "', 103) and ( (hora >= " + hora + " and hora < " + horafin + ") or " +
         "(hfin <= " + horafin + " and hfin > " + hora + "))and registro.cap_usosalon.estad='S'),0)) <= registro.salones.cap_max_sal ");*/
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Verificar cuantos salones hay para el coliseo
    public Vector ContSalon() {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select count(*) from registro.salones where tipo_sal=5  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

//sumar capacidad de salones reservados para polideportivo
    public Vector CapSalon(java.lang.String fecha, java.lang.String hora, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = new String("select sum(cap), id_sal from registro.usosalon where convert(varchar, fecuso, 103) = convert(varchar, '" + fecha + "', 103) "
                + "and ((hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > " + hora + ") )and estad = 'S'  GROUP BY ID_SAL  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

//Consultar listado de eventos
    public Vector InscripEventos(String dpto, String peracad) {
        Vector retorno = new Vector();
        String consulta = new String();
        //and per_acad= '" + peracad + "'
        consulta = new String("select id_evento, descripcion, convert(varchar,fecha_ini, 103), "
                + " convert(varchar,fecha_fin, 103), lugar, cupo_max, per_acad, estado, horario,profes,detalle  "
                + " from registro.eventos where estado = 2  and publico in (0,2) and dpto= '" + dpto + "' and per_acad= '" + peracad + "' "
                + " order by id_evento");
        try {
            conectarBD();
            retorno = consultar(consulta, 11, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector InscripEventosVice(String dpto, String peracad) {
        Vector retorno = new Vector();
        String consulta = new String();
        //and per_acad= '" + peracad + "'
        consulta = new String("select id_evento, descripcion, convert(varchar,fecha_ini, 103), "
                + " convert(varchar,fecha_fin, 103), lugar, cupo_max, per_acad, estado, horario,profes,detalle  "
                + " from registro.eventos where estado = 2  and publico in (0,2) and dpto= '126' and per_acad= '" + peracad + "' "
                + " order by id_evento");
        try {
            conectarBD();
            retorno = consultar(consulta, 11, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

//Verificar si ya esta inscrito a un evento
    public Vector VerificaEventos(String id, String doc) {
        Vector retorno = new Vector();
        String consulta = new String();

        /* consulta = new String("select registro.eventos.id_evento, descripcion from registro.inscrito_eventos, registro.eventos " +
         " where registro.eventos.id_evento= registro.inscrito_eventos.id_evento and  documento='"+doc+"' and per_acad='" + peracad +  "' "+
         " order by registro.eventos.id_evento");*/

        consulta = new String("select id_evento from registro.inscrito_eventos "
                + " where registro.inscrito_eventos.id_evento =  '" + id + "' and  documento='" + doc + "' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Listado de inscritos a un evento determinado
    public Vector InscritosEvento(String id) {
        Vector retorno = new Vector();
        String consulta = new String();

        // consulta = "select id_evento, registro.inscrito_eventos.nombres, apellido1, apellido2, vinculo from registro.inscrito_eventos " + " where registro.inscrito_eventos.id_evento =  '" + id + "'  ";
        /**
        consulta = "select id_evento, registro.inscrito_eventos.nombres, apellido1, apellido2, vinculo, registro.estudiante.emails + '@mail.escuelaing.edu.co', documento, estadoc "
                + "from registro.inscrito_eventos, registro.estudiante "
                + "where registro.inscrito_eventos.id_evento =  '" + id + "' and (documento=id_est ) "
                + "union "
                + "select id_evento, registro.inscrito_eventos.nombres, apellido1, apellido2, vinculo, apolo.rechum.empleados.usrexchange +'@escuelaing.edu.co', documento, estadoc "
                + "from registro.inscrito_eventos,  apolo.rechum.empleados "
                + "where registro.inscrito_eventos.id_evento =  '" + id + "' and (documento = num_id) ";
                * */
        
        consulta="select id_evento, ISNULL(registro.inscrito_eventos.nombres,''), ISNULL(apellido1, ''), ISNULL(apellido2, ''), vinculo, registro.estudiante.emails + '@mail.escuelaing.edu.co', documento, estadoc from registro.inscrito_eventos, registro.estudiante where registro.inscrito_eventos.id_evento =  '" + id + "' and (documento=id_est or documento=doc_est) " +
        "union select id_evento, ISNULL(registro.inscrito_eventos.nombres,''), ISNULL(apellido1, ''), ISNULL(apellido2, ''), vinculo, apolo.rechum.empleados.usrexchange +'@escuelaing.edu.co', documento, estadoc from registro.inscrito_eventos,  apolo.rechum.empleados where registro.inscrito_eventos.id_evento =  '" + id + "' and (documento = num_id) and (num_id not in (select doc_est from registro.estudiante where (documento=id_est or documento=doc_est))) and (num_id not in (select id_est from registro.estudiante where (documento=id_est or documento=doc_est))) " +
        "union select id_evento, ISNULL(registro.inscrito_eventos.nombres,''), ISNULL(apellido1, ''), ISNULL(apellido2, ''), vinculo, registro.profesor.email +'@escuelaing.edu.co', documento, estadoc from registro.inscrito_eventos,  registro.profesor where registro.inscrito_eventos.id_evento =  '" + id + "' and (documento = cc_prof) and (cc_prof not in (select doc_est from registro.estudiante where (documento=id_est or documento=doc_est))) and (cc_prof not in (select id_est from registro.estudiante where (documento=id_est or documento=doc_est))) and (cc_prof not in (select num_id from apolo.rechum.empleados where num_id=documento))";
        try {
            conectarBD();
            retorno = consultar(consulta, 8, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Insertar Aprobado o reprobado de un estudiante en un curso
    public int ApruebaRepruebaCurso(java.lang.String idevento, java.lang.String documento, java.lang.String estado) {
        int respuesta = 0;
        String consulta = new String();
        consulta = new String("update registro.inscrito_eventos set estadoc = '" + estado + " ' "
                + "where id_evento = '" + idevento + "' and documento= '" + documento + "' ");
        try {
            conectarBD();
            respuesta = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return respuesta;
    }

    //Eventos a los cuales se encuentra inscrito
    public Vector EventosInscritos(String peracad, String doc) {
        Vector retorno = new Vector();
        String consulta = new String();
        //and per_acad= '" + peracad + "' 
        consulta = "select registro.inscrito_eventos.id_evento,descripcion, lugar from registro.inscrito_eventos,  registro.eventos "
                + " where registro.eventos.id_evento = registro.inscrito_eventos.id_evento and documento='" + doc + "' and per_acad= '" + peracad + "'  ";
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);
        } catch (SQLException ex) {

            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector departamentos(String peracad) {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = new String("select distinct id_dpto, nom_dpto from registro.departamento, registro.eventos "
                + " where  per_acad= '" + peracad + "'  and registro.eventos.dpto=registro.departamento.id_dpto and registro.eventos.dpto <> '126'  ");
        // and registro.eventos.dpto<> '126'
        try {

            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (SQLException ex) {

            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector Lineas(String id_dpto) {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = new String("select id_lin,descripcion from registro.lineas_prof "
                + " where id_dpto = '" + id_dpto + "' ");
        try {

            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (SQLException ex) {

            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector EventosdptoLinea(String peracad, String dpto, String linea) {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = "select id_evento, descripcion, convert(varchar,fecha_ini, 103), "
                + " convert(varchar,fecha_fin, 103), lugar, cupo_max, per_acad, estado,horario,profes,detalle, dpto, id_curso  "
                + " from registro.eventos where estado = 2  and publico in (0,2) and per_acad= '" + peracad + "' and dpto= '" + dpto + "' and linea_cur= '" + linea + "' "
                + " order by id_evento";

        try {
            conectarBD();
            retorno = consultar(consulta, 13, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector Eventoprof(String doc, String peracad) {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = "select descripcion, id_evento, lugar from  registro.eventos " + " where estado= 2 and per_acad = '" + peracad + "' AND (prof1= '" + doc + "' or dpto in (select idarea from registro.respcursos where resp = '" + doc + "'))  ";
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector CuposEventos(String ident) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select  count(*) "
                + " from registro.inscrito_eventos"
                + " where id_evento = '" + ident + "' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

//Insertar en r.estadisticos registro cdo se autentica el profesor
    public int Insertaestadis(String año, String mes, String doc) {
        String consulta = new String();
        int respuesta = 0;
        consulta = new String("insert into registro.estadis.estadisticos values (getdate(),'" + doc + "', " + año + ", " + mes + ", 'SAP', 'login')");
        try {
            conectarBD();
            respuesta = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return respuesta;
    }

    private int actualizar(java.lang.String consulta) throws SQLException {
        int resCons;
        PreparedStatement sentenciaConsulta;
        try {
            sentenciaConsulta = con.prepareStatement(consulta);
            resCons = sentenciaConsulta.executeUpdate();
            sentenciaConsulta.close();
        } catch (Exception e) {
            mensaje = e.getMessage();
            return 0;
        }
        return resCons;
    }

    public int actualiza(java.lang.String consulta) {
        int retorno = 0;
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public int sigSecuencia(java.lang.String entidad) {
        int respuesta = 0;
        String consulta = new String();
        consulta = new String("update registro.secuencias set sig_sec = sig_sec + incr "
                + "where nombre = '" + entidad + "' ");
        try {
            conectarBD();
            respuesta = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return respuesta;
    }

    public Vector getReserva(java.lang.String idprof) {
        Vector retorno = new Vector();
        String consulta = new String();
        /* consulta = new String("select registro.usosalon.id_sal, convert(varchar, fecuso, 103), hora, "
         + "convert(varchar, fsol, 103),tipo, ngrp, registro.asignatura.cod_asig, "
         + "registro.salones.cod_sal, iduso, hfin  "
         + " from registro.usosalon, registro.asignatura, registro.salones"
         + " where prof='" + idprof + "' and registro.usosalon.asig *= registro.asignatura.id_asig "
         + "and registro.salones.id_sal=registro.usosalon.id_sal and estad='S' and fecuso - getdate() > -1 "
         + "order by fecuso ");*/
        consulta = new String("select registro.usosalon.id_sal, convert(varchar, fecuso, 103), hora, "
                + "convert(varchar, fsol, 103),tipo, ngrp, registro.asignatura.cod_asig, "
                + "registro.salones.cod_sal, iduso, hfin  "
                + " from registro.usosalon LEFT OUTER JOIN registro.asignatura ON registro.usosalon.asig = registro.asignatura.id_asig, registro.salones"
                + " where prof='" + idprof + "' and  "
                + "registro.salones.id_sal=registro.usosalon.id_sal and estad='S' and fecuso - getdate() > -1 "
                + "order by fecuso ");

        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector getIdSalon(java.lang.String idasig) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select cod_asig  "
                + " from  registro.asignatura "
                + " where registro.asignatura.cod_asig = '" + idasig + "' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public void eliminaReserva(java.lang.String idres) {
        int respuesta = 0;
        String consulta = new String();
        consulta = new String("update registro.usosalon "
                + " set estad='C' , fcan=getdate() where iduso='" + idres + "' ");
        try {
            conectarBD();
            respuesta = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
    }

    public void eliminaCurso(java.lang.String idevento, java.lang.String doc) {
        int respuesta = 0;
        String consulta = new String();
        consulta = new String("delete from registro.inscrito_eventos "
                + " where id_evento='" + idevento + "' and documento='" + doc + "'  ");
        try {
            conectarBD();
            respuesta = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
    }

    public Vector getConAudit(java.lang.String fecha, java.lang.String hora, java.lang.String ndia, int horafin) {
        Vector retorno = new Vector();
        String consulta = new String();
        /*consulta = new String ("select id_sal, cod_sal from registro.salones where " +
         "id_sal not in (select id_sal from registro.usosalon " +
         "where convert(varchar, fecuso, 103) = convert(varchar, '"+ fecha +"', 103) " +
         "and ( (hora >= " + hora +" and hora < " + horafin +") or (hfin <= " + horafin +" and hfin > " + hora +
         ") )and estad = 'S') and id_sal = 117 " +
         "order by cap_max_sal ");*/
        consulta = new String("select id_sal, cod_sal from registro.salones where "
                + "id_sal not in (select id_sal from registro.usosalon "
                + "where convert(varchar, fecuso, 103) = convert(varchar, '" + fecha + "', 103) "
                + "and ( (hora >= " + hora + " and hora < " + horafin + ") or (hfin <= " + horafin + " and hfin > " + hora
                + ") )and estad = 'S') and id_sal = 117 and id_sal not in (select id_sal from registro.sal_grupo "
                + "where ((hora_ini >= " + hora + " and hora_ini < " + horafin + ") or "
                + "(hora_fin <= " + horafin + " and hora_fin > " + hora + ")) and dia = '" + ndia + "' ) "
                + "order by cap_max_sal ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector getConReserva(java.lang.String desde, java.lang.String hasta) {
        Vector retorno = new Vector();
        String consulta = new String();
        /*consulta = new String(" SELECT registro.salones.cod_sal, convert(varchar(12), "
         + " registro.usosalon.fecuso, 106), registro.usosalon.hora, registro.usosalon.dia, "
         + " registro.profesor.nom_prof  , prof, descr, registro.usosalon.hfin "
         + " FROM registro.usosalon, registro.salones, registro.profesor "
         + " WHERE ( registro.usosalon.id_sal = registro.salones.id_sal ) and "
         + " ( registro.profesor.id_prof =* registro.usosalon.prof ) and "
         + " ( ( registro.usosalon.fecuso between '" + desde + "' and '" + hasta + "' ) AND "
         + " ( registro.usosalon.estad = 'S' ) ) order by fecuso, hora, cod_sal ");*/

        consulta = new String("SELECT registro.salones.cod_sal, convert(varchar(12), "
                + "  registro.usosalon.fecuso, 106), registro.usosalon.hora, registro.usosalon.dia, "
                + "  registro.profesor.nom_prof  , prof, descr, registro.usosalon.hfin "
                + "  FROM registro.profesor RIGHT OUTER JOIN registro.usosalon on "
                + "  registro.profesor.id_prof =registro.usosalon.prof ,"
                + " registro.salones "
                + " WHERE ( registro.usosalon.id_sal = registro.salones.id_sal ) and  "
                + " (( registro.usosalon.fecuso between '" + desde + "' and '" + hasta + "'  ) AND "
                + " ( registro.usosalon.estad = 'S' ) ) order by fecuso, hora, cod_sal");


        try {
            conectarBD();
            retorno = consultar(consulta, 8, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector getConsAudit(java.lang.String desde, java.lang.String hasta) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" SELECT registro.salones.cod_sal, convert(varchar(12), "
                + " registro.usosalon.fecuso, 106), registro.usosalon.hora, registro.usosalon.dia, "
                + " registro.profesor.nom_prof  , prof, descr, registro.usosalon.hfin, req, idgrp, asig, cap, tipo "
                + " FROM registro.profesor RIGHT OUTER JOIN registro.usosalon on "
                + " registro.profesor.id_prof = registro.usosalon.prof ,registro.salones "
                + " WHERE registro.usosalon.id_sal = 117 and "
                + " ( registro.usosalon.id_sal = registro.salones.id_sal ) and "
                + " ( ( registro.usosalon.fecuso between '" + desde + "' and '" + hasta + "' ) AND "
                + " ( registro.usosalon.estad = 'S' ) ) order by fecuso, hora, cod_sal ");
        try {
            conectarBD();
            retorno = consultar(consulta, 13, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //***************************************************************************************************************
    //************************************* Estudios Formales ****************************************************
    public Vector getEstudiosFormales(String doc) {
        String consulta = "select codigo, num_id, niv_for, pro_aca, "
                + " dur, titulo, convert(varchar, fec_ini, 105), convert(varchar, fec_fin, 105), "
                + " convert(varchar, fec_gra, 105),ins, ciu, pais "
                + " from apolo.rechum.est_fors "
                + " where num_id = '" + doc + "' "
                + " order by ins";
        return getConsultaApolo(consulta, 12, 1);
    }

    public Vector despEstudiosFormales(String idd) {
        String consulta = "select codigo, num_id, niv_for, pro_aca, are_con, "
                + "     dur, titulo, convert(varchar, fec_ini, 105), "
                + "     convert(varchar, fec_fin, 105), "
                + "     convert(varchar, fec_gra, 105), "
                + "     ins, ciu, pais, termino, paps_resp "
                + "from apolo.rechum.est_fors where codigo = " + idd;
        return getConsultaApolo(consulta, 15, 0);
    }
    //***************************************************************************************************************
    //************************************* Estudios No Formales ****************************************************

    public Vector getEstNoFormales(String doc) {
        String consulta = new String("select codigo, pro_aca, ins "
                + "from apolo.rechum.est_no_fors "
                + "where num_id = '" + doc + "' "
                + "order by ins");
        return getConsultaApolo(consulta, 3, 1);
    }

    public Vector getdespEstudioNoFormal(String idd) {
        String consulta = new String("select codigo, pro_aca, are_con, "
                + " dur, convert(varchar, fec_ini, 105), "
                + " convert(varchar, fec_fin, 105), "
                + " ins, ciu, pais, des "
                + " from apolo.rechum.est_no_fors where codigo = " + idd);
        return getConsultaApolo(consulta, 10, 0);
    }

    //***************************************************************************************************************
    //************************************* Distinciones ************************************************************
    public Vector getDistinciones(String ident) {
        String consulta = new String("select codigo, nombre, ins_pre "
                + "from apolo.rechum.distinciones "
                + "where num_id = '" + ident + "' "
                + "order by nombre");
        return getConsultaApolo(consulta, 3, 1);
    }

    public Vector getdespDistincion(String idd) {
        String consulta = new String("select codigo, nombre, ins_pre, año, pais, "
                + "obs, obr_pre, des "
                + "from apolo.rechum.distinciones where codigo = " + idd);
        return getConsultaApolo(consulta, 8, 0);
    }
    //***************************************************************************************************************
    //************************************* Experiencia *************************************************************

    public Vector getExperiencia(String ident) {
        String consulta = new String("select codigo, institucion, cargo "
                + "from apolo.rechum.exp_labs "
                + "where num_id = '" + ident + "' order by institucion");
        return getConsultaApolo(consulta, 3, 1);
    }

    public Vector getdespExperiencia(String idd) {
        String consulta = new String("select codigo, tipo, convert(varchar, fec_ini, 105), "
                + "   convert(varchar, fec_fin, 105), convert(varchar, ult_ret, 105), "
                + "   institucion, tel_ins, dir_ins, pai_ins, ciu_ins, "
                + "   cargo, depto, fun_asi, dedica, uni_aca, "
                + "   tip_pro, man_per, horas, niv_imp_doc_basica, "
                + "   niv_imp_doc_pre_tecnico, niv_imp_doc_pre_tecnologico, "
                + "   niv_imp_doc_pre_profesional, niv_imp_doc_pos_maestria, "
                + "   niv_imp_doc_pos_doctorado, niv_imp_doc_pos_posdoctorado, "
                + "   niv_imp_doc_cap_int, niv_imp_doc_pos_esp "
                + "from apolo.rechum.exp_labs "
                + "where apolo.rechum.exp_labs.codigo = " + idd);
        return getConsultaApolo(consulta, 27, 0);
    }
//***************************************************************************************************************
    //************************************* Eventos *****************************************************************

    public Vector getEventos(String ident) {
        String consulta = new String();
        consulta = new String("select codigo, nombre, tipo "
                + "from apolo.rechum.eve_cies "
                + "where num_id = '" + ident + "' "
                + "order by nombre");
        return getConsultaApolo(consulta, 3, 1);
    }

    public Vector getdespEvento(String idd) {
        String consulta = new String();
        consulta = new String("select nombre, tipo, ciu_eve, "
                + "pai_eve, fecha, tip_doc, tit_pon "
                + "from apolo.rechum.eve_cies where codigo = " + idd);
        return getConsultaApolo(consulta, 7, 0);
    }
    //***************************************************************************************************************
    //************************************* Sociedades **************************************************************

    public Vector getSociedades(String ident) {
        String consulta = new String();
        consulta = new String("select apolo.rechum.inscripciones.codigo, nombre, convert(varchar, fecha, 105) "
                + "from apolo.rechum.inscripciones, apolo.rechum.soc_cies "
                + "where num_id = '" + ident + "' and "
                + "apolo.rechum.inscripciones.cod_soc_cie = apolo.rechum.soc_cies.codigo "
                + "order by nombre");
        return getConsultaApolo(consulta, 3, 1);
    }

    public Vector getdespSociedad(String idd) {
        String consulta = new String();
        consulta = new String("select codigo, cod_soc_cie, convert(varchar, fecha, 105), cat, convert(varchar, fec_fin, 105), num_acta, otro "
                + "from apolo.rechum.inscripciones where codigo = " + idd);
        return getConsultaApolo(consulta, 7, 0);
    }
    //***************************************************************************************************************
    //************************************* IDIOMAS **************************************************************

    public Vector getIdiomas(String ident) {
        String consulta = new String();
        consulta = new String(" select cod_sec, nombre "
                + " from apolo.rechum.idiomas, apolo.rechum.mant_idiom "
                + " where num_id = '" + ident + "' and "
                + " apolo.rechum.idiomas.codigo = apolo.rechum.mant_idiom.codigo "
                + " order by nombre");
        return getConsultaApolo(consulta, 2, 1);
    }

    public Vector getdespIdioma(String idd) {
        String consulta = new String();
        consulta = new String("select apolo.rechum.idiomas.cod_sec, apolo.rechum.mant_idiom.codigo, apolo.rechum.mant_idiom.nombre, "
                + "apolo.rechum.idiomas.lee, apolo.rechum.idiomas.esc,apolo.rechum.idiomas.hab,apolo.rechum.idiomas.num_id "
                + "from apolo.rechum.mant_idiom, apolo.rechum.idiomas "
                + "where apolo.rechum.mant_idiom.codigo= apolo.rechum.idiomas.codigo and apolo.rechum.idiomas.cod_sec = " + idd);
        return getConsultaApolo(consulta, 7, 0);
    }
    //***************************************************************************************************************
    //************************************* Escritos ****************************************************************

    public Vector getEscritos(String ident) {
        String consulta = new String();
        consulta = new String(" select codigo, titulo, edicion "
                + " from apolo.rechum.escritos "
                + " where num_id = '" + ident + "' "
                + " order by titulo");
        return getConsultaApolo(consulta, 3, 1);
    }

    public Vector getdespEscrito(String idd) {
        String consulta = new String();
        consulta = new String(" select codigo, tipo, titulo, tit_may, are_con, "
                + " convert(varchar, fecha, 105), edicion, editorial, "
                + " ciudad, pais "
                + " from apolo.rechum.escritos "
                + " where codigo = " + idd);
        return getConsultaApolo(consulta, 10, 0);
    }
    //***************************************************************************************************************
    //************************************* Investigaciones *********************************************************

    public Vector getInvestigaciones(String ident) {
        String consulta = new String();
        consulta = new String(" select codigo, titulo, institucion "
                + " from apolo.rechum.pro_invs "
                + " where num_id = '" + ident + "' "
                + " order by titulo");
        return getConsultaApolo(consulta, 3, 1);
    }

    public Vector getdespInvestigacion(String idd) {
        String consulta = new String();
        consulta = new String("select codigo, des, titulo, dep, "
                + "convert(varchar, fec_ini, 105), convert(varchar, fec_fin, 105), "
                + "cam_con, fue_fin, institucion, valor, res, tipo "
                + "from apolo.rechum.pro_invs "
                + "where codigo = " + idd);
        return getConsultaApolo(consulta, 12, 0);
    }

    //***************************************************************************************************************
//***************************************************************************************************************
//************************************* Pagos On-Line y Ordenes *************************************************
    public Vector getNumorden(String idest, String peracad) {
        String consulta = new String();
        consulta = new String(" select id_ord, val_der, dcon1, dcon2, dcon3, dcon4 from registro.registro.ordenes "
                + " where id_est = '" + idest + "' and per_acad = '" + peracad + "' ");
        return getConsultaApolo(consulta, 6, 0);
    }

    public Vector getValorden(String idest, String peracad) {
        Vector retorno = new Vector();
        String consulta = new String();

        //Si existe orden se calcula nuevamente el valor de la orden para ese estudiante con los nuevos créditos
        consulta = new String("Select  sum(registro.defcoho.vrcred * registro.asignatura.num_ulas_c) "
                + "from registro.estudiante, registro.plan_estud, registro.programas, "
                + " registro.biblia_post, registro.asignatura, registro.defcoho "
                + "where ( registro.estudiante.id_plan = registro.plan_estud.id_plan ) and "
                + " ( registro.estudiante.id_plan = registro.defcoho.idplan ) and "
                + "( registro.estudiante.semnv = registro.defcoho.nco ) and "
                + "( registro.plan_estud.id_prog = registro.programas.id_prog ) and "
                + "( registro.defcoho.idprg = registro.programas.id_prog ) and "
                + "( registro.biblia_post.id_est = '" + idest + "') and (registro.estudiante.id_est = '" + idest + "' ) and "
                + "( registro.biblia_post.id_asig = registro.asignatura.id_asig) and "
                + "( registro.biblia_post.clave in ('P', 'F') ) and "
                + "( registro.biblia_post.per_acad = '" + peracad + "') "
                + "having sum(registro.defcoho.vrcred * registro.asignatura.num_ulas_c) > 0 ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector getDocestudiante(String idest) {
        Vector retorno = new Vector();
        String consulta = new String();

        //Buscar el numero de documento del estudiante
        consulta = new String(" select doc_est from registro.estudiante where id_est='" + idest + "' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector getEgresado(String idest, String docest) {
        Vector retorno = new Vector();
        String consulta = new String();

        //Buscar si el estudiante es egresado
        consulta = new String("select count('" + idest + "') from registro.estudiante where doc_est = '" + docest + "' "
                + "and estado in (0, -100) ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public int InsertarEst(java.lang.String idest, java.lang.String nord, java.lang.String valder, java.lang.String valord, java.lang.String id_prof) {

        int retorno = 0;
        String consulta = new String();
        try {
            conectarBD();
            consulta = new String("insert into registro.registro.logpreinsc (id_est,  id_ord, val_ini, "
                    + "fecha, val_fin, id_prof) values ( '" + idest + "', '" + nord + "', '" + valder
                    + "', getdate(), '" + valord + "', '" + id_prof + "') ");
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;

    }

    public int InscribeEvento(java.lang.String idevento, java.lang.String doc, java.lang.String nombres, java.lang.String apellido1, java.lang.String apellido2, java.lang.String vinculo) {
        int retorno = 0;
        String consulta = new String();
        try {
            conectarBD();
            consulta = new String("insert into registro.inscrito_eventos (id_evento,  documento, nombres, apellido1, apellido2, "
                    + "vinculo, fechains) values ( '" + idevento + "', '" + doc + "', '" + nombres
                    + "', '" + apellido1 + "', '" + apellido2 + "',  '" + vinculo + "',  getdate() ) ");
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector getSec() {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = new String("select sig_sec "
                + " from registro.secuencias "
                + " where registro.secuencias.nombre='BIBLIAPOST' ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector getCredAsig(String idasig) {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = new String("select num_ulas_a from registro.asignatura where id_asig='" + idasig + "' ");

        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public int InsertAsig(int sec, String asig, String idest, String peraca, int cred) {

        int retorno = 0;
        String consulta = new String();
        try {
            conectarBD();
            consulta = new String(" insert into registro.biblia_post ( id_bib, id_asig, id_est, "
                    + " as_vis, nr_grp, per_acad, nota, cred, clave, des_tpo, id_grupo, idord, pag) "
                    + " values ( " + sec + ", " + asig + ", '" + idest + "', " + asig + ", 1, '" + peraca + "', NULL,  "
                    + " " + cred + ", 'P', 'GenInternet', '-1', NULL, 0) ");

            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;

    }

    //***************************************************************************************************************
    //************************************* Tipos - Codigos *********************************************************
    public Vector TipoCodigo(String cat) {
        String consulta = new String();
        consulta = new String("select codigo, descripcion "
                + " from apolo.apolo.codigos "
                + " where categoria='" + cat + "' "
                + " order by descripcion");
        return getConsultaApolo(consulta, 2, 1);
    }

    public Vector getConsultaIdiomas() {
        String consulta = new String();
        consulta = new String("select codigo, nombre "
                + " from apolo.rechum.mant_idiom "
                + " order by nombre");
        return getConsultaApolo(consulta, 2, 1);
    }

    public Vector getLissociedades() {
        String consulta = new String();
        consulta = new String(" select codigo, nombre "
                + " from rechum.soc_cies "
                + " order by nombre");
        return getConsultaApolo(consulta, 2, 1);
    }

    private Vector getConsultaApolo(String consulta, int nc, int tp) {
        Vector retorno = new Vector();
        try {
            conectarBDAPOLO();
            retorno = consultar(consulta, nc, tp);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public String sigSecEmpleado(String entidad) {
        int ret;
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select convert(varchar(5), sig_sec) "
                + " from apolo.invent.secuencias "
                + " where nombre = '" + entidad + "' ";
        try {
            conectarBDAPOLO();
            retorno = consultar(consulta, 1, 0);
            if (retorno.size() > 0) {
                consulta = "update apolo.invent.secuencias set sig_sec = sig_sec + 1 where nombre = '" + entidad + "' ";
                ret = actualizar(consulta);
            }
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        if (retorno.size() > 0) {
            return (String) retorno.elementAt(0);
        } else {
            return "0";
        }
    }

    public int actualizaApolo(String consulta) {
        int retorno = 0;
        try {
            conectarBDAPOLO();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    /*  private int actualizaApolo(java.lang.String consulta) throws SQLException {
     int resCons;
     PreparedStatement sentenciaConsulta;
     try {
     sentenciaConsulta = con.prepareStatement(consulta);
     resCons = sentenciaConsulta.executeUpdate();
     sentenciaConsulta.close();
     } catch (Exception e) {
     mensaje = e.getMessage();
     return 0;
     }
     return resCons;
     }*/
    //************************************* ENCUESTAS AUTOEVALUACION *********************************************************
    public int Autoevaluacion(java.lang.String id, java.lang.String restas, java.lang.String prog, java.lang.String ident, java.lang.String justif1, java.lang.String justif2, java.lang.String justif3, java.lang.String justif4, java.lang.String justif5, String justif6, String justif7, String justif8, String justif9, String justif10, String grjust) {

        int retorno = 0;
        String consulta = new String();

        consulta = new String("insert into apolo.restasep (id_enc,  restas, programa, identif, justif1, justif2, justif3, justif4, justif5, justif6,justif7,justif8,justif9,justif10, "
                + " fecha, grjust) values ( '" + id + "', '" + restas + "', '" + prog + "', '" + ident
                + "', '" + justif1 + "', '" + justif2 + "', '" + justif3 + "', '" + justif4 + "', '" + justif5 + "', '" + justif6 + "','" + justif7 + "','" + justif8 + "','" + justif9 + "','" + justif10 + "', getdate(),  '" + grjust + "' ) ");

        try {
            conectarBDAPOLO();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //ANTES
   /* public int AutoevaluacionNvo(java.lang.String id, java.lang.String restas, java.lang.String prog, java.lang.String ident, java.lang.String lispregunta, java.lang.String indice) {

     int retorno = 0;
     String consulta = new String();

     consulta = "insert into apolo.restasep (id_enc,  restas, programa, identif, "
     + " fecha, id_lispregunta, ind,ind2, ind3) values ( '" + id + "', '" + restas + "', '" + prog + "', '" + ident
     + "', getdate(), '" + lispregunta + "', '" + indice + "', '" + indice + "', '" + indice + "' ) ";

     try {
     conectarBDAPOLO();
     retorno = actualizar(consulta);
     } catch (SQLException ex) {
     mensaje = "Unable to fetch status due to SQLException: "
     + ex.getMessage();
     }
     desconectarBD();
     return retorno;
     }*/
    //ya no se necesita no se guardaran comentarios por separado sino por cada pregunta
    public int comentario(java.lang.String idfact, java.lang.String idenc, java.lang.String comentario) {
        int retorno = 0;
        String consulta = new String();
        consulta = "insert into apolo.comentafactor values ('" + idfact + "', '" + comentario + "', '" + idenc + "' )";
        try {
            conectarBDAPOLO();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public int EncuestadoNvo(String cedula, String id, String prog, String factor) {
        int retorno = 0;
        String consulta = new String();
        consulta = "update apolo.encuestadosep set " + factor + " = 1 "
                + "where id_persona = '" + cedula + "'  and idenc1= '" + id + "' and programa='" + prog + "' ";
        try {
            conectarBDAPOLO();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLExceptio"
                    + " "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public int Encuestado2(String cedula, String id) {
        int retorno = 0;
        String consulta = new String();
        consulta = new String("update apolo.encuestadosep set flag2 = 1 "
                + "where id_persona = '" + cedula + "'  and idenc2= '" + id + "' ");
        try {
            conectarBDAPOLO();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector Verificarestas(String cedula, String idenc, String prog) {
        String consulta = new String();
        consulta = " select id_enc,"
                + " identif, programa " + "from apolo.restasep " + "where identif= '" + cedula + "' and  id_enc= '" + idenc + "' and programa='" + prog + "' ";
        return getConsultaApolo(consulta, 3, 0);

    }

    //ENCUESTAS DE AUTOEVALIACION NUEVO DISEÑO
    public Vector ContestoEncuestaFac(String cedula, String idenc1, String idfactor) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select id_factor  from  encuestas.encuestas.respuestas "
                + " where id_encuestado= '" + cedula + "' and  id_enc= '" + idenc1 + "'  and id_factor= '" + idfactor + "'";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
    
    //CONSULTAR LISTA DE profesores a los que les fue asignado un taller PARA poder realizar algun cambio de grupo
    public Vector ConsultaEmpleados() {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select id_encuestado,encuestas.encuestas.encuestado.documento, nombres,encuestas.encuestas.encuestas.id_enc, tipo_enc, encuestas.encuestas.encuestado.estado,asistencia  "
                + " from encuestas.encuestas.encuestado,encuestas.encuestas.encuestas, encuestas.encuestas.poblacion "
                + " where encuestas.encuestas.encuestado.id_enc = encuestas.encuestas.encuestas.id_enc and tipo_enc='T' and encuestas.encuestas.encuestado.documento = encuestas.encuestas.poblacion.documento  and (encuestas.encuestas.encuestado.estado=0 or  encuestas.encuestas.encuestado.estado=-1) order by nombres ";
        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
    
    //VERIFICAR CUANTAS PREGUNTAS HA CONTESTADO EN CADA FACTOR
    public Vector PreguntasFactorContesto(String id, int factor,String id_encuestado) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = " select count (id_pregunta) from encuestas.encuestas.respuestas "
                + " where id_enc='" + id + "' and id_factor='" + factor + "' and id_encuestado='" + id_encuestado + "' ";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //actualizar el estado del encuestado cuando haya respondido todos los factores de la encuesta.
    public int Encuestado(String id_encuestado, String id, String prog) {

        int retorno = 0;
        String consulta = new String();
        consulta = "update encuestas.encuestas.encuestado set estado = 1 "
                + "where id_encuestado = '" + id_encuestado + "'  and id_enc= '" + id + "' ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
    
    
     public int GruposAsiste(String id_grupo, String id_enc) {

        int retorno = 0;
        String consulta = new String();
        consulta = "update encuestas.encuestas.encuestado set estado = 1 "
                + "where grupo = '" + id_grupo + "'  and id_enc= '" + id_enc + "' and asistencia= 1 ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
     
     public int GruposNoAsiste(String id_grupo, String id_enc) {

        int retorno = 0;
        String consulta = new String();
        consulta = "update encuestas.encuestas.encuestado set estado = -1 "
                + "where grupo = '" + id_grupo + "'  and id_enc= '" + id_enc + "' and asistencia= 0 ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
     
     
     public int ActualizaAsisteOtroGrupo(String id_enc, String grupo, String id_encuestado, String programa) {

        int retorno = 0;
        String consulta = new String();
        consulta = "update encuestas.encuestas.encuestado set  asistencia= 1, grupo = '"+grupo+"' , id_enc='"+id_enc+"', programa= '"+programa+"'"
                + "where asistencia= 0 and (estado= -1  or estado= 0) and id_encuestado= '" + id_encuestado + "' ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
    
    

    public int Asistencia(String id_encuestado, String id, String asistencia) {

        int retorno = 0;
        String consulta = new String();
        consulta = "update encuestas.encuestas.encuestado set asistencia = '" + asistencia + "' "
                + "where id_encuestado = '" + id_encuestado + "'  and id_enc= '" + id + "' ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
    
    //Actualizar asistencia para nuevo participante del taller
      public int ActualizaEstadoOtroGrupo(String id_enc, String grupo, String id_encuestado) {

        int retorno = 0;
        String consulta = new String();
        consulta = "update encuestas.encuestas.encuestado set  estado= 1, grupo = '"+grupo+"' "
                + "where id_enc= '" + id_enc + "' and asistencia= 0 and (estado= -1  or estado= 0) and id_encuestado= '" + id_encuestado + "' ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }


    //DATOS DE LA ENCUESTA Y VALIDAR SI YA LA RESPONDIO
    public Vector DatosEncuestas(String cedula) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select documento, encuestas.encuestas.encuestado.id_enc,encuestas.encuestas.encuestado.estado, nombre_enc, codigo, tipo_enc, encuestas.encuestas.encuestado.id_encuestado, encuestas.encuestas.encuestado.grupo  from encuestas.encuestas.encuestado, encuestas.encuestas.encuestas "
                + " where documento= '" + cedula + "' and encuestas.encuestas.encuestado.estado=0 and  encuestas.encuestas.encuestas.id_enc=encuestas.encuestas.encuestado.id_enc ";
        try {
            conectarBD();
            retorno = consultar(consulta, 8, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //CONSULTAR EN RESPUESTAS CUANTOS FACTORES HA CONTESTADO
    public Vector ContestoFactor(String cedula, String idenc) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "SELECT distinct (id_factor) from encuestas.encuestas.respuestas "
                + " where id_encuestado= '" + cedula + "' and  id_enc= '" + idenc + "' ";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
    
    public Vector ContestoFactorTaller(String cedula, String idenc) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "SELECT distinct (id_factortaller) from encuestas.encuestas.respuestas "
                + " where id_encuestado= '" + cedula + "' and  id_enc= '" + idenc + "' ";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //CONSULTAR EN QUE FACTOR VA RESPONDIENDO LA ENCUESTA
    public Vector MáximoFactor(String cedula, String idenc) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "SELECT max (id_factor) from encuestas.encuestas.respuestas "
                + " where id_encuestado= '" + cedula + "' and  id_enc= '" + idenc + "' ";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //LISTA TODAS LAS PREGUNTAS POR ENCUESTA
    public Vector PreguntasEnc(String idenc) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select  encuestas.encuestas.listpreguntas_enc.id_pregunta, id_factor, enunciado,encuestas.encuestas.enunciados.id_escala, tipo, valores, t1,t2,t3,t4,t5,t6,t7 "
                + " from encuestas.encuestas.listpreguntas_enc, encuestas.encuestas.enunciados, encuestas.encuestas.escala "
                + " where id_enc= '" + idenc + "' and  encuestas.encuestas.listpreguntas_enc.id_pregunta= encuestas.encuestas.enunciados.id_pregunta and encuestas.encuestas.enunciados.id_escala = encuestas.encuestas.escala.id_escala order by id_pregunta  ";
        try {
            conectarBD();
            retorno = consultar(consulta, 13, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;

    }

    //LISTAR PREGUNTAS POR CADA FACTOR DE LA ENCUESTA
    public Vector PreguntasEncFactor(String idenc, int idfactor) {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = " select  encuestas.encuestas.listpreguntas_enc.id_pregunta, id_factor, enunciado,encuestas.encuestas.enunciados.id_escala, tipo, valores, t1,t2,t3,t4,t5,t6,t7 , id_pregenc"
                + " from encuestas.encuestas.listpreguntas_enc, encuestas.encuestas.enunciados, encuestas.encuestas.escala "
                + " where id_enc= '" + idenc + "' and  encuestas.encuestas.listpreguntas_enc.id_pregunta= encuestas.encuestas.enunciados.id_pregunta and encuestas.encuestas.enunciados.id_escala = encuestas.encuestas.escala.id_escala and id_factor= '" + idfactor + "' order by id_pregunta  ";
        try {
            conectarBD();
            retorno = consultar(consulta, 14, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;

    }
    
    //SACAR LOS DATOS SOLO DE LAS PREGUNTAS QUE FALTAN EN CADA FACTOR
    public Vector DatosPregFaltanEncFactor(String idenc, int idfactor, String idpreg) {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = " select  encuestas.encuestas.listpreguntas_enc.id_pregunta, id_factor, enunciado,encuestas.encuestas.enunciados.id_escala, tipo, valores, t1,t2,t3,t4,t5,t6,t7 , id_pregenc"
                + " from encuestas.encuestas.listpreguntas_enc, encuestas.encuestas.enunciados, encuestas.encuestas.escala "
                + " where id_enc= '" + idenc + "' and  encuestas.encuestas.listpreguntas_enc.id_pregunta= encuestas.encuestas.enunciados.id_pregunta and encuestas.encuestas.enunciados.id_escala = encuestas.encuestas.escala.id_escala and id_factor= '" + idfactor + "'  and encuestas.encuestas.listpreguntas_enc.id_pregunta ='" + idpreg + "' order by id_pregunta  ";
        try {
            conectarBD();
            retorno = consultar(consulta, 14, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;

    }
    
    

    // cuantos factores tiene una encuesta
    public Vector FactoresEnc(String idenc) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select distinct (id_factor) from encuestas.encuestas.listpreguntas_enc where id_enc='" + idenc + "'   ";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;

    }

    //DATOS DE CADA FACTOR DE LA ENCUESTA
    public Vector Factores(int idfactor) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select descripcion, nombre from encuestas.encuestas.factores where id_factor='" + idfactor + "'   ";
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;

    }
    
    
    //COMPRAR PREGUNTAS DEL FACTOR CON LAS QUE HA CONTESTADO PARA VALIDAR CUALES FALTAN
     public Vector PreguntasQueFaltan(String id, int idfactor,String idenc) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select id_pregunta from encuestas.encuestas.listpreguntas_enc "
                + " where id_enc= '"+id+"' and id_factor='"+idfactor+"' and id_pregunta not in  (select id_pregunta from encuestas.encuestas.respuestas " 
                + " where id_enc='"+id+"' and id_factor='"+idfactor+"' and id_encuestado='"+idenc+"') ";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;

    }
    

    //VALIDAR CADA RESPUESTA
    public Vector Validar(java.lang.String id, java.lang.String idpreg, java.lang.String ident) {

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select id_enc, id_pregunta, id_enc from encuestas.encuestas.respuestas where id_enc='" + id + "' and id_pregunta='" + idpreg + "' and id_encuestado='" + ident + "'  ";
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //INSERTA RESPUESTAS UNA A UNA CON SU RESPECTIVO COMENTARIO 
    public int AutoevaluacionNvo(java.lang.String ident, java.lang.String id, String idfactor, java.lang.String idpreg, java.lang.String restas, java.lang.String comentario) {

        int respuesta = 0;
        String consulta = new String();

        consulta = "insert into encuestas.encuestas.respuestas (id_encuestado,  id_enc, id_factor, id_pregunta, respuesta, "
                + " fecha, comentario) values ( '" + ident + "', '" + id + "', '" + idfactor + "', '" + idpreg + "' , '" + restas
                + "', getdate(), '" + comentario + "' ) ";

        try {
            conectarBD();
            respuesta = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return respuesta;
    }
    
    //INSERTR RESPUESTAS TALLER
      public int AutoevaluacionNvoTaller(java.lang.String ident, java.lang.String id, int idfactor, java.lang.String idpreg, java.lang.String restas, java.lang.String comentario, java.lang.String factortaller) {

        int respuesta = 0;
        String consulta = new String();

        consulta = "insert into encuestas.encuestas.respuestas (id_encuestado,  id_enc, id_factor, id_pregunta, respuesta, "
                + " fecha, comentario, id_factortaller) values ( '" + ident + "', '" + id + "', '" + idfactor + "', '" + idpreg + "' , '" + restas
                + "', getdate(), '" + comentario + "', '" + factortaller + "' ) ";

        try {
            conectarBD();
            respuesta = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return respuesta;
    }

    //DATOS DE CADA ENCUESTADO PARA LOS TALLERES
    public Vector DatosEncuestado(String idenc, String grupo) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select encuestas.encuestas.encuestado.documento, nombres, id_encuestado, id_enc,programa,grupo, asistencia from encuestas.encuestas.encuestado, encuestas.encuestas.poblacion"
                + " where encuestas.encuestas.encuestado.documento = encuestas.encuestas.poblacion.documento  and id_enc=  '" + idenc + "' and grupo= '" + grupo + "' ";
        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;

    }
    
    //CONSULTAR EN POBLACION SI EXISTE EL PARTICIPANTE A ADICIONAR EN EL TALLER
    public Vector ConsultaDatosEncuestado(String idenc) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = " select documento from  encuestas.encuestas.poblacion"
                + " where encuestas.encuestas.poblacion.documento  =  '" + idenc + "'  ";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;

    }
    
    
    //INSERTAR EN TABLA POBLACION CDO SE ADICINA UN PARTICIPANTE EN EL TALLER
    
    public int GuardaEmpleado( java.lang.String doc, java.lang.String nombres, java.lang.String mail) {
        int retorno = 0;
        String consulta = new String();
       
            consulta = "insert into encuestas.encuestas.poblacion values ( '" + doc + "',  '" + nombres + "',1, '" + mail + "' ) ";
             try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
    
    
    //INSERTAR EN TABLA ENCUESTADO CDO SE ADICIONA UN PARTICIPANTE EN EL TALLER ya noo
    
    public int GuardaEncuestado( java.lang.String doc, java.lang.String id_enc,java.lang.String prog, java.lang.String grupo) {
        int retorno = 0;
        String consulta = new String();
       
            consulta = "insert into encuestas.encuestas.encuestado values ( '" + doc + "', '" + id_enc + "', 0, 1, '" + prog + "', '" + grupo + "' ) ";
             try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
    

    public Vector Extensiones() {
        String consulta = new String();
        consulta = "select rtrim(ap1_emp)+' '+rtrim(ap2_emp)+' '+rtrim(nom_emp), e_mail, nom_cco, codigo, cod_emp as documento  "
                + " from registro.directorioemplea order by ap1_emp asc ";
        return getConsultaApolo(consulta, 5, 1);

    }

    public int GuardaExt(java.lang.String usuario, java.lang.String doc, java.lang.String nombres, java.lang.String centro, java.lang.String extension, java.lang.String telefono, java.lang.String bloque) {
        int retorno = 0;
        String consulta = new String();
        try {
            conectarBD();
            consulta = new String("insert into registro.extensiones  values ( '" + usuario + "',  '" + nombres + "','" + doc + "', '" + centro
                    + "', '" + extension + "', '" + telefono + "',  '" + bloque + "',  getdate() ) ");
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector Validaext(String nombre, String ext) {
        String consulta = new String();
        consulta = " select nombres, extension from registro.extensiones where nombres = '" + nombre + "' and extension='" + ext + "'  ";
        return getConsultaApolo(consulta, 2, 0);

    }

    public Vector Centros() {
        String consulta = new String();
        consulta = "select distinct nom_cco, codigo "
                + " from registro.directorioemplea order by nom_cco ";
        return getConsultaApolo(consulta, 2, 1);

    }

    public Vector CandidatosCopasst(String tipo) {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = "select nroton, nombre, narc from registro.candidatcopasst where idcrp = " + tipo + " order by nroton ";
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());

        }
        desconectarBD();

        return retorno;

    }

    public Vector ConsultaVotoCopasst(String cedula) {


        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select  copasst " + "from  registro.votantescopasst " + "WHERE   ccvot= '" + cedula + "' ";


        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());

        }
        desconectarBD();

        return retorno;
    }

    public int ActualizaVotosCopasst(String campo, String idEst) {

        String consulta = new String();
        int retorno = 0;

        consulta = "update registro.votantescopasst set " + campo + " = 1 where ccvot=  '" + idEst + "' ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            retorno = 0;
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    public int InserVotoCopasst(String idcrp, String nro) {
        int retorno = 0;
        try {
            conectarBD();
            String consulta = new String();
            consulta = " insert into registro.votacioncopasst values (" + idcrp + ", " + nro + " ,getdate() ) ";
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector getSegEstEmpAdmitido(String cod_emp) {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = "DECLARE @idemp INT = " + cod_emp + "; "
                + "DECLARE @date DATETIME = GETDATE(); "
                + ""
                + "DECLARE @result TINYINT = 0; "
                + "DECLARE @typeEmp TINYINT = 0; "
                + "DECLARE @rol TINYINT = 0; "
                + "DECLARE @idDpto INT = 0; "
                + ""
                + "SET @date = DATETIMEFROMPARTS(YEAR(@date), MONTH(@date), DAY(@date), 0,0,0,0); "
                + ""
                + "DECLARE @maxId INT; "
                + "SELECT @maxId = MAX(id) FROM registro.se_prof_admitidos WHERE cod_emp = @idemp AND fecha_caducidad = '01/01/1900'; "
                + ""
                + "IF @maxId IS NULL "
                + "BEGIN "
                + "SELECT @maxId = MAX(id) FROM registro.se_prof_admitidos WHERE cod_emp = @idemp; "
                + ""
                + "SELECT @result = COUNT(*) "
                + "FROM registro.se_prof_admitidos "
                + "WHERE   id = @maxId "
                + "AND fecha_caducidad >= @date "
                + ""
                + "IF @result = 1 "
                + "BEGIN "
                + "SELECT @typeEmp = tipo, @rol = rol, @idDpto = id_dpto FROM registro.se_prof_admitidos WHERE id = @maxId; "
                + "END "
                + "END "
                + "ELSE "
                + "BEGIN "
                + "SELECT @result = 1; "
                + "SELECT @typeEmp = tipo, @rol = rol, @idDpto = id_dpto FROM registro.se_prof_admitidos WHERE id = @maxId; "
                + "END "
                + "SELECT @result Resultado, @typeEmp Tipo, @rol Rol, @idDpto Dpto;";
        try {
            conectarBD();
            retorno = consultar(consulta, 4, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }

        desconectarBD();
        return retorno;
    }

    public Vector getConsultaCarne(String carne) {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = "SELECT  E.id_est Carne, "
                + "E.nom_est Nombre, "
                + "PROG.nom_prog Programa "
                + "FROM registro.estudiante E "
                + "INNER JOIN registro.plan_estud PE ON PE.id_plan = E.id_plan "
                + "INNER JOIN registro.programas PROG ON PROG.id_prog = PE.id_prog "
                + "WHERE   (E.id_est = '" + carne + "' "
                + "OR E.doc_est = '" + carne + "') "
                + "AND E.estado > 0";
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }

        desconectarBD();
        return retorno;
    }
    
    public Vector getPerRealCarne(String carne) {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = "select per_ingreal, nom_est, tip_est from registro.estudiante where id_est='"+carne+"'";
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }

        desconectarBD();
        return retorno;
    }
    
    

    public Vector getAsigEstud(String carne, String perAcad) {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = "SELECT  '0' OrdId, "
                + "'0' ID, "
                + "'Otra' Asignaturas "
                + "UNION "
                + "SELECT  '1' OrdId, "
                + "ASIG.id_asig ID, "
                + "ASIG.cod_asig Asignaturas "
                + "FROM registro.registro R "
                + "INNER JOIN registro.grupo GR ON (GR.id_grupo = R.id_grupo AND GR.per_acad = R.per_acad) "
                + "INNER JOIN registro.asignatura ASIG ON GR.id_asig = ASIG.id_asig "
                + "WHERE   R.id_est = '" + carne + "' "
                + "AND R.per_acad = '" + perAcad + "' "
                + "ORDER BY OrdId, Asignaturas";
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }

        desconectarBD();
        return retorno;
    }

    public int setConsultaEst(String fecha, String profesor, String carne, String visita, String tipo, String asignatura, String tema, String observaciones, String perAcad) {
        int retorno = 0;
        try {
            conectarBD();
            String consulta = new String();
            consulta = "INSERT INTO registro.se_consultas (fecha, cod_emp, id_est, voluntario, tipo, id_asig, tema, observaciones, per_acad) "
                    + "VALUES ('" + fecha + "', '" + profesor + "' , " + carne + ", " + visita + ", '" + tipo + "', " + asignatura + ", '" + tema + "', '" + observaciones + "', '" + perAcad + "')";
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector getHistConsultasEst(String carne, String perAcad, int tipoEmp) {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = "SELECT  CONVERT(VARCHAR(10), CONS.fecha, 103) Fecha, "
                + "EMP.nombres + ' ' + EMP.apellidos Profesor, "
                + "EST.nom_est Estudiante, "
                + "CONS.id_est Carne, "
                + "CONS.tipo Tipo, "
                + "ISNULL(ASIG.cod_asig, 'Otra') Asignatura, "
                + "CONS.tema Tema "
                + "FROM registro.se_consultas CONS "
                + "INNER JOIN apolo.rechum.empleados EMP ON EMP.num_id = CONS.cod_emp "
                + "INNER JOIN registro.estudiante EST ON EST.id_est = CONS.id_est "
                + "LEFT JOIN registro.asignatura ASIG ON ASIG.id_asig = CONS.id_asig "
                + "WHERE   CONS.id_est = '" + carne + "' "
                + "AND CONS.per_acad = '" + perAcad + "' ";

        if (tipoEmp == 1) {
            consulta += "AND CONS.tipo = 'Salud' ";
        } else if (tipoEmp == 2) {
            consulta += "AND CONS.tipo IN ('Académica', 'Acompañamiento', 'Psicología') ";
        } else {
            consulta += "AND CONS.tipo IN ('Académica', 'Acompañamiento') ";
        }

        consulta += "ORDER BY CONS.fecha DESC";
        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }

        desconectarBD();
        return retorno;
    }

    public Vector getHistConsultasEstCompl(String carne, String perAcad, int tipoEmp) {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = "SELECT  CONVERT(VARCHAR(10), CONS.fecha, 103) Fecha, "
                + "EMP.nombres + ' ' + EMP.apellidos Profesor, "
                + "EST.nom_est Estudiante, "
                + "CONS.id_est Carne, "
                + "PROG.nom_prog Programa, "
                + "EST.sem_est Semestre, "
                + "CONS.tipo Tipo, "
                + "ISNULL(ASIG.cod_asig, 'Otra') Asignatura, "
                + "CASE CONS.voluntario WHEN 0 THEN 'Si' ELSE 'No' END Remitido, "
                + "CONS.tema Tema, "
                + "CONS.observaciones Observaciones "
                + "FROM registro.se_consultas CONS "
                + "INNER JOIN apolo.rechum.empleados EMP ON EMP.num_id = CONS.cod_emp "
                + "INNER JOIN registro.estudiante EST ON EST.id_est = CONS.id_est "
                + "INNER JOIN registro.plan_estud PE ON PE.id_plan = EST.id_plan "
                + "INNER JOIN registro.programas PROG ON PROG.id_prog = PE.id_prog "
                + "LEFT JOIN registro.asignatura ASIG ON ASIG.id_asig = CONS.id_asig "
                + "WHERE   CONS.id_est = '" + carne + "' "
                + "AND CONS.per_acad = '" + perAcad + "' ";

        if (tipoEmp == 1) {
            consulta += "AND CONS.tipo = 'Salud' ";
        } else if (tipoEmp == 2) {
            consulta += "AND CONS.tipo IN ('Académica', 'Acompañamiento', 'Psicología') ";
        } else {
            consulta += "AND CONS.tipo IN ('Académica', 'Acompañamiento') ";
        }

        consulta += "ORDER BY CONS.fecha DESC";
        try {
            conectarBD();
            retorno = consultar(consulta, 11, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }

        desconectarBD();
        return retorno;
    }

    public Vector getHistConsultasProf(String codEmp, String perAcad) {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = "SELECT  CONVERT(VARCHAR(10), CONS.fecha, 103) Fecha, "
                + "EST.nom_est Estudiante, "
                + "CONS.id_est Carne, "
                + "CONS.tipo Tipo, "
                + "ISNULL(ASIG.cod_asig, 'Otra') Asignatura, "
                + "CONS.tema Tema "
                + "FROM registro.se_consultas CONS "
                + "INNER JOIN registro.estudiante EST ON EST.id_est = CONS.id_est "
                + "LEFT JOIN registro.asignatura ASIG ON ASIG.id_asig = CONS.id_asig "
                + "WHERE   CONS.cod_emp = '" + codEmp + "' "
                + "AND CONS.per_acad = '" + perAcad + "' "
                + "ORDER BY CONS.fecha DESC";
        try {
            conectarBD();
            retorno = consultar(consulta, 6, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }

        desconectarBD();
        return retorno;
    }

    public Vector getHistConsultasProfCompl(String codEmp, String perAcad) {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = "SELECT  CONVERT(VARCHAR(10), CONS.fecha, 103) Fecha, "
                + "EST.nom_est Estudiante, "
                + "CONS.id_est Carne, "
                + "PROG.nom_prog Programa, "
                + "EST.sem_est Semestre, "
                + "CONS.tipo Tipo, "
                + "ISNULL(ASIG.cod_asig, 'Otra') Asignatura, "
                + "CASE CONS.voluntario WHEN 0 THEN 'Si' ELSE 'No' END Remitido, "
                + "CONS.tema Tema, "
                + "CONS.observaciones Observaciones "
                + "FROM registro.se_consultas CONS "
                + "INNER JOIN registro.estudiante EST ON EST.id_est = CONS.id_est "
                + "INNER JOIN registro.plan_estud PE ON PE.id_plan = EST.id_plan "
                + "INNER JOIN registro.programas PROG ON PROG.id_prog = PE.id_prog "
                + "LEFT JOIN registro.asignatura ASIG ON ASIG.id_asig = CONS.id_asig "
                + "WHERE   CONS.cod_emp = '" + codEmp + "' "
                + "AND CONS.per_acad = '" + perAcad + "' "
                + "ORDER BY CONS.fecha DESC";
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }

        desconectarBD();
        return retorno;
    }

    public Vector getHistConsultasDec(int idDpto, String perAcad, int rolEmp) {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = "SELECT  CONVERT(VARCHAR(10), CONS.fecha, 103) Fecha, "
                + "EMP.nombres + ' ' + EMP.apellidos Profesor, "
                + "EST.nom_est Estudiante, "
                + "CONS.id_est Carne, "
                + "CONS.tipo Tipo, "
                + "ISNULL(ASIG.cod_asig, 'Otra') Asignatura, "
                + "CONS.tema Tema "
                + "FROM registro.se_consultas CONS "
                + "INNER JOIN apolo.rechum.empleados EMP ON EMP.num_id = CONS.cod_emp "
                + "INNER JOIN registro.estudiante EST ON EST.id_est = CONS.id_est "
                + "LEFT JOIN registro.asignatura ASIG ON ASIG.id_asig = CONS.id_asig "
                + "WHERE   CONS.per_acad = '" + perAcad + "' "
                + "AND CONS.tipo IN ('Académica', 'Acompañamiento') ";

        if (rolEmp != 2) {
            consulta += "AND EST.id_dpto = '" + idDpto + "' ";
        }

        consulta += "ORDER BY CONS.fecha DESC";

        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }

        desconectarBD();
        return retorno;
    }

    public Vector getHistConsultasDecCompl(int idDpto, String perAcad, int rolEmp) {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = "SELECT  CONVERT(VARCHAR(10), CONS.fecha, 103) Fecha, "
                + "EMP.nombres + ' ' + EMP.apellidos Profesor, "
                + "EST.nom_est Estudiante, "
                + "CONS.id_est Carne, "
                + "PROG.nom_prog Programa, "
                + "EST.sem_est Semestre, "
                + "CONS.tipo Tipo, "
                + "ISNULL(ASIG.cod_asig, 'Otra') Asignatura, "
                + "CASE CONS.voluntario WHEN 0 THEN 'Si' ELSE 'No' END Remitido, "
                + "CONS.tema Tema, "
                + "CONS.observaciones Observaciones "
                + "FROM registro.se_consultas CONS "
                + "INNER JOIN apolo.rechum.empleados EMP ON EMP.num_id = CONS.cod_emp "
                + "INNER JOIN registro.estudiante EST ON EST.id_est = CONS.id_est "
                + "INNER JOIN registro.plan_estud PE ON PE.id_plan = EST.id_plan "
                + "INNER JOIN registro.programas PROG ON PROG.id_prog = PE.id_prog "
                + "LEFT JOIN registro.asignatura ASIG ON ASIG.id_asig = CONS.id_asig "
                + "WHERE   CONS.per_acad = '" + perAcad + "' "
                + "AND CONS.tipo IN ('Académica', 'Acompañamiento') ";

        if (rolEmp != 2) {
            consulta += "AND EST.id_dpto = '" + idDpto + "' ";
        }

        consulta += "ORDER BY CONS.fecha DESC";

        try {
            conectarBD();
            retorno = consultar(consulta, 11, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }

        desconectarBD();
        return retorno;
    }

    @Override
    public Vector getPeriodos() throws RemoteException {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = "select distinct(per_acad) from registro.actasmat where DATALENGTH(per_acad)=6 order by per_acad";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }

        desconectarBD();
        return retorno;
    }
}
