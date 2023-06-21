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
public class getPublicaciones extends HttpServlet {
   

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
        String res = "";
        HttpSession sesion = request.getSession(false);
        PrintWriter pw = response.getWriter();
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp") ;
        HashMap item = null ;

        String ident = request.getParameter("idpub") ;
        try {
            item = emp.detallePublic(ident)  ;
        } catch (Exception ex) {
            Logger.getLogger(getProduccion.class.getName()).log(Level.SEVERE, null, ex);
        }

        res = res + "<publicacion>" +
                "<idpub>" + item.get("idpub") + "</idpub>" +
                "<tipo>" + item.get("tipo") + "</tipo>" +
                "<titulo>" + item.get("titulo") + "</titulo>" +
                "<fecha>" + item.get("fec") + "</fecha>" +
                "<area>" + item.get("area") + "</area>" +
                "<tmayor>" + item.get("titmay") + "</tmayor>" +
                "<edicion>" + item.get("edic") + "</edicion>" +
                "<editor>" + item.get("edit") + "</editor>" +
                "<ciudad>" + item.get("ciudad") + "</ciudad>" +
                "<pais>" + item.get("pais") + "</pais>" +
                "</publicacion>";
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
        HashMap[] datos = null ;
        try {
            datos = emp.getPublicaciones() ;
        } catch (Exception ex) {
            Logger.getLogger(getProduccion.class.getName()).log(Level.SEVERE, null, ex);
        }
        HashMap item ;
        int i ;

        res = "<lispublicaciones>";
        for (i = 0; i < datos.length; i++) {
            item = datos[i];
            res = res + "<publicacion>" +
                    "<idpub>" + item.get("idpub") + "</idpub>" +
                    "<tipo>" + item.get("tipo") + "</tipo>" +
                    "<titulo>" + item.get("titulo") + "</titulo>" +
                    "<fecha>" + item.get("fec") + "</fecha>" +
                    "<area>" + item.get("area") + "</area>" +
                    "</publicacion>";
        }
        res = res + "</lispublicaciones>";
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
