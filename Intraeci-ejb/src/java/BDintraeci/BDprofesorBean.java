package BDintraeci;

import java.rmi.RemoteException;
import javax.ejb.*;
import java.util.Properties;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.*;
import javax.naming.*;

/**
 * This is the bean class for the BDprofesorBean enterprise bean. Created
 * 10/11/2006 09:14:20 AM
 *
 * @author 
 */
public class BDprofesorBean implements SessionBean, BDprofesorRemoteBusiness {

    private SessionContext context;
    private boolean conectado;
    private static final String dbName = "jdbc/registro";
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

    private void conectarBD() {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup(dbName);
            con = ds.getConnection();
            conectado = true;
        } catch (Exception ex) {
            conectado = false;
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
    }

    private void conectarBPM() {
        try {
            String dbNameBPM = "jdbc/bpms";
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup(dbNameBPM);
            con = ds.getConnection();
            conectado = true;
        } catch (Exception ex) {
            conectado = false;
            mensaje = "No se puede hacer la conexion con la base de datos. " + ex.getMessage();
        }
    }

    private void desconectarBD() {
        try {
            con.close();
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
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
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        prepStmt.close();
        if (lista.size() > 0 && preg == 0) {
            info = (Vector) lista.elementAt(0);
        } else if (preg == 1) {
            return lista;
        }
        return info;
    }

    private HashMap getConsulta(String consulta) throws SQLException {
        ResultSet resCons_ = null;
        HashMap resultado_ = new HashMap();
        PreparedStatement sentenciaConsulta_ = null;
        try {
            sentenciaConsulta_ = con.prepareStatement(consulta);
            resCons_ = sentenciaConsulta_.executeQuery();
            ResultSetMetaData rsm = resCons_.getMetaData();
            //Almacenamos la tabla con las propiedades obtenidas y su resultado
            while (resCons_.next()) {
                for (int i = 1; i <= rsm.getColumnCount(); i++) {
                    resultado_.put(rsm.getColumnName(i), resCons_.getString(i));
                }
            }
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        } finally {
            try {
                sentenciaConsulta_.close();
            } catch (SQLException ex) {
                mensaje = mensaje + "Unable to fetch status due to SQLException: " + ex.getMessage();
            }
            return resultado_;
        }
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
    // Add business logic below. (Right-click in editor and choose
    // "EJB Methods > Add Business Method" or "Web Service > Add Operation")

    //CONSULTAR ASIGNATURAS DE PREGRADO PARA LISTAS DE CLASE
    public Vector getAsignaturasLabs(String peraca, String idProf) {
        //TODO implement getAsignaturas
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select registro.asignatura.cod_asig, num_grupo, id_grupo, nom_asig, registro.asignatura.id_asig " + " from registro.asignatura, registro.grupo, registro.profesor " + " where  registro.profesor.id_prof=registro.grupo.id_profesor and " + " registro.grupo.id_asig=registro.asignatura.id_asig and " + " per_acad= '" + peraca + "' and id_profesor= '" + idProf + "' and cod_asig not like '%(%' " + " order by cod_asig, num_grupo ";
        try {

            conectarBD();
            retorno = consultar(consulta, 5, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();

        return retorno;

    }

    //CONSULTA LISTA DE CLASE CON VISTA 
    public Vector getListasClase(String peraca, String idasig, String numgrupo) {

        //TODO implement getAsignaturas

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select nom_est,  nota1, nota2, nota3,nota_lab ,clave, registro.estudiante.id_est,registro.programas.cod_prog, " + " registro.estudiante.emails, falla1,falla2,falla3,falla4, nota4, falla5, cont_cierre, niv,nota, id_grupo " + " from  registro.estudiante, registro.regiscomp, registro.plan_estud, registro.programas " + " where registro.estudiante.id_est = registro.regiscomp.id_est  and registro.regiscomp.per_acad = '" + peraca + "' and " + " registro.estudiante.id_plan = registro.plan_estud.id_plan and registro.regiscomp.id_asig = '" + idasig + "' and " + " registro.plan_estud.id_prog = registro.programas.id_prog and registro.regiscomp.num_grupo = " + numgrupo + " " + " order by nom_est  ";
        try {
            conectarBD();
            retorno = consultar(consulta, 19, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    public Vector getCedulaEst(String id_est) {

        //TODO implement getAsignaturas

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select doc_est from registro.estudiante where id_est='"+id_est+"'";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    //07 junio 2017 Lista de asignaturas para enviar correo de pre y pos sacada de la VISTA
    public Vector ListasEnvioCorreoPrePos(String idprof, String peraca) {

        //TODO implement getAsignaturas

        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select distinct id_grupo,registro.regiscomp.id_asig, num_grupo, cod_asig " 
                  + " from registro.regiscomp, registro.asignatura " 
                  + " where id_profesor='"+idprof+"' and per_acad='"+peraca+"' and registro.regiscomp.id_asig= registro.asignatura.id_asig ";
        try {
            conectarBD();
            retorno = consultar(consulta, 4, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;


    }

    public Vector getAsignaturas(String peraca, String idProf) {
        //TODO implement getAsignaturas
        Vector retorno = new Vector();
        String consulta = new String();
        //and cod_asig not like '%(%' :SEQUITA PARA QUE SALGAN LAS COTERMINALES POSGRADO CON SOLO EST DE PREGRADO 24/02/2017 
        consulta = "select registro.asignatura.cod_asig, num_grupo, id_grupo, nom_asig, registro.asignatura.id_asig, numlab, seguimiento " + " from registro.asignatura, registro.grupo, registro.profesor " + " where  registro.profesor.id_prof=registro.grupo.id_profesor and " + " registro.grupo.id_asig=registro.asignatura.id_asig and " + " per_acad= '" + peraca + "' and id_profesor= '" + idProf + "' and " + " ((num1 + num2 + num3 + num4 + numlab) = 100 or (num1 + num2 + num3 + num4 + numlab) = 1000)" + " and cod_asig not like '%(%' order by cod_asig, num_grupo ";
        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    //Consulta asignaturas de seguimiento
    public Vector getAsignaturasSeg(String peraca, String idProf) {
        //TODO implement getAsignaturas
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select registro.asignatura.cod_asig, num_grupo, id_grupo, nom_asig, registro.asignatura.id_asig, numlab, seguimiento " + " from registro.asignatura, registro.grupo, registro.profesor " + " where  registro.asignatura.seguimiento='S' and registro.profesor.id_prof=registro.grupo.id_profesor and " + " registro.grupo.id_asig=registro.asignatura.id_asig and " + " per_acad= '" + peraca + "' and id_profesor= '" + idProf + "' and " + " ((num1 + num2 + num3 + num4 + numlab) = 100 or (num1 + num2 + num3 + num4 + numlab) = 1000)" + " order by cod_asig, num_grupo ");
        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    //Insertar observaciones a estudiantes de seguimiento academico
    public int InsertarObserva(String idest, String idasig, String obs, String periodo, String tercio, String idgrupo, String nrog, String alarma, String docu) {
        int retorno = 0;
        String consulta = new String();
        try {
            conectarBD();
            consulta = new String("insert into registro.observaseguimiento "
                    + " (id_asig, id_est,  observaciones, periodo, tercio, id_grupo, nro_grupo, alarma, fecha, doc_prof)  values ( '" + idasig + "', '" + idest + "', '" + obs + "', '" + periodo + "', '" + tercio + "', '" + idgrupo + "', '" + nrog + "','" + alarma + "', getdate()  ,'" + docu + "') ");
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Insertar datos en el log cdo se envia correo a estudiantes
    public int LogEnviaCorreo(String idProf, String idasig, String idgrupo, String asunto) {
        int retorno = 0;
        String consulta = new String();
        try {
            conectarBD();
            consulta = new String("insert into registro.logenvia_correo "
                    + " (id_prof, id_asig,  id_grupo, fecha, asunto)  values ( '" + idProf + "', '" + idasig + "', '" + idgrupo + "',  getdate()  ,'" + asunto + "') ");
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Auditoría para modificación de Notas PREGRADO
    public int Insertarlogaudit(String idprof, String datosasigna, String razon, String idgrupo, String idest, String nota, String campo) {
        int retorno = 0;
        String consulta = new String();
        try {
            conectarBD();
            consulta = "insert into registro.logaudit " + "  (usu, modu,  prc, oper, fec, sent) values ( '" + idprof + "', 'ModNotasWeb', '" + razon + "', 'U', getdate(), 'update registro.registro set " + campo + " =" + nota + ", rec = S where id_grupo = " + idgrupo + "  and id_est =" + idest + "'  ) ";
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Auditoría para modificación de Notas ASIG PREGRADO CON  EST POSG
    public int InsertarlogauditPos(String idprof, String datosasigna, String razon, String idasig, String idest, String nota, String campo, String grupo) {
        int retorno = 0;
        String consulta = new String();
        try {
            conectarBD();
            consulta = "insert into registro.logaudit " + "  (usu, modu,  prc, oper, fec, sent) values ( '" + idprof + "', 'ModNotasWeb', '" + razon + "', 'U', getdate(), 'update registro.biblia_post set " + campo + " =" + nota + " where id_asig = " + idasig + "  and nr_grp= " + grupo + " and id_est =" + idest + "'  ) ";
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //insertar el log de la modificación de notas
    public int Insertarlogmodinotas(String idprof, String datosasigna, String razon, String idgrupo, String idest, String nota, String campo) {
        int retorno = 0;
        String consulta = new String();
        try {
            conectarBD();
            consulta = "insert into registro.logaudit "
                    + "  (usu, modu,  prc, oper, fec, sent) values ( '" + idprof + "', 'ModNotasWeb', '" + razon + "', 'U', getdate(), 'update registro.registro set " + campo + " =" + nota + ", rec = S  where id_grupo = " + idgrupo + "  and id_est =" + idest + " ' ) ";
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public int InsertarModiNotas(String sec, String idprof, String periodo, String idasig, String idgrupo, String numgrupo, String tercio, String idest, String nota, String notanva, String operacion, String razon) {
        int retorno = 0;
        String consulta = new String();
        try {
            conectarBD();
            consulta = "insert into registro.logmodinotas " + " values ('" + sec + "',   '" + idprof + "', '" + periodo + "', getdate(), '" + idasig + "', '" + idgrupo + "',  '" + numgrupo + "', '" + tercio + "',  '" + idest + "','" + nota + "',  '" + notanva + "', '" + operacion + "', '" + razon + "' ) ";
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Consultar secuencia para modificacion de Notas
    public String sigSecuencia(String entidad) {
        Vector retorno = new Vector();
        int retsec = 0;
        String consulta = new String();
        consulta = new String("select convert(varchar(10), sig_sec) from registro.secuencias where nombre = '" + entidad + "' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
            consulta = new String("update registro.secuencias set sig_sec = sig_sec + incr where nombre = '" + entidad + "' ");
            retsec = actualizar(consulta);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        //if(retorno.size()>0)
        return retorno.elementAt(0).toString();

    }

    //Para llevar los datos de la asignatura que el profesor selecciono
    public Vector getAsignaturasNotas(String peraca, String idProf, String idasig, String idgrupo) {
        //TODO implement getAsignaturas
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select registro.asignatura.cod_asig, num_grupo, id_grupo, nom_asig, registro.asignatura.id_asig, numlab, num1, num2,num3, num4 "
                + " from registro.asignatura, registro.grupo, registro.profesor "
                + " where  registro.profesor.id_prof=registro.grupo.id_profesor and "
                + " registro.grupo.id_asig=registro.asignatura.id_asig and "
                + " per_acad= '" + peraca + "' and id_profesor= '" + idProf + "' and   registro.asignatura.id_asig='" + idasig + "' and id_grupo='" + idgrupo + "' and " + " ((num1 + num2 + num3 + num4 + numlab) = 100 or (num1 + num2 + num3 + num4 + numlab) = 1000)"
                + " order by cod_asig, num_grupo ");
        try {
            conectarBD();
            retorno = consultar(consulta, 10, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    public String getEstudiantes(String idgrupo, String peraca) {
        //TODO implement getEstudiantes
        String consulta = new String();
        consulta = new String("select registro.asignatura.cod_asig, num_grupo, id_grupo, nom_asig, registro.asignatura.id_asig " + "from registro.asignatura, registro.grupo, registro.profesor " + "where  registro.profesor.id_prof=registro.grupo.id_profesor and " + "registro.grupo.id_asig=registro.asignatura.id_asig and " + " per_acad= '" + peraca + "' and id_profesor= '" + idgrupo + "' order by cod_asig, num_grupo ");
        return consulta;
    }

    public Vector getSumaNotas(String idgrupo, String peraca) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select id_grupo, id_profesor, s1, sum1, s2, sum2, "
     + "s3, sum3, sl, sumlab, convert(varchar, fe1, 106), convert(varchar, fe2, 106), "
     + "convert(varchar, fe3, 106), convert(varchar, fel, 106), s4, sum4, convert(varchar, fe4, 106)"
     + "from registro.grupo, registro.congrp "
     + "where  registro.grupo.id_grupo = registro.congrp.id_grp and "
     + "registro.grupo.id_grupo = '" + idgrupo + "' and " + "per_acad = '" + peraca + "'  ";
        try {
            conectarBD();
            retorno = consultar(consulta, 17, 1);
        } catch (SQLException ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getListaNotas(String idgrupo, String peraca) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select nom_est,  nota1, nota2, nota3,nota_lab ,clave, " + "registro.estudiante.id_est,registro.facultad.cod_fac,registro.estudiante.emails, falla1,falla2,falla3,falla4, nota4, falla5, cont_cierre " + "from  registro.estudiante, registro.registro,registro.departamento, registro.facultad  " + "where registro.estudiante.id_est = registro.registro.id_est  " + "and registro.registro.per_acad = '" + peraca + "' and  " + "registro.estudiante.id_dpto=registro.departamento.id_dpto and " + "registro.departamento.id_fac=registro.facultad.id_fac and " + "registro.registro.id_grupo  = '" + idgrupo + "' order by nom_est ";
        try {
            conectarBD();
            retorno = consultar(consulta, 16, 1);
        } catch (SQLException ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getListaEnviarCorreo(String idgrupo, String peraca) {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = "select nom_est,  nota1, nota2, nota3,nota_lab ,clave, "
                + "registro.estudiante.id_est,registro.facultad.cod_fac,registro.estudiante.emails  "
                + "from  registro.estudiante, registro.registro,registro.departamento, registro.facultad   "
                + " where registro.estudiante.id_est = registro.registro.id_est  and registro.registro.per_acad ='" + peraca + "' "
                + " and registro.estudiante.id_dpto=registro.departamento.id_dpto and registro.departamento.id_fac=registro.facultad.id_fac and "
                + " registro.registro.id_grupo  = '" + idgrupo + "' union "
                + " select es.nom_est, bp.nota,'','','', bp.clave, es.id_est, '',es.emails "
                + " from registro.estudiante es, registro.biblia_post bp, registro.programas pg, registro.plan_estud pe "
                + " where es.id_est = bp.id_est and clave in ('C', 'Z') and   es.estado <= -91 and bp.id_grupo = '" + idgrupo + "' and "
                + "es.id_plan = pe.id_plan  and pg.id_prog = pe.id_prog  order by nom_est ";

        try {
            conectarBD();
            retorno = consultar(consulta, 9, 1);
        } catch (SQLException ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }

        desconectarBD();
        return retorno;
    }

    public HashMap getUsuarioBPM(String idEmp) {
        HashMap retorno_ = new HashMap();
        String consulta = new String();
        consulta = "select ID,NombreCompleto from AP_WSSV_AP__EmpleadosFichas where CodigoERP='" + idEmp + "'";
        try {
            conectarBPM();
            retorno_ = getConsulta(consulta);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno_;
    }

    public int IngresaNotas(String campo, String idgrupo, String idest, String nota) {
        String consulta = new String();
        int retorno = 0;
        consulta = new String("update registro.registro set " + campo + " = '" + nota + "', rec = 'S' " + " where id_grupo = '" + idgrupo + "'  and id_est ='" + idest + "'  ");
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //ACTUALIZAR NOTAS Y FALLAS DE SEGUIMIENTO ACADEMICO
    public int IngresaNotasSeg(String campo, String idgrupo, String idest, String nota, String var, String falla) {
        String consulta = new String();
        int retorno = 0;
        consulta = new String("update registro.registro set " + campo + " = '" + nota + "', rec = 'S', " + var + " = '" + falla + "' " + " where id_grupo = '" + idgrupo + "'  and id_est ='" + idest + "'  ");
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector NotasSeg(String idest) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select nota1, nota2,nota3,nota_lab, nota4  from registro.registro " + " where id_est ='" + idest + "'  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 5, 0);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Alarmas(String idest, String tercio, String idasig, String peraca, int tipo) {
        Vector retorno = new Vector();
        String consulta = new String();
        if (tipo == 1) {
            consulta = new String("select alarma, observaciones from registro.observaseguimiento " + " where id_est ='" + idest + "' and id_asig= '" + idasig + "'  and periodo= '" + peraca + "' order by fecha desc ");
        } else {
            consulta = new String("select alarma, convert(char(10), fecha,103) + ' ' + nom_asig + + ' Grp: ' + "
                    + "convert(varchar(3),nro_grupo) + ' ' +observaciones from registro.observaseguimiento, registro.asignatura "
                    + " where registro.observaseguimiento.id_asig = registro.asignatura.id_asig and id_est = " + idest + " and periodo= '" + peraca + "'  "
                    + " union select alarma, convert(char(10), fecha,103) + ' ' +observaciones  "
                    + "from  registro.observaseguimiento  where  id_est = " + idest + " and id_asig=0 and periodo= '" + peraca + "' ");
        }
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector InformeAconsejados( String peraca, String idProf) {
        Vector retorno = new Vector();
        String consulta = new String();

        consulta = "   select registro.estudiante.id_est, nom_est,  observaciones, tercio, alarma, cod_asig, nom_asig, nota1, nota2, nota3, nota4, nota_lab, id_dpto, emails "
     + "from registro.tutoreado, registro.estudiante, registro.observaseguimiento,  registro.asignatura, registro.registro "
     + "where (registro.tutoreado.idest = registro.estudiante.id_est) and "
     + "(registro.tutoreado.idest = registro.observaseguimiento.id_est) and "
     + " registro.asignatura.id_asig= registro.observaseguimiento.id_asig and "
     + " registro.estudiante.id_est= registro.registro.id_est and "
     + "(peracad = periodo) and peracad = '" + peraca + "'   and registro.registro.as_vis=registro.observaseguimiento.id_asig and idprof = '" + idProf + "' "
     + " union "
     + "select registro.estudiante.id_est, nom_est, observaciones, tercio, alarma, '', '','','','','','', id_dpto, emails "
     + "from registro.tutoreado, registro.estudiante, registro.observaseguimiento "
     + "where (registro.tutoreado.idest = registro.estudiante.id_est) and "
     + "(registro.tutoreado.idest = registro.observaseguimiento.id_est)  and "
     + "(peracad = periodo) and peracad = '" + peraca + "' and idprof = '" + idProf + "' and id_asig = 0 order by  registro.estudiante.nom_est,tercio ";

        try {
            conectarBD();
            retorno = consultar(consulta, 14, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector AlarmasTutor(String idest) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select alarma, observaciones from registro.observaseguimiento " + " where id_est ='" + idest + "' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int IngresaAcum(String campo, String acum, String fec, String idgrupo, String idasig) {
        String consulta = new String();
        int retorno = 0;
        consulta = new String("update registro.congrp set " + campo + " = '" + acum + "', " + fec + " = getdate() " + " where id_grp = '" + idgrupo + "' and id_asig = '" + idasig + "' ");
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

//MODIFICAR SUMATORIA PREGRADO-CON EST POSGRADO TRAER DATOS PRIMERO DE LAS DOS TABLAS para sumarlos y poder actualizar
    public Vector IngresaAcumModPrePos(String campo1, String idgrupo, String idasig, String idgrupoP, String periodo) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "(select sum(" + campo1 + ") " + " from registro.registro where registro.registro.id_grupo = '" + idgrupo + "' and " + campo1 + " is not null ) " + " union "
                + " (select sum(" + campo1 + ") from registro.biblia_post where (registro.biblia_post.id_grupo = '" + idgrupoP + "' or registro.biblia_post.id_asig = '" + idasig + "') and " + campo1 + " is not null ) ";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

//Ingresar suma notas cuando hay modificaciones para pregrado con estud de posgrado
    public int IngresaAcumMod(String campo, int total, String idgrupo, String idasig) {
        String consulta = new String();
        int retorno = 0;
        // consulta = "update registro.congrp set " + campo + " = " + " (select sum(" + campo1 + ") " + " from registro.registro where registro.registro.id_grupo = '" + idgrupo + "' and " + campo1 + " is not null ) " + " where id_grp = '" + idgrupo + "'  and id_asig = '" + idasig + "' ";
        consulta = "update registro.congrp set " + campo + " = '" + total + "'  where id_grp = '" + idgrupo + "'  and id_asig = '" + idasig + "' ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    //Modificacion acumulado estudiante de pregrado
    public int IngresaAcumModPRE(String campo, String campo1, String idgrupo, String idasig) {
        String consulta = new String();
        int retorno = 0;
        consulta = "update registro.congrp set " + campo + " = " + " (select sum(" + campo1 + ") " + " from registro.registro where registro.registro.id_grupo = '" + idgrupo + "' and " + campo1 + " is not null ) " + " where id_grp = '" + idgrupo + "'  and id_asig = '" + idasig + "' ";
        // consulta = "update registro.congrp set " + campo + " = '" + total + "'  where id_grp = '" + idgrupo + "'  and id_asig = '" + idasig + "' ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector getHorarioPos(String idProf, String peraca) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select nom_prof, cod_asig, cod_sal, dia, hora_ini, hora_fin, nro, registro.grupo_post.id_grp "
                + " from registro.profesor, registro.grupo_POST, registro.asignatura, registro.sal_grupo, registro.salones "
                + " where registro.profesor.id_prof = registro.grupo_post.id_prof and registro.grupo_post.id_asig=registro.asignatura.id_asig and "
                + "registro.grupo_post.id_grp = registro.sal_grupo.id_grupo and  registro.sal_grupo.id_sal = registro.salones.id_sal and registro.sal_grupo.per_acad =  registro.grupo_post.per_acad and "
                + "registro.grupo_post.per_acad = '" + peraca + "' and  registro.profesor.id_prof = '" + idProf + "' order by dia ";
        try {
            conectarBD();
            retorno = consultar(consulta, 8, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    

    public Vector getHorario(String idProf, String peraca) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select nom_prof, cod_asig, " + "cod_sal, dia, hora_ini, hora_fin, num_grupo, registro.grupo.id_grupo " + "from registro.profesor, registro.grupo, registro.asignatura, " + "registro.sal_grupo, registro.salones " + "where registro.profesor.id_prof = registro.grupo.id_profesor and " + "registro.grupo.id_asig=registro.asignatura.id_asig and " + "registro.grupo.id_grupo = registro.sal_grupo.id_grupo and  " + "registro.sal_grupo.id_sal = registro.salones.id_sal and  " + "registro.grupo.per_acad = '" + peraca + "' and " + " id_prof = '" + idProf + "' order by dia ";
        try {
            conectarBD();
            retorno = consultar(consulta, 8, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    //MOSTRAR HORARIO PARA SOLICITAR VIDEO BEAM
    public Vector getHorarioVideoBeam(String idProf, String peraca) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select nom_prof, cod_asig, " + "cod_sal, dia, hora_ini, hora_fin, num_grupo, registro.grupo.id_grupo, id_sal_grupo  " + "from registro.profesor, registro.grupo, registro.asignatura, " + "registro.sal_grupo, registro.salones " + "where registro.profesor.id_prof = registro.grupo.id_profesor and " + "registro.grupo.id_asig=registro.asignatura.id_asig and " + "registro.grupo.id_grupo = registro.sal_grupo.id_grupo and  " + "registro.sal_grupo.id_sal = registro.salones.id_sal and  " + "registro.grupo.per_acad = '" + peraca + "' and " + " id_prof = '" + idProf + "' order by dia, hora_ini ";
        try {
            conectarBD();
            retorno = consultar(consulta, 9, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    //Actualizar uso del Videp Beam en cada sesión de clase.
     public int UsoVideoBeam(String uso, String idsal) {
        String consulta = new String();
        int retorno = 0;
       
        consulta = "update registro.sal_grupo set uso_vb = '" + uso + "'      "
     + "where id_sal_grupo = " + idsal + " ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    
    
    

    public Vector getHorarioExamenes(String idProf, String peraca) {
        Vector retorno = new Vector();
        String consulta = new String();
        /*consulta = new String("select T.nom_prof, cod_asig, num_grupo,sal_ex, dia_ex, hora_ex, cod_sal, desf, A.nom_prof " +
         "from registro.profesor T, registro.profesor A, registro.grupo, registro.asignatura, " + "registro.salones, registro.fechas " +
         "where (T.id_prof = registro.grupo.id_profesor and registro.grupo.prof_aux *= A.id_prof ) and " +
         "registro.grupo.id_asig=registro.asignatura.id_asig  and " + "registro.salones.id_sal=registro.grupo.sal_ex and " +
         "registro.grupo.dia_ex=registro.fechas.idf and hora_ex > 0 and " +
         "registro.grupo.per_acad = '" + peraca + "'  and (registro.grupo.id_profesor = '" + idProf + "' or " +
         "registro.grupo.prof_aux = '" + idProf + "' ) and tipo_asig = 'N' ");*/

        consulta = new String("select T.nom_prof, registro.asignatura.cod_asig, registro.grupo.num_grupo, registro.grupo.sal_ex, "
                + "registro.grupo.dia_ex, registro.grupo.hora_ex, registro.salones.cod_sal, "
                + "registro.fechas.desf, A.nom_prof "
                + "FROM  registro.profesor AS T INNER JOIN "
                + "registro.grupo ON T.id_prof = registro.grupo.id_profesor LEFT OUTER JOIN "
                + "registro.profesor AS A ON registro.grupo.prof_aux = A.id_prof INNER JOIN "
                + "registro.asignatura ON registro.grupo.id_asig = registro.asignatura.id_asig INNER JOIN "
                + "registro.salones ON registro.grupo.sal_ex = registro.salones.id_sal INNER JOIN "
                + "registro.fechas ON registro.grupo.dia_ex = registro.fechas.idf "
                + "WHERE (registro.grupo.hora_ex > 0) AND (registro.grupo.per_acad = '" + peraca + "' ) AND (registro.grupo.id_profesor =  '" + idProf + "') AND (registro.asignatura.tipo_asig = 'N' OR registro.asignatura.tipo_asig = 'L') OR "
                + "(registro.grupo.hora_ex > 0) AND (registro.grupo.per_acad = '" + peraca + "') AND (registro.asignatura.tipo_asig = 'N' OR registro.asignatura.tipo_asig = 'L') AND (registro.grupo.prof_aux = '" + idProf + "' )");

        try {
            conectarBD();
            retorno = consultar(consulta, 9, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    /* public Vector getAsignaturasPos(String idProf, String impre) {
     Vector retorno = new Vector();
     String consulta = new String();
     consulta = "select registro.asignatura.cod_asig, nro, id_grp, nom_asig, " + "registro.asignatura.id_asig, per_acad " + "from registro.asignatura, registro.grupo_post, registro.profesor " + "where  registro.profesor.id_prof=registro.grupo_post.id_prof and " + "registro.grupo_post.id_asig=registro.asignatura.id_asig and  " + "id_grp in (select id_grupo from registro.biblia_post where clave in ('Z','E','C','O') ) and ";
     if (impre.equals("0")) {
     consulta = consulta + "suma=0 and fec is null and ";
     } else {
     consulta = consulta + "suma > 0 and ";
     }
     consulta = consulta + "registro.grupo_post.id_prof= '" + idProf + "' and cod_asig like '%(%' " + "order by cod_asig, nro";
     try {
     conectarBD();
     retorno = consultar(consulta, 6, 1);
     } catch (SQLException ex) {
     mensaje = new String(
     "Unable to fetch status due to SQLException: " + ex.getMessage());
     }
     desconectarBD();
     return retorno;
     }*/
    
    public Vector getAsignaturasPos(String idProf, String impre) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select * FROM REGISTRO.NOTAS_POSG WHERE ID_PROF='" + idProf + "' ";

        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    public Vector ImpresionPos(String idProf) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select * FROM REGISTRO.IMPRESIONPOSG WHERE ID_PROF='" + idProf + "' ";

        try {
            conectarBD();
            retorno = consultar(consulta, 7, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }
    
    
    

    public Vector getSumaNotasPosgrado(String idgrupo, String peraca) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = "select top 1 id_grp, id_prof, suma,  fec " + "from registro.grupo_post " + "where registro.grupo_post.id_grp = '" + idgrupo + "' and " + "registro.grupo_post.per_acad = '" + peraca + "' "
                + " union  "
                + " select top 1 registro.grupo.id_grupo, id_profesor, s1,  fe1 "
                + " from registro.grupo, registro.congrp, registro.registro "
                + " where (registro.grupo.id_grupo = registro.congrp.id_grp) and  "
                + "(registro.grupo.id_grupo = registro.registro.id_grupo) and registro.grupo.id_grupo = '" + idgrupo + "' and registro.grupo.per_acad = '" + peraca + "' ";
        
        try {
            conectarBD();
            retorno = consultar(consulta, 4, 1);
        } catch (SQLException ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getListaNotasPos(String idgrupo, String peraca) {
        Vector retorno = new Vector();

        //SE CAMBIA >= -99  POR <= -91
        String consulta = "select es.nom_est, bp.nota, bp.clave, es.id_est, es.emails, pg.cod_prog " + " from registro.estudiante es, registro.biblia_post bp, " + " registro.programas pg, registro.plan_estud pe " + " where es.id_est = bp.id_est and clave in ('C', 'Z', 'O') and  " + " es.estado <= -91 and bp.id_grupo = '" + idgrupo + "' and es.id_plan = pe.id_plan " + " and pg.id_prog = pe.id_prog " + " order by nom_est";
        /*consulta = new String("select nom_est, nota, clave, registro.estudiante.id_est, emails " +
         "from registro.estudiante, registro.biblia_post " +
         "where registro.estudiante.id_est = registro.biblia_post.id_est " +
         "and clave in ('C', 'Z') and  registro.estudiante.estado >= -99 and " +
         "registro.biblia_post.id_grupo = '" + idgrupo +"' order by nom_est ");*/

        try {
            conectarBD();
            retorno = consultar(consulta, 6, 1);
        } catch (SQLException ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int IngresaNotasPosgrado(String nota, String idgrupo, String idEst, String acum, String idasig) {
        String consulta = new String();
        int retorno = 0;
        consulta = "update registro.biblia_post set nota = '" + nota + "' " + " where id_grupo = '" + idgrupo + "'  and id_est = '" + idEst + "' ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
            if (retorno > 0) {
                consulta = ("update registro.grupo_post set suma = '" + acum + "' , fec= getdate() " + "where id_grp = '" + idgrupo + "' and id_asig = '" + idasig + "' ");
                retorno = actualizar(consulta);
            }
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //INGRESAR NOTAS ASIGNATURA DE PREGRADO CON ESTUDIANTES DE POSGRADO
    public int IngresaNotasPregradoPOS(String campo, String idgrupo, String idEst, String acum, String idasig, String nota) {
        String consulta = new String();
        int retorno = 0;
        // consulta = "update registro.biblia_post set nota = '" + nota + "' " + "where id_grupo = '" + idgrupo + "'  and id_est = '" + idEst + "' ";
        consulta = "update registro.biblia_post set " + campo + " = '" + nota + "'  where id_asig= '" + idasig + "' and nr_grp= '" + idgrupo + "' and id_est ='" + idEst + "'  ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
            /*  if (retorno > 0) {
             consulta = ("update registro.grupo_post set suma = '" + acum + "' , fec= getdate() " + "where id_grp = '" + idgrupo + "' and id_asig = '" + idasig + "' ");
             retorno = actualizar(consulta);
             }*/
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    //INGRESAR NOTAS ASIGNATURA DE POSGRADO CON ESTUDIANTES DE PREGRADO
    public int IngresaNotasPosgradoPRE(String idgrupo, String idEst, String nota) {
        String consulta = new String();
        int retorno = 0;

        consulta = "update registro.registro set nota1 = '" + nota + "', nota2= '" + nota + "',  nota3= '" + nota + "', nota= '" + nota + "', rec = 'S' " + " where id_grupo = '" + idgrupo + "'  and id_est ='" + idEst + "'  ";
        //   consulta = "update registro.registro set " + campo + " = '" + nota + "'  where id_asig= '" + idasig + "' and nr_grp= '"+idgrupo+"' and id_est ='" + idEst + "'  ";
        try {
            conectarBD();
            retorno = actualizar(consulta);
            /*  if (retorno > 0) {
             consulta = ("update registro.congrp set s1 = '" + acum + "' , fe1= getdate() " + "where id_grp = '" + idgrupo + "' and id_asig = '" + idasig + "' ");
             retorno = actualizar(consulta);
             }*/
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getListaspos(String idProf) {
        String consulta = new String();
        Vector retorno = new Vector();
//2009-1
        consulta = new String("select registro.asignatura.cod_asig, nro, id_grp, nom_asig, " + "registro.asignatura.id_asig, per_acad, nom_prof, nom_area " + "from registro.area, registro.asignatura, registro.grupo_post, registro.profesor " + "where  registro.profesor.id_prof=registro.grupo_post.id_prof and " + "registro.grupo_post.id_asig=registro.asignatura.id_asig  and  " + "registro.grupo_post.id_prof= '" + idProf + "' and per_acad >'2017-1 ' and " + "registro.area.id_area = registro.asignatura.id_area " + "order by registro.grupo_post.per_acad, cod_asig, nro");
        try {
            conectarBD();
            retorno = consultar(consulta, 8, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

//  Consulta entrevistas posgrados
    public Vector getentrevista(java.lang.String documprof, String peraca) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select nom_prof, convert(varchar, fec, 103), convert(varchar, fec, 108),nom_est, sitio " + " from registro.dispentrev, registro.profesor, registro.estudiante " + " where registro.dispentrev.idprof=registro.profesor.id_prof and registro.dispentrev.idest=registro.estudiante.id_est " + " and Convert(varchar(10),fec,103) >= Convert(varchar(10),getdate(),103) and registro.profesor.cc_prof='" + documprof + "' and per = '" + peraca + "' order by fec  ";
        try {
            conectarBD();
            retorno = consultar(consulta, 5, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getAsignaturasPos(String idEst) {
        //TODO implement getAsignaturas
        Vector retorno = new Vector();
        String consulta = new String();
        /*consulta = new String(" select bp.id_bib, ag.nom_asig, ag.cod_asig, bp.nr_grp, per_acad, clave " +
         " from registro.biblia_post bp, registro.asignatura ag " +
         " where bp.id_est = " + idEst + " and ag.id_asig = bp.id_asig " +
         " order by per_acad ");*/
        consulta = "select bp.id_bib, ag.nom_asig, ag.cod_asig, bp.nr_grp, per_acad, clave, cl.nom, bp.nota, bp.cred  " + " from registro.biblia_post bp, registro.asignatura ag, registro.claves cl " + " where bp.id_est =  " + idEst + " and ag.id_asig = bp.id_asig and cl.cd = clave " + " order by bp.nota, per_acad desc";
        try {
            conectarBD();
            retorno = consultar(consulta, 9, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector gettutoreados(String peraca, String idProf) {
        //TODO implement getAsignaturas
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String(" select registro.tutoreado.idprof, idest, peracad, nom_est, id_dpto, nom_acud, tel_acud, per_ing , emails" + " from registro.tutoreado, registro.estudiante " + " where  registro.estudiante.id_est=registro.tutoreado.idest and " + " peracad= '" + peraca + "' and idprof= '" + idProf + "' AND REGISTRO.ESTUDIANTE.igrad<>'G' order by nom_est ");
        /*consulta = new String(" select registro.tutoreado.idprof, idest, peracad, nom_est " +
         " from registro.tutoreado, registro.estudiante " +
         " where  registro.estudiante.id_est=registro.tutoreado.idest and " +
         " per_ing= '"+ peraca + "' and idprof= '" + idProf +"' ");*/

        try {
            conectarBD();
            retorno = consultar(consulta, 9, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector Historia(String idEst) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select per, clave, descit, cal, p1, p2, p3, p4, p5 from registro.detestud where id_est = '" + idEst + "' order by per, orden");
        try {
            conectarBD();
            retorno = consultar(consulta, 9, 1);
        } catch (SQLException ex) {
            mensaje = "Unable to fetch status due to SQLException: " + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }

    public Vector getConsultaPeriodos(String carnet) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select per_acad " + " from registro.biblia_def " + " where id_est = " + carnet + " group by per_acad union " + " select per_acad from registro.biblia_post " + " where id_est =  " + carnet + " and clave = 'Z' " + " group by per_acad " + " order by per_acad ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getdespNotas(String carnet, String peraca) {
        Vector retorno = new Vector();
        String consulta = new String();
        //sum_ult * 0.1 / can_ult
        consulta = new String("	select registro.estudiante.nom_est,  cod_dpto, " + " cod_plan, sumest * 0.1 / can, 0 , "
                + "sem_est,  per_acad, cod_asig, nom_asig, convert(char(3),nota * 0.1), nom, nomt, tpeva "
                + "from  registro.estudiante, registro.biblia_def, registro.asignatura, registro.sumnotas, "
                + "registro.plan_estud, registro.departamento, registro.claves, registro.codigos "
                + "where registro.estudiante.id_dpto = registro.departamento.id_dpto and "
                + "registro.estudiante.id_plan = registro.plan_estud.id_plan and "
                + "registro.estudiante.id_est = registro.biblia_def.id_est and "
                + " registro.estudiante.id_est = ide and "
                + " registro.biblia_def.as_vis = registro.asignatura.id_asig and "
                + "clave = cd  and prom = cdt and tipo = 'promt' and  "
                + "registro.biblia_def.per_acad = '" + peraca + "' and "
                + " registro.biblia_def.id_est = " + carnet + " union "
                + "select registro.estudiante.nom_est,  cod_dpto, "
                + "cod_plan, sum_est * 0.1 / can_mat, 0,  sem_est,  per_acad, cod_asig, nom_asig, "
                + "convert(char(3),nota * 0.1), nom, nomt, tpeva "
                + "from  registro.estudiante, registro.biblia_post, registro.asignatura, "
                + "registro.plan_estud, registro.departamento, registro.claves, registro.codigos "
                + "where registro.estudiante.id_dpto = registro.departamento.id_dpto and "
                + "registro.estudiante.id_plan = registro.plan_estud.id_plan and "
                + "registro.estudiante.id_est = registro.biblia_post.id_est and "
                + "registro.biblia_post.as_vis = registro.asignatura.id_asig and "
                + "clave = cd and 1 = cdt and tipo = 'promt' and "
                + "registro.biblia_post.per_acad = '" + peraca + "' and  "
                + "registro.biblia_post.id_est = " + carnet + " ");

        try {
            conectarBD();
            retorno = consultar(consulta, 13, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    /**
     * PERIODO NORMAL *
     */
    public Vector despNotasAct(String carnet, String peraca) {
        String consulta = new String();
        Vector retorno = new Vector();
        //sum_ult * 0.1 / can_ult
        consulta = new String("select registro.estudiante.nom_est,  cod_dpto, "
                + " cod_plan,sumest * 0.1 / can, 0, "
                + " sem_est, cod_asig, convert(char(3),nota1 * 0.1), convert(char(3),nota2* 0.1), "
                + " convert(char(3),nota3* 0.1), convert(char(3),nota_lab* 0.1), convert(char(3),nota* 0.1),nom, nom_dpto,convert(char(3),nota4* 0.1) "
                + " from  registro.estudiante, registro.registro, registro.grupo, registro.asignatura, "
                + " registro.plan_estud, registro.departamento, registro.claves, registro.sumnotas "
                + " where registro.estudiante.id_dpto = registro.departamento.id_dpto and registro.estudiante.id_est = ide and "
                + " registro.estudiante.id_plan = registro.plan_estud.id_plan and "
                + " registro.estudiante.id_est = registro.registro.id_est and "
                + " registro.grupo.id_grupo = registro.registro.id_grupo and "
                + " registro.grupo.id_asig = registro.asignatura.id_asig and "
                + " clave = cd and "
                + " registro.registro.id_est = " + carnet + " and registro.grupo.per_acad='" + peraca + "' ");

        try {
            conectarBD();
            retorno = consultar(consulta, 15, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    public Vector datosEst(String carnet) {
        String consulta = new String();
        Vector retorno = new Vector();
        /* consulta = new String("select registro.estudiante.nom_est, nom_dpto,cod_plan, sem_est, dest, registro.estudiante.id_plan, id_dpplan, semnv, emails, celular, tel_corr, nom_acudiente,  ar_cie, ar_soc,ar_len,ar_mat, ar_ele, ar_social,ar_biol, nom_col,munip,per_ing,max_mat  " + " from  registro.lis_estados, registro.estudiante, registro.plan_estud, registro.departamento, "
         + " registro.colegios where registro.estudiante.id_dpto = registro.departamento.id_dpto and "
         + " registro.estudiante.id_plan = registro.plan_estud.id_plan and estado = nest and registro.estudiante.id_col*= registro.colegios.id_col  and"
         + " registro.estudiante.id_est = " + carnet + " ");*/
        consulta = new String("select registro.estudiante.nom_est, nom_dpto,cod_plan, sem_est, dest, registro.estudiante.id_plan, id_dpplan, semnv, emails, celular, tel_corr, nom_acudiente,  ar_cie, ar_soc,ar_len,ar_mat, ar_ele, ar_social,ar_biol, nom_col,munip,per_ing,max_mat  "
                + " from  registro.lis_estados, registro.estudiante LEFT OUTER JOIN registro.colegios ON  registro.estudiante.id_col = registro.colegios.id_col, registro.plan_estud, registro.departamento "
                + " where registro.estudiante.id_dpto = registro.departamento.id_dpto and "
                + " registro.estudiante.id_plan = registro.plan_estud.id_plan and estado = nest   and"
                + " registro.estudiante.id_est = " + carnet + " ");
        try {
            conectarBD();
            retorno = consultar(consulta, 23, 0);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    public Vector getperaca(String plan, String cohorte) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select peracad from registro.defcoho " + "where idplan='" + plan + "' and nco='" + cohorte + "' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    public Vector despDetallePlan(String carnet) {
        String consulta = new String(), prog = new String();
        Vector lisnom = new Vector();
        Vector retorno = new Vector();

        consulta = new String(" select  registro.asignatura.id_asig, "
                + " cod_asig + '(' + convert(varchar(2), peso) + ')', "
                + " linea, semestre,  nom_prog, cod_plan, registro.estudiante.nom_est, id_dpplan, nom_asig, registro.estudiante.id_plan  "
                + "  FROM registro.asignatura, registro.asplanestud, registro.estudiante, registro.programas, registro.plan_estud "
                + " WHERE registro.asignatura.id_asig = registro.asplanestud.idas and idest = registro.estudiante.id_est and "
                + " registro.asplanestud.idplan = registro.estudiante.id_plan and "
                + " registro.plan_estud.id_plan = registro.estudiante.id_plan and  "
                + " registro.programas.id_prog = registro.plan_estud.id_prog and  "
                + " linea > 0 and semestre >= 0 and semestre < 20 and "
                + " id_est = " + carnet + "  order by linea, semestre ");

        /*consulta = new String("select  registro.asignatura.id_asig, "
         + " cod_asig + '(' + convert(varchar(2), peso) + ')', "
         + "linea, semestre,  nom_prog, cod_plan, registro.estudiante.nom_est, id_dpplan, nom_asig  "
         + "FROM registro.asignatura, registro.asig_plan, registro.estudiante, registro.programas, registro.plan_estud "
         + "WHERE registro.asignatura.id_asig = registro.asig_plan.id_asig and "
         + " registro.asig_plan.id_plan = registro.estudiante.id_plan and "
         + " registro.plan_estud.id_plan = registro.estudiante.id_plan and "
         + " registro.programas.id_prog = registro.plan_estud.id_prog and "
         + " linea > 0 and semestre > 0 and semestre < 12 and "
         + " id_est = " + carnet + "  order by linea, semestre ");*/
        try {
            conectarBD();
            retorno = consultar(consulta, 9, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    // total  de los creditos aprobados en el plan  de estudio
    public Vector despCreditos(String carnet, String idplan) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select sum(num_ulas_a) " + "from registro.biblia_def, registro.asig_plan, registro.asignatura " + "where ( registro.biblia_def.id_asig = registro.asig_plan.id_asig or " + "registro.biblia_def.as_vis = registro.asig_plan.id_asig) " + "and registro.asig_plan.id_asig = registro.asignatura.id_asig " + "and nota >= 30 and clave not in ('R', 'C') and id_plan = " + idplan + " and " + "registro.biblia_def.id_est = " + carnet + " ");
        //out.println("consulta");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector despDoblePlan(String carnet) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select  registro.asignatura.id_asig,cod_asig + '(' + convert(varchar(2), peso) + ')',  " + "linea, semestre,  nom_prog, cod_plan, registro.estudiante.nom_est, null " + "FROM registro.asignatura, registro.asig_plan, registro.estudiante, registro.programas, registro.plan_estud " + "WHERE registro.asignatura.id_asig = registro.asig_plan.id_asig and " + " registro.asig_plan.id_plan = registro.estudiante.id_dpplan and " + " registro.plan_estud.id_plan = registro.estudiante.id_dpplan and " + " registro.programas.id_prog = registro.plan_estud.id_prog and " + " linea > 0 and semestre > 0 and semestre < 12 and " + " id_est = " + carnet + "  order by linea, semestre ");
        try {
            conectarBD();
            retorno = consultar(consulta, 8, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector despidasig(String carnet, String ident, int par) {
        Vector retorno = new Vector();
        String consulta = new String();
        if (par == 1) {
            consulta = new String("select id_asig from registro.biblia_def " + "where id_est = " + carnet + " and nota >= 30 and clave not in ('C', 'R')  and " + " (id_asig = " + ident + " )");
        } else {
            consulta = new String("select id_asig from registro.biblia_def " + "where id_est = " + carnet + " and nota >= 30 and clave not in ('C', 'R')  and " + " ( visdp = " + ident + " )");
        }
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector despasig(String carnet, String ident) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select id_asig from registro.registro, registro.asignatura " + "where as_vis = id_asig and id_est = " + carnet + " and  " + "id_asig =  " + ident + " ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    public Vector despInfAsi(String carnet, String ident) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select nom_asig, nom_est " + "FROM registro.asignatura, registro.estudiante " + "WHERE id_asig = " + ident + " and id_est = " + carnet);
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    public Vector despRegistro(String carnet, String ident) {
        String consulta = new String(), prog = new String();
        Vector retorno = new Vector();
        Vector lisnom = new Vector();
        consulta = new String("select nom_asig,  nota1, nota2, nota3, nota_lab, nom " + "FROM registro.asignatura, registro.grupo, registro.registro, registro.claves " + "WHERE registro.asignatura.id_asig = registro.grupo.id_asig and " + " registro.grupo.id_grupo = registro.registro.id_grupo and clave = cd and " + "  id_est = " + carnet + " and as_vis = " + ident + " ");
        try {
            conectarBD();
            retorno = consultar(consulta, 6, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector despBiblia(String carnet, String ident) {
        Vector retorno = new Vector();
        String consulta = new String();
        consulta = new String("select nom_asig, per_acad, nota, nom " + "FROM registro.asignatura, registro.biblia_def, registro.claves " + "WHERE registro.asignatura.id_asig = registro.biblia_def.as_vis and " + "  id_est = " + carnet + " and clave = cd and " + " ( registro.biblia_def.id_asig = " + ident + " or visdp = " + ident + " ) " + " order by per_acad");

        try {
            conectarBD();
            retorno = consultar(consulta, 4, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector despPrerreq(String carnet, String ident) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select distinct nom_asig " + " from registro.estudiante, registro.asig_plan aspA,  " + " registro.req_plan, registro.asignatura, registro.asig_plan aspB " + " where (registro.estudiante.id_plan = aspA.id_plan or registro.estudiante.id_dpplan = aspA.id_plan ) and  " + " aspA.id_asig_plan = id_asig_plan1 and " + " aspB.id_asig_plan = id_asig_plan2 and " + " registro.asignatura.id_asig = aspB.id_asig and " + " id_est = " + carnet + "   and aspA.id_asig = " + ident + " ");
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getRespEnc(String idprof, String peracad) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select rs.id_asig, nom_asig, nro_gr, estud_insc, estud_encu, round(((convert(float, estud_encu)/convert(float, estud_insc))*100),0), " + " prof_a11, prof_a12, prof_a13, prof_a14, prof_a15, prof_a16, prof_a17, prof_a18, prof_a19, prof_a110, " + " estud_a21, estud_a22, estud_a23, estud_a24, estud_a25, estud_a26, estud_a27, " + " asig_a31, asig_a32, asig_a33, asig_a34, asig_a35, asig_a36, asig_a37, asig_a38, " + " round(((prof_a11 + prof_a12 + prof_a13 + prof_a14 + prof_a15 + prof_a16 + prof_a17 + prof_a18 + prof_a19 + prof_a110)/10),1) as profp, " + " round(((estud_a21 + estud_a22 + estud_a23 + estud_a24 + estud_a25 + estud_a26 + estud_a27)/7),1) as estp, " + " round(((asig_a31 + asig_a32 + asig_a33 + asig_a34 + asig_a35 + asig_a36 + asig_a37 + asig_a38)/8),1) as asigp, " + " round(((prof_a11 + prof_a12 + prof_a13 + prof_a14 + prof_a15 + prof_a16 + prof_a17 + prof_a18 + prof_a19 + prof_a110)/10 + " + " (estud_a21 + estud_a22 + estud_a23 + estud_a24 + estud_a25 + estud_a26 + estud_a27)/7 + " + " (asig_a31 + asig_a32 + asig_a33 + asig_a34 + asig_a35 + asig_a36 + asig_a37 + asig_a38)/8)/3, 1) " + " from registro.resultencu rs, registro.asignatura ag " + " where ag.id_asig = rs.id_asig and rs.id_prof = " + idprof + " and periodo='" + peracad + "' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 35, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getObsEnc(String idprof, String per) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select ag.cod_asig, ngr, obs  from registro.respenc rs, registro.asignatura ag " + " where obs <> '' and idp = " + idprof + " and rs.ida = ag.id_asig and " + " per = '" + per + "' ");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector despCorreq(String carnet, String ident) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = new String("select distinct nom_asig,  registro.asignatura.id_asig, id_cor " + "from registro. asignatura, registro.coreq  , registro.estudiante " + "  where  registro.asignatura.id_asig= registro.coreq.id_cor " + " and  id_est= " + carnet + " and registro.coreq.id_asig= " + ident + "  ");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);
        } catch (SQLException ex) {
            mensaje = new String(
                    "Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector AsigLabAux(String idasig) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select mat_teo, cd_aux, cd_lab from registro.asignatura where id_asig  = '" + idasig + "'";
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 0);
        } catch (SQLException ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getNomProfs(String idasigs, String id_est) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select nom_prof, num_grupo, email from registro.grupo gr, registro.profesor prf " + " where gr.id_profesor = prf.id_prof and gr.id_asig in (" + idasigs + ") and id_grupo in " + " (select id_grupo from registro.registro where id_est = " + id_est + ")";
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 0);
        } catch (SQLException ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getIdprog(String id_plan) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select id_prog from registro.plan_estud where id_plan = " + id_plan + " ";
        try {
            conectarBD();
            retorno = consultar(consulta, 1, 0);
        } catch (SQLException ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Preinscripcion(String carnet) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select  id_est, registro.totpreins.id_asig, cod_asig, nom_asig,aut  from registro.totpreins, registro.asignatura where id_est= " + carnet + " and registro.totpreins.id_asig=registro.asignatura.id_asig ";
        try {
            conectarBD();
            retorno = consultar(consulta, 5, 1);
        } catch (SQLException ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector Preinscripcionprim(String periodo) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select  id_est, id_asig  from  registro.inscripcionprim   where per_acad= '" + periodo + "' ";
        try {
            conectarBD();
            retorno = consultar(consulta, 2, 1);
        } catch (SQLException ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int preins(String prio, String carnet, String idasig) {
        String consulta = new String();
        int retorno = 0;
        consulta = new String("update registro.pre_internet set prio = " + prio + "      "
                + "where id_est = " + carnet + " and id_asig = " + idasig + " ");
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public int preinsprim(String prio, String carnet, String idasig) {
        String consulta = new String();
        int retorno = 0;
        consulta = new String("update registro.inscripcionprim set cor2 = " + prio + "      "
                + "where id_est = " + carnet + " and id_asig = " + idasig + " ");
        try {
            conectarBD();
            retorno = actualizar(consulta);
        } catch (SQLException ex) {
            retorno = 0;
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector getNuevaAsig(String idplan, String idprog, String idest) {
        String consulta = new String();
        Vector retorno = new Vector();
        consulta = " select  distinct registro.asignatura.id_asig, cod_asig, nom_asig, registro.plan_estud.id_plan, " + " registro.plan_estud.cod_plan from registro.plan_estud, registro.asig_plan, registro.asignatura " + " where (registro.plan_estud.id_plan = registro.asig_plan.id_plan) " + " and (registro.asignatura.id_asig =  registro.asig_plan.id_asig) and act = 'S' " + " and registro.plan_estud.id_plan <> '" + idplan + "' and registro.plan_estud.id_prog = '" + idprog + "' and " + " registro.asignatura.id_asig not in (select id_asig from registro.biblia_post " + " where id_est = '" + idest + "' ) order by cod_asig ";
        try {
            conectarBD();
            retorno = consultar(consulta, 5, 1);
        } catch (SQLException ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;
    }

    public Vector desptarjeton(String idProf) {
        String consulta = new String(), prog = new String();
        Vector retorno = new Vector();

        consulta = "select  registro.votantesprof.vcd, registro.votantesprof.vca, registro.profesor.nom_prof, registro.profesor.cc_prof, registro.profesor.clanum  " + "FROM registro.votantesprof, registro.registro.profesor " + "WHERE  registro.votantesprof.ccprof= registro.registro.profesor.cc_prof and " + " ccprof= '" + idProf + "'  ";
        try {
            conectarBD();
            retorno = consultar(consulta, 5, 0);
        } catch (SQLException ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());
        }
        desconectarBD();
        return retorno;

    }

    public Vector Candidatos(String tipo) {
        String consulta = new String();
        Vector retorno = new Vector();

        consulta = new String("select nroton, nombre, narc from registro.candidat where idcrp = " + tipo + " order by nroton ");
        try {
            conectarBD();
            retorno = consultar(consulta, 3, 1);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());

        }
        desconectarBD();

        return retorno;

    }

    public Vector ConsultaVoto(String cedula) {

        String consulta = new String();
        Vector retorno = new Vector();
        consulta = "select  vcd, vca " + "from  registro.votantesprof " + "WHERE   ccprof= '" + cedula + "' ";


        try {
            conectarBD();
            retorno = consultar(consulta, 2, 0);

        } catch (Exception ex) {
            mensaje = new String("Unable to fetch status due to SQLException: " + ex.getMessage());

        }
        desconectarBD();

        return retorno;
    }

    public int ActualizaVotos(String campo, String idEst) {

        String consulta = new String();
        int retorno = 0;

        consulta = "update registro.votantesprof set " + campo + " = 1 where ccprof=  '" + idEst + "' ";
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

    public int InserVoto(String idcrp, String nro) {
        int retorno = 0;
        try {
            conectarBD();
            String consulta = new String();
            consulta = " insert into registro.votacionprof values (" + idcrp + ", " + nro + " ,getdate() ) ";
            retorno = actualizar(consulta);
        } catch (Exception ex) {
            mensaje = "Unable to fetch status due to SQLException: "
                    + ex.getMessage();
        }
        desconectarBD();
        return retorno;
    }
    
    
    public String getIdProf(String usuario) throws RemoteException{
        Vector datos= new Vector();
        String ans="";
        try {
            conectarBD();
            //Se consulta si existe un token para el usuario
            datos=this.consultar("select cod_emp from registro.odi.empnomina where Expr1= '"+usuario+"@escuelaing.edu.co' ", 1, 0);
            if(datos.size()>0){
                ans=datos.get(0).toString();
            }
            
        } catch (SQLException ex) {
            throw new RemoteException(ex.getMessage());
        }
        desconectarBD();
        return ans;
    }

    
    public Boolean PersisteToken(String token, String carnet) throws RemoteException{
        Vector datos= new Vector();
        Boolean ans=false;
        try {
            conectarBD();
            //Se consulta si existe un token para el usuario
            datos=this.consultar("select token from registro.dbo.sim_control_ingreso where carne= '"+carnet+"' ", 1, 0);
            if(datos.size()<=0){
                this.actualizar("insert into registro.dbo.sim_control_ingreso (carne, token) values ( '"+carnet+"' , '"+token+"' )");
                ans=true;
            }else{
                this.actualizar("update registro.dbo.sim_control_ingreso set token = '"+token+"' where carne= '"+carnet+"' ");
                ans=true;
            }
            
        } catch (SQLException ex) {
            throw new RemoteException(ex.getMessage());
        }
        desconectarBD();
        return ans;
     }
    
//  FIN TUTORADOS
    public String getMensajeDB() {
        //TODO implement getMensajeDB
        return this.mensaje;
    }

    @Override
    public Boolean esDecano(String usuario) throws RemoteException {

        Boolean ans=false;
        try {
            conectarBD();
            //Se consulta si existe un token para el usuario
            if(this.consultar("select * from dbo.sim_decanos where correo='"+usuario.trim()+"'", 1, 0).size()>0){
                ans=true;
            }
        } catch (SQLException ex) {
            throw new RemoteException(ex.getMessage());
        }
        desconectarBD();
        return ans;
    }
}
