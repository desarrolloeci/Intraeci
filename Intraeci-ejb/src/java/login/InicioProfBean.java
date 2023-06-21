package login;

import javax.ejb.*;
import java.sql.*;
import java.util.Vector;
import javax.sql.*;
import javax.naming.*;

/**
 * This is the bean class for the InicioProfBean enterprise bean. Created
 * 16/08/2006 10:27:56 AM
 *
 * @author alexgz
 */
public class InicioProfBean implements SessionBean, InicioProfRemoteBusiness {

    private SessionContext context;
    private boolean conectado;
    private static final String dbName = "jdbc/registro";
    //private static final String dbName = "jdbc/definitivo";
    //private static final String dbName = "jdbc/prueba";
    private Connection con;
    protected String mensaje, retorno = new String();
    //private BDintraeci.baseDatosRemote bdatos;
    protected String idProf;    /* Identificador del profesor */

    protected String nomProf;   /* Nombre del profesor*/

    protected String documProf; /* Documento de identificación*/

    protected String clanum;    /* Clave numérica del profesor*/

    protected String idEmp; /* Nombre del estudiante */

    protected String nomEmp; /* Nombre del empleado */

    protected String apeEmp; /* Apellido Empleado*/

    protected String usrname; /* Usuario correo */

    protected String usrexchange; /* Usuario correo usrexchange*/

    protected String menu; /* 1 para administrativo y 2 para profesores */

    protected String perAcad; /* periodo Académico actual*/

    protected String tercio; /* Tercio*/

    protected String sPath; /* Path de backup y correo*/

    protected String textoCorreo; /* Sesion del texto de correo*/

    protected Vector estudiantes;
    protected String perHorario;
    protected String perAcadPreins; /*Periodo para preinscripción*/

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
        //Vector retorno = new Vector(); 
    }

    /*Funciona OK - Cambiar Bussiness y Home
     public void ejbCreate(String user, String clave) {
     Vector retorno = new Vector();
     Vector prof = new Vector();
     String consulta = new String();
     menu = "";
     consulta= new String("select id_prof, cc_prof, nom_prof, ded_prof, clanum, usrnm " +
     " from registro.registro.profesor " +
     " where registro.registro.profesor.usrnm = '" + user + "' " +
     " and pswd = '" + clave + "'");
     conectarBD();
     if(conectado){
     try {
     prof = consultar(consulta, 6, 0);
     if(prof.size()>0){
     idProf = prof.elementAt(0).toString();
     documProf= prof.elementAt(1).toString();
     nomProf = prof.elementAt(2).toString();
     clanum = prof.elementAt(4).toString();
     menu = "2";
     estudiantes = new Vector();
     idEmp = prof.elementAt(1).toString();
     nomEmp = prof.elementAt(2).toString();
     usrname = prof.elementAt(5).toString();
     }else{
     consulta=new String(" select num_id, nombres, apellidos, usrname "  +
     " from apolo.rechum.empleados "  +
     " where usrname = '" + user + "' and passwd = '" + clave + "'");
     retorno = consultar(consulta, 4, 0);
     if(retorno.size()>0){
     idEmp = retorno.elementAt(0).toString();
     nomEmp = retorno.elementAt(1).toString();
     apeEmp = retorno.elementAt(2).toString();
     nomEmp = nomEmp + " " + apeEmp;
     usrname = retorno.elementAt(3).toString();
     idProf = "";
     menu = "1";
     }
     }
     } catch (SQLException ex) {
     menu = "";
     }
     desconectarBD();
     }
     }*/
    private void conectarBD() {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup(dbName);
            con = ds.getConnection();
            conectado = true;
        } catch (Exception ex) {
            conectado = false;
            mensaje = new String("No se puede hacer la conexion con la base de datos. " + ex.getMessage());
        }
    }

    private void desconectarBD() {
        try {
            con.close();
        } catch (SQLException ex) {
            mensaje = new String("Desconectar: " + ex.getMessage());
        }
    }

    public void ejbCreate(String user) {
        Vector retorno = new Vector();
        Vector datos = new Vector();
        Vector prof = new Vector();
        String consulta = new String();
        String user1 = user + "@escuelaing.edu.co";
        /* MODIFCADO EL 26 DE ABRIL DE 2017 SOLICITUD JIMMY RUIZ SE DEJAN LAS 2 CONSULTAS POR BIOMEDICA Q NO ESTAN EN NOMINA
         consulta =  "SELECT num_id, nombres, apellidos, usrname, dedica, usrexchange "
         +"FROM apolo.rechum.empleados "
         +"WHERE (usrname = '" + user + "' or usrexchange = '" + user + "')";*/

        consulta = "SELECT rtrim(cod_emp), rtrim(nom_emp), rtrim(ap1_emp), rtrim(ap2_emp),replace(e_mail,'@escuelaing.edu.co', '') as e_mail  "
                + "FROM registro.odi.empnomina "
                + "WHERE e_mail = '" + user1 + "' and (est_lab='Activo' or est_lab='Vacaciones' )";
        conectarBD();

        if (conectado) {
            try {
                retorno = consultar(consulta, 5, 0);
                retorno.size();
                if (retorno.size()> 0 ){
                    idEmp = retorno.elementAt(0).toString();
                    nomEmp = retorno.elementAt(1).toString();
                    apeEmp = retorno.elementAt(2).toString() + ' ' + retorno.elementAt(3).toString();
                    usrname = retorno.elementAt(4).toString();
                    usrexchange = retorno.elementAt(4).toString();
                    
                }else{
             
                    consulta = "SELECT num_id, nombres, apellidos, usrname, dedica, usrexchange "
                            + "FROM apolo.rechum.empleados "
                            + "WHERE (usrname = '" + user + "' or usrexchange = '" + user + "')";
                    retorno = consultar(consulta, 6, 0);
                    idEmp = retorno.elementAt(0).toString();
                    nomEmp = retorno.elementAt(1).toString();
                    apeEmp = retorno.elementAt(2).toString();
                    usrname = retorno.elementAt(3).toString();
                    usrexchange = retorno.elementAt(5).toString();
                }
                if (retorno.size() > 0) {
                    idProf = "";
                    menu = "1";
                    consulta = new String("SELECT id_prof, cc_prof, nom_prof, ded_prof, clanum "
                            + "FROM registro.registro.profesor "
                            + "WHERE registro.registro.profesor.cc_prof= '" + retorno.elementAt(0) + "' ");

                    prof = consultar(consulta, 5, 1);

                   
                    /*   if (retorno.elementAt(5).toString().equals("")) {
                     usrexchange = retorno.elementAt(3).toString();
                     } else {
                     usrexchange = retorno.elementAt(5).toString();
                     }*/
                }
            } catch (SQLException ex) {
                mensaje = new String("ERROR: Unable to fetch status due to SQLException: " + ex.getMessage());
            }
            desconectarBD();

            clanum = "";

            if (prof.size() > 0) {
                idProf = ((Vector) prof.elementAt(0)).elementAt(0).toString();
                documProf = ((Vector) prof.elementAt(0)).elementAt(1).toString();
                nomProf = ((Vector) prof.elementAt(0)).elementAt(2).toString();
                clanum = ((Vector) prof.elementAt(0)).elementAt(4).toString();
                menu = "2";
                estudiantes = new Vector();
            } else if (retorno.size() <= 0) {
                idProf = "";
                menu = "3";
            }
        }
    }

    private Vector consultar(String consulta, int nroCampos, int preg) throws SQLException {
        int cont;
        String valor, nd = new String("");
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
            mensaje = new String("La sentencia preparada no se ha podido cerrar correctamente "
                    + e.getMessage());
        }
        prepStmt.close();
        if (lista.size() > 0 && preg == 0) {
            info = (Vector) lista.elementAt(0);
        } else if (preg == 1) {
            return lista;
        }
        return info;
    }

    public String getIdemp() {
        return this.idEmp;
    }

    public String getNomemp() {
        return this.nomEmp;
    }

    public String getApeemp() {
        return this.apeEmp;
    }

    public String getIdProf() {
        //TODO implement getIdProf
        return this.idProf;
    }

    public String getMenu() {
        //TODO implement getMenu
        return this.menu;
    }

    public void setPeriodo(String periodo) {
        this.perAcad = periodo;
    }

    public String getPeriodo() {
        //TODO implement getPeriodo
        return this.perAcad;
    }

    public String getNomProf() {
        //TODO implement getNomProf
        return this.nomProf;
    }

    public String getClave() {
        //TODO implement getClave
        return this.clanum;
    }

    public Vector getEstudiantes() {
        //TODO implement getEstudiantes
        return this.estudiantes;
    }

    public void setEstudiantes(Vector estudiantes) {
        //TODO implement setEstudiantes
        this.estudiantes = estudiantes;
    }

    public void limpiaVariables() {
        this.estudiantes = new Vector();
    }

    public void setTercio(String tercio) {
        this.tercio = tercio;
    }

    public String getTercio() {
        //TODO implement getTercio
        return this.tercio;
    }

    public void setPath(String finpath) {
        //this.sPath = "C:\\Sun\\" + finpath;
        this.sPath = "/usr/local/SUN/" + finpath;
    }

    public String getPath() {
        //TODO implement getTercio
        return this.sPath;
    }

    public String getUsrname() {
        //TODO implement getUsrname
        return this.usrname;
    }

    public String getUsrExchange() {
        //TODO implement getUsrname
        return this.usrexchange;
    }

    public String getDocumProf() {
        return this.documProf;
    }

    public void setTextoCorreo(String texto) {
        this.textoCorreo = texto;
    }

    public String getTextoCorreo() {
        //TODO implement getTextoCorreo
        return this.textoCorreo;
    }

    public void setperHorario(String perhorario) {
        this.perHorario = perhorario;
    }

    public void setperAcadPreins(String peracadpreins) {
        this.perAcadPreins = peracadpreins;
    }

    public String getPerHorario() {
        //TODO implement getPerHorario
        return this.perHorario;
    }

    public String getperAcadPreins() {
        //TODO implement getPerHorario
        return this.perAcadPreins;
    }

    public String getClanum() {
        return this.clanum;
    }
}
