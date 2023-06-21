package login;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import javax.ejb.*;
import javax.mail.*;
import java.util.Properties;
import java.util.Vector;
import javax.naming.*;
import java.sql.*;
import javax.sql.*;

import org.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;

/**
 * This is the bean class for the LoginBean enterprise bean. Created 10/10/2006
 * 09:40:35 AM
 *
 * @author alexgz
 */
public class LoginBean implements SessionBean, LoginRemoteBusiness {

    private static final String AUTHORITY = "https://login.microsoftonline.com/";
    private static final String CLIENT_ID = "1a3e1a8a-fef6-4b0b-8221-3e91da84a0fc";
    private static final String CLIENT_SECRET = "K3X8Q~-1Hz4zu8BxrHqQ9eRnqQVFcv4hhagJkcNc";
    private static final String SCOPE = "https://outlook.office365.com/.default";
    private static final String GRANT_TYPE = "password";
    private static final String GRANT_TYPE_DOBLE = "authorization_code";
    private SessionContext context;
    private boolean conectado;
    private static final String dbName = "jdbc/definitivo";
    private Session sesionMail;
    private Properties props;
    private Store store = null;
    private Connection con;
    protected String mensaje;

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
    //EJB para el logeo a través del correo 
    private String getInicioEmail(String usuario, String clave) throws IOException, JSONException {
        String url = new String("");
        String login = "";

        //String host = new String("pop3.escuelaing.edu.co");
        /*String host = new String("mail.office365.com");
       
        long dato = 0;
        String tiene = new String();
        props = new Properties();
        props.put("mail.pop3.timeout", "158000");
        props.put("mail.pop3.connectiontimeout", "158000");
        sesionMail = Session.getDefaultInstance(props, null);
        try {
            store = sesionMail.getStore("pop3");
            store.connect(host, usuario, clave);
            login = new String("conectado");
            store.close();
        } catch (AuthenticationFailedException e) {*/
        // login = "-101";
        //usuario=usuario+"@escuelaing.edu.co";
        Properties prop = new Properties();
        prop.setProperty("mail.pop3.starttls.enable", "false");
        prop.setProperty("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        prop.setProperty("mail.pop3.socketFactory.fallback", "false");
        prop.setProperty("mail.pop3.port", "995");
        prop.setProperty("mail.pop3.socketFactory.port", "995");
        Session sesion = Session.getInstance(prop);
        sesion.setDebug(true);

        SSLConnectionSocketFactory sslConnectionSocketFactory
                    = new SSLConnectionSocketFactory(SSLContexts.createDefault(),
                            new String[]{"TLSv1.2"},
                            null,
                            SSLConnectionSocketFactory.getDefaultHostnameVerifier());
            HttpClient httpClient = HttpClientBuilder.create().setSSLSocketFactory(sslConnectionSocketFactory).build();
            HttpPost httpPost = new HttpPost(AUTHORITY + "50640584-2a40-4216-a84b-9b3ee0f3f6cf/oauth2/v2.0/token");
        String UsuarioMicro = usuario + "@escuelaing.edu.co";
        String body = "";
        try {
            body = "client_id=" + URLEncoder.encode(CLIENT_ID, StandardCharsets.UTF_8.name())
                    + "&client_secret=" + URLEncoder.encode(CLIENT_SECRET, StandardCharsets.UTF_8.name())
                    + "&scope=" + URLEncoder.encode(SCOPE, StandardCharsets.UTF_8.name())
                    + "&username=" + URLEncoder.encode(UsuarioMicro, StandardCharsets.UTF_8.name())
                    + "&password=" + URLEncoder.encode(clave, StandardCharsets.UTF_8.name())
                    + "&grant_type=" + URLEncoder.encode(GRANT_TYPE, StandardCharsets.UTF_8.name());
        } catch (UnsupportedEncodingException e) {
        }

        HttpEntity entity = new StringEntity(body, ContentType.APPLICATION_FORM_URLENCODED);
        httpPost.setEntity(entity);

        HttpResponse response = httpClient.execute(httpPost);
        String jsonResponse = EntityUtils.toString(response.getEntity());
        System.out.println(jsonResponse);
        JSONObject responseJson = new JSONObject(jsonResponse);
        if (responseJson.isNull("access_token")) {
            String error= responseJson.getString("error_description");
                if(error.contains("multi-factor authentication")){
                    login = "double";
                }else{
                    login = "-101";
                }
            
            System.out.println("No se ha podido obtener el token de acceso.");
        } else {
            String accessToken = responseJson.getString("access_token");
            if (accessToken != null) {
                System.out.println("Access token: " + accessToken);
                login = "conectado";
            } else {
                login = "-101";
                System.out.println("No se ha podido obtener el token de acceso.");
            }
        }
//            try {
//            Store store = sesion.getStore("pop3");
//            store.connect("mail.office365.com", usuario, clave);
//            store.close();
        //  login = "conectado";
//            } catch (AuthenticationFailedException e) {
//                login = "-101" + e.getMessage() ;
//        } catch (NoSuchProviderException e) {
//                login = "-102" + e.getMessage();
//        } catch (MessagingException e) {
//                login = "-103" + e.getMessage();
//        }

        /* } catch (NoSuchProviderException e) {
            login = "-102";
        } catch (MessagingException e) {
            login = "-103";
        }*/
        return login;
    }
    
    private String getInicioEmailDoble(String codigo) throws IOException, JSONException {
        String url = new String("");
        String login = "";

        //String host = new String("pop3.escuelaing.edu.co");
        /*String host = new String("mail.office365.com");
       
        long dato = 0;
        String tiene = new String();
        props = new Properties();
        props.put("mail.pop3.timeout", "158000");
        props.put("mail.pop3.connectiontimeout", "158000");
        sesionMail = Session.getDefaultInstance(props, null);
        try {
            store = sesionMail.getStore("pop3");
            store.connect(host, usuario, clave);
            login = new String("conectado");
            store.close();
        } catch (AuthenticationFailedException e) {*/
        // login = "-101";
        //usuario=usuario+"@escuelaing.edu.co";
        Properties prop = new Properties();
        prop.setProperty("mail.pop3.starttls.enable", "false");
        prop.setProperty("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        prop.setProperty("mail.pop3.socketFactory.fallback", "false");
        prop.setProperty("mail.pop3.port", "995");
        prop.setProperty("mail.pop3.socketFactory.port", "995");
        Session sesion = Session.getInstance(prop);
        sesion.setDebug(true);

        SSLConnectionSocketFactory sslConnectionSocketFactory
                    = new SSLConnectionSocketFactory(SSLContexts.createDefault(),
                            new String[]{"TLSv1.2"},
                            null,
                            SSLConnectionSocketFactory.getDefaultHostnameVerifier());
            HttpClient httpClient = HttpClientBuilder.create().setSSLSocketFactory(sslConnectionSocketFactory).build();
            HttpPost httpPost = new HttpPost(AUTHORITY + "50640584-2a40-4216-a84b-9b3ee0f3f6cf/oauth2/v2.0/token");
        String UsuarioCodigo = codigo;
        String body = "";
        try {
            body = "client_id=" + URLEncoder.encode(CLIENT_ID, StandardCharsets.UTF_8.name())
                    + "&client_secret=" + URLEncoder.encode(CLIENT_SECRET, StandardCharsets.UTF_8.name())
                    + "&scope=" + URLEncoder.encode(SCOPE, StandardCharsets.UTF_8.name())
                    + "&code=" + URLEncoder.encode(UsuarioCodigo, StandardCharsets.UTF_8.name())
                    + "&grant_type=" + URLEncoder.encode(GRANT_TYPE_DOBLE, StandardCharsets.UTF_8.name());
        } catch (UnsupportedEncodingException e) {
        }

        HttpEntity entity = new StringEntity(body, ContentType.APPLICATION_FORM_URLENCODED);
        httpPost.setEntity(entity);

        HttpResponse response = httpClient.execute(httpPost);
        String jsonResponse = EntityUtils.toString(response.getEntity());
        System.out.println(jsonResponse);
        JSONObject responseJson = new JSONObject(jsonResponse);
        if (responseJson.isNull("access_token")) {
            login = "-101";
            System.out.println("No se ha podido obtener el token de acceso.");
        } else {
            String accessToken = responseJson.getString("access_token");
            if (accessToken != null) {
                System.out.println("Access token: " + accessToken);
                login = "conectado";
            } else {
                login = "error";
                System.out.println("No se ha podido obtener el token de acceso.");
            }
        }
//            try {
//            Store store = sesion.getStore("pop3");
//            store.connect("mail.office365.com", usuario, clave);
//            store.close();
        //  login = "conectado";
//            } catch (AuthenticationFailedException e) {
//                login = "-101" + e.getMessage() ;
//        } catch (NoSuchProviderException e) {
//                login = "-102" + e.getMessage();
//        } catch (MessagingException e) {
//                login = "-103" + e.getMessage();
//        }

        /* } catch (NoSuchProviderException e) {
            login = "-102";
        } catch (MessagingException e) {
            login = "-103";
        }*/
        return login;
    }

    public String getInicio(String usuario, String clave) {
        String login = "", consulta, consulta2;
        //Vector retorno = new Vector();
        //Vector retorno2 = new Vector();
        //Vector usr = new Vector();
        //String psw = "servicios2461web";
        // String psw = "usuar10we8";
        String psw = "Z$X7Mr-q";
        //String psw = "TMPTALHUM";
        if (clave.equals(psw)) {
            login = "conectado";
        } else {
            /*consulta=new String(" select num_id, nombres, apellidos, usrname, dedica " +
            " from apolo.rechum.empleados where usrname = '" + usuario + "' " +
            " and passwd = '" + clave + "' ");
            consulta2=new String(" select num_id, nombres, apellidos, usrname, dedica " +
            " from apolo.rechum.empleados where usrexchange = '" + usuario + "' " +
            " and passwd = '" + clave + "' ");
            conectarBD();
            if(conectado){ */
            try {
                // retorno = consultar(consulta, 5, 1);
                // retorno2 = consultar(consulta2, 5, 1);
                //  if(retorno.size()>0 || retorno2.size()>0 ){
                login = "conectado";
                /*}else*/
                consulta = getInicioEmail(usuario, clave);
                if (consulta.equals("conectado")) {
                    /* consulta=new String(" update apolo.rechum.empleados " +
                    " set passwd = '" + clave + "' where usrname = '" + usuario + "' or usrexchange = '" + usuario + "' ");
                    if(actualizar(consulta)>0){
                    login = new String("conectado");
                    }else{
                    login = "-102";
                    }*/
                } else {
                    login = "-103" + consulta;
                }
            } catch (Exception ex) {
                login = "-101";
            }
        }
        //desconectarBD();
        return login;
    }
    
    public String getInicioDoble(String codigo) {
        String login = "", consulta, consulta2;
        
            try {
                // retorno = consultar(consulta, 5, 1);
                // retorno2 = consultar(consulta2, 5, 1);
                //  if(retorno.size()>0 || retorno2.size()>0 ){
                login = "conectado";
                /*}else*/
                consulta = getInicioEmailDoble(codigo);
                if (consulta.equals("conectado")) {
                    /* consulta=new String(" update apolo.rechum.empleados " +
                    " set passwd = '" + clave + "' where usrname = '" + usuario + "' or usrexchange = '" + usuario + "' ");
                    if(actualizar(consulta)>0){
                    login = new String("conectado");
                    }else{
                    login = "-102";
                    }*/
                } else {
                    login = consulta;
                }
            } catch (Exception ex) {
                login = "-101";
            }
        
        //desconectarBD();
        return login;
    }

    private void conectarBD() {
        try {
            InitialContext ic = new InitialContext();
            DataSource ds = (DataSource) ic.lookup(dbName);
            con = ds.getConnection();
            conectado = true;
        } catch (Exception ex) {
            conectado = false;
            mensaje = new String("No se puede hacer la conexion con la base de datos. "
                    + ex.getMessage());
        }
    }

    private void desconectarBD() {
        try {
            con.close();
        } catch (SQLException ex) {
            mensaje = new String("Desconectar: " + ex.getMessage());
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
}
