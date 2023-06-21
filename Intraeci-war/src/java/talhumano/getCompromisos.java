/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package talhumano;

import BDintraeci.EmpleadoRemote;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jgarcia
 */
public class getCompromisos extends HttpServlet {
   

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
        HttpSession sesion = request.getSession(false);
        PrintWriter pw = response.getWriter();
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp") ;
        HashMap item = null ;

        String op = request.getParameter("op") ;
        String ident = request.getParameter("idc") ;
        try {
            item = emp.detalleCompromiso(ident, op) ;
        } catch (Exception ex) {
            Logger.getLogger(getExperiencia.class.getName()).log(Level.SEVERE, null, ex);
        }

        String res = "<compromiso>" +
                    "<idcom>" + item.get("iddfa") + "</idcom>" +
                    "<nombre>" + item.get("nom") + "</nombre>" +
                    "<idobj>" + item.get("fasd") + "</idobj>" +
                    "<nsem>" + item.get("nsem") + "</nsem>" +
                    "<niv>" + item.get("niv") + "</niv>" +
                    "<hc>" + item.get("hc") + "</hc>" +
                    "<hp>" + item.get("dedsem") + "</hp>" +
                    "<hae>" + item.get("hae") + "</hae>" +
                    "<had>" + item.get("had") + "</had>" +
                    "<thor>" + item.get("thor") + "</thor>" +
                    "<fini>" + item.get("fini") + "</fini>" +
                    "<ffin>" + item.get("ffin") + "</ffin>" +
                    "<tipo>" + item.get("tipo") + "</tipo>" +
                    "<idtp>" + item.get("tpact") + "</idtp>" +
                    "<blq>" + item.get("blq") + "</blq>" +
                    "</compromiso>";;

        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(res);
        pw.flush();
        pw.close();
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
        String res = "";
        HttpSession sesion = request.getSession(false);
        PrintWriter pw = response.getWriter();
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp") ;
        String op = (String) request.getParameter("op");
        HashMap[] datos = null ;
        try {
            datos = emp.getCompromisos(op);
        } catch (Exception ex) {
            Logger.getLogger(getCompromisos.class.getName()).log(Level.SEVERE, null, ex);
        }
        HashMap item ;
        int i ;

        res = "<listacompromisos>";
        for (i = 0; i < datos.length; i++) {
            item = datos[i];
            res = res + "<compromiso>" +
                    "<idcom>" + item.get("iddfa") + "</idcom>" +
                    "<nombre>" + item.get("nom") + "</nombre>" +
                    "<idobj>" + item.get("fasd") + "</idobj>" +
                    "<nsem>" + item.get("nsem") + "</nsem>" +
                    "<niv>" + item.get("niv") + "</niv>" +
                    "<hc>" + item.get("hc") + "</hc>" +
                    "<hp>" + item.get("dedsem") + "</hp>" +
                    "<hae>" + item.get("hae") + "</hae>" +
                    "<had>" + item.get("had") + "</had>" +
                    "<thor>" + item.get("thor") + "</thor>" +
                    "<fini>" + item.get("fini") + "</fini>" +
                    "<ffin>" + item.get("ffin") + "</ffin>" +
                    "<tipo>" + item.get("tipo") + "</tipo>" +
                    "<idtp>" + item.get("tpact") + "</idtp>" +
                    "<blq>" + item.get("blq") + "</blq>" +
                    "</compromiso>";
        }
        res = res + "</listacompromisos>";
        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(res);
        pw.flush();
        pw.close();
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
