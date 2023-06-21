/*
 * loginProf.java
 *
 * Created on 16 de agosto de 2006, 02:51 PM
 */

package inicio;

import java.io.*;
import java.rmi.RemoteException;
import java.util.Calendar;
//import java.util.ResourceBundle;
import java.util.Vector;
import javax.ejb.CreateException;
import javax.ejb.FinderException;
import javax.ejb.RemoveException;
import javax.ejb.EJBException;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author alexgz
 * @version
 */
public class loginProf extends HttpServlet {
    //protected static ResourceBundle messages = null;

    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        /* TODO output your page here
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet loginProf</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Servlet loginProf at " + usuario + "</h1>");
        out.println("</body>");
        out.println("</html>");
         
        out.close();*/
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
        String conectado = new String(""); 
        String usuario, clave;
        HttpSession sesion;
        login.InicioProfRemoteBusiness ingresar = null;
        login.LoginRemoteBusiness loginemp = null;
        usuario = request.getParameter("usuario");
        clave = request.getParameter("clave");
        clave = clave.replace("'", "");
        usuario = usuario.replace("'", "");
        sesion = request.getSession(false);
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        
        //response.setContentType("text/html;charset=UTF-8");
        
        /*out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet loginProf</title>");
        out.println("</head>");
        out.println("<body>");*/
        
        if (sesion != null){
            try{
                sesion.invalidate() ;
            }catch (java.lang.IllegalStateException e){}
            response.sendRedirect("inicio?msg=7") ;
        }else{
            // Validacion si todos los datos existen en la forma de login 
            if (usuario == null || clave == null || usuario.equals("") || clave.equals("")){
                response.sendRedirect("inicio?msg=0");
            }else{
                if (!(usuario.equals(""))||!(clave.equals(""))){
                    loginemp = conEjb.lookupLoginBean();
                    if(conEjb.conLog){
                        conectado = loginemp.getInicio(usuario, clave);
                        if(conectado.equals("conectado")){
                            ingresar = conEjb.lookupInicioProfBean(usuario);
                            sesion = request.getSession(true);
                            sesion.setAttribute("usuario", usuario);
                            sesion.setAttribute("empleado", ingresar);
                            response.sendRedirect("Menu?id=" + ingresar.getIdemp());
                        }else{
                            response.sendRedirect("inicio?msg=2");
                        }
                    }

                        //Vector empleado = ingresar.getInfoEmp(usuario);
                        //conectado = loginemp.getInicio(usuario, clave);
                        //conectado = loginemp.getInicio(usuario, clave);
                        //if(conectado.equals("conectado")){
                            //Creacion de la Sesion
                            //sesion = request.getSession(true);
                            // Valores de la Variable de Sesion
                            //Profesor prof = new Profesor(idUser) ; 
                            //sesion.setAttribute("usuario", usuario);                        
                            //sesion.setAttribute("cedula", ingresar.getInfoEmp(usuario)/*empleado.elementAt(0)*/);
                            /*sesion.setAttribute("profClase",prof);
                            sesion.setAttribute("nombres", emp.getNomEmp());
                            sesion.setAttribute("apellidos", emp.getApeEmp());*/
                            //sesion.setAttribute("dato", ingresar);
                            //messages = ResourceBundle.getBundle("inicio.AdminMessages", currentLocale);
                            //out.println(" HOLA2: " + home.getEJBMetaData().getPrimaryKeyClass());
                            //response.sendRedirect("Menu?id=" + conectado);
                        /*}else{
                            response.sendRedirect("inicio?msg=2");
                        }*/
                }else{
                    response.sendRedirect("inicio?msg=0");
                }
            }
        }
        /*out.println("<h1>Servlet loginProf at</h1>");
        out.println("</body>");
        out.println("</html>");
         
        out.close();*/
        /*if(conectado > 0){
           
        }*/

    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>

    private login.InicioProfRemoteHome lookupInicioProfBean() {
        try {
            javax.naming.Context c = new javax.naming.InitialContext();
            Object remote = c.lookup("java:comp/env/ejb/InicioProfBean");
            login.InicioProfRemoteHome rv = (login.InicioProfRemoteHome) javax.rmi.PortableRemoteObject.narrow(remote, login.InicioProfRemoteHome.class);
            return rv;
        }
        catch(javax.naming.NamingException ne) {
            java.util.logging.Logger.getLogger(getClass().getName()).log(java.util.logging.Level.SEVERE,"exception caught" ,ne);
            throw new RuntimeException(ne);
        }
    }

    private login.LoginRemote lookupLoginBean() {
        try {
            javax.naming.Context c = new javax.naming.InitialContext();
            Object remote = c.lookup("java:comp/env/ejb/LoginBean");
            login.LoginRemoteHome rv = (login.LoginRemoteHome) javax.rmi.PortableRemoteObject.narrow(remote, login.LoginRemoteHome.class);
            return rv.create();
        }
        catch(javax.naming.NamingException ne) {
            java.util.logging.Logger.getLogger(getClass().getName()).log(java.util.logging.Level.SEVERE,"exception caught" ,ne);
            throw new RuntimeException(ne);
        }
        catch(javax.ejb.CreateException ce) {
            java.util.logging.Logger.getLogger(getClass().getName()).log(java.util.logging.Level.SEVERE,"exception caught" ,ce);
            throw new RuntimeException(ce);
        }
        catch(java.rmi.RemoteException re) {
            java.util.logging.Logger.getLogger(getClass().getName()).log(java.util.logging.Level.SEVERE,"exception caught" ,re);
            throw new RuntimeException(re);
        }
    }
}
