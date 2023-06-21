/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alexgz
 */
public class GuardaEmpleado extends HttpServlet {
   
    private String tmperr;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int estado = 0;
        String tipo = request.getParameter("tipo");
        String idd = request.getParameter("idd");
        String idusr = request.getParameter("idusr");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet GuardaEmpleado</title>");
        out.println("</head>");
        out.println("<body>");
        if(tipo.equals("estform")){
            estado = infoDelete("est_fors", "codigo", idd, "num_id", idusr);
            response.sendRedirect("EstudiosFormales");
        }else if(tipo.equals("estnoform")){
            estado = infoDelete("est_no_fors", "codigo", idd, "num_id", idusr);
            response.sendRedirect("EstudiosNoForm");
        }else if(tipo.equals("laboral")){
            estado = infoDelete("exp_labs", "codigo", idd, "num_id", idusr);
            response.sendRedirect("InfoLaboral");
        }else if(tipo.equals("distinciones")){
            estado = infoDelete("distinciones", "codigo", idd, "num_id", idusr);
            response.sendRedirect("Distinciones");
        }else if(tipo.equals("idiomas")){
            estado = infoDelete("idiomas", "cod_sec", idd, "num_id", idusr);
            response.sendRedirect("Idiomas");
        }else if(tipo.equals("eventos")){
            estado = infoDelete("eve_cies", "codigo", idd, "num_id", idusr);
            response.sendRedirect("Eventos");
        }else if(tipo.equals("escritos")){
            estado = infoDelete("escritos", "codigo", idd, "num_id", idusr);
            response.sendRedirect("Escritos");
        }else if(tipo.equals("pro_invs")){
            estado = infoDelete("pro_invs", "codigo", idd, "num_id", idusr);
            response.sendRedirect("Investigaciones");
        }else if(tipo.equals("sociedades")){
            estado = infoDelete("inscripciones", "codigo", idd, "num_id", idusr);
            response.sendRedirect("Sociedades");
        }
        out.println("</body>");
        out.println("</html>");
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int estado = 0;
        String funcion = request.getParameter("funcion");
        String reqsend = request.getParameter("reqsend");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet GuardaEmpleado</title>");
        out.println("</head>");
        out.println("<body>");
        if(funcion.equals("insertar"))
            estado = guardaInsert(request);
        else if(funcion.equals("actualizar"))
            estado = guardaUpdate(request);
        if(estado > 0){
            response.sendRedirect(reqsend);
        }else{
            out.println(tmperr);
            /*out.println("<script> " +
                        " alert(' Error en el ingreso de los datos '); " +
                        " history.back();" +
                        " </script>");*/
        }
        out.println("</body>");
        out.println("</html>");
    }

    private int infoDelete(String tabla, String tipid, String idd, String tipidusr, String idusr){
        int ret = 0;
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        String consulta;
        try {
            consulta = new String("delete from apolo.rechum." + tabla + " " +
                    " where " + tipid + " = '" + idd + "' and " + tipidusr + " = '" + idusr + "'") ;
            ret = admin.actualizaApolo(consulta);
            tmperr = consulta;
        } catch (Exception el) {
            ret = 0;
        }
        return ret;
    }

    private int guardaInsert(HttpServletRequest request){
        int i, ret = 0;
        Vector campos = getCampos(request);
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        String consulta, valores, sec;
        try {
            consulta = new String("insert into apolo.rechum." + request.getParameter("tabla") + "(") ;
            valores = new String("values (");
            for (i=0; i<campos.size(); i++) {
                if (i != 0){
                    consulta = consulta + ", " ;
                    valores = valores + ", " ;
                }
                consulta = consulta + campos.elementAt(i) ;
                valores = valores + "'" + request.getParameter("zz" + campos.elementAt(i).toString()) + "'";
            }
            consulta = consulta + ", " + request.getParameter("tipidd") + ", " + request.getParameter("tipidusr") + " ) ";
            sec = admin.sigSecEmpleado(request.getParameter("entidad"));
            valores = valores + ", '" + sec + "', '" + request.getParameter("idusr") + "' ) " ;
            consulta = consulta + valores ;
            ret = admin.actualizaApolo(consulta);
            tmperr = consulta;
        } catch (Exception el) {
            ret = 0;
        }
        return ret;
    }

    private int guardaUpdate(HttpServletRequest request){
        int i, ret = 0;
        Vector campos = getCampos(request);
        inicio.conectaEJB conEjb = new inicio.conectaEJB();
        BDintraeci.BDadministrativoRemoteBusiness admin = conEjb.lookupBDadministrativoBean();
        String consulta;
        try {
            consulta = new String("update apolo.rechum." + request.getParameter("tabla") + " set ") ;
            for (i=0; i<campos.size(); i++) {
                if (i != 0){
                    consulta = consulta + ", " ;
                }
                consulta = consulta + campos.elementAt(i) + " = '" + request.getParameter("zz" + campos.elementAt(i).toString()) + "' " ;
            }
            consulta = consulta + " where " + request.getParameter("tipidd") + " = '" + request.getParameter("idd") + "'  ";
            ret = admin.actualizaApolo(consulta);
            tmperr = consulta;
        } catch (Exception el) {
            ret = 0;
        }
        return ret;
    }

    private Vector getCampos(HttpServletRequest request){
        Vector cmps = new Vector();
        String tmp;
        Enumeration lispar = request.getParameterNames();
        while (lispar.hasMoreElements()) {
            tmp = (String)lispar.nextElement();
            if(tmp.charAt(0) == 'z' && tmp.charAt(1) == 'z'){
                cmps.addElement(tmp.substring(2, tmp.length()));
            }
        }
        return cmps;
    }
    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
