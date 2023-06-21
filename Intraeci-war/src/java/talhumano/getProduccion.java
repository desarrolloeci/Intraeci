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
public class getProduccion extends HttpServlet {
   
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
        String ident = request.getParameter("idpro") ;
        try {
            item = emp.detalleProducto(ident) ;
        } catch (Exception ex) {
            Logger.getLogger(getProduccion.class.getName()).log(Level.SEVERE, null, ex);
        }

        res = res + "<producto>" +
                "<idpro>" + item.get("idpro") + "</idpro>" +
                "<tipo>" + item.get("tipp") + "</tipo>" +
                "<nombre>" + item.get("titp") + "</nombre>" +
                "<objeto>" + item.get("objp") + "</objeto>" +
                "<organ>" + item.get("orgp") + "</organ>" +
                "<pais>" + item.get("pais") + "</pais>" +
                "<fini>" + item.get("fini") + "</fini>" +
                "<ffin>" + item.get("ffin") + "</ffin>" +
                "<ref>" + item.get("descp") + "</ref>" +
                "<rol>" + item.get("rolp") + "</rol>" +
                "<blq>" + item.get("blq") + "</blq>" +
                "</producto>";

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
            datos = emp.getProduccion() ;
        } catch (Exception ex) {
            Logger.getLogger(getProduccion.class.getName()).log(Level.SEVERE, null, ex);
        }
        HashMap item ;
        int i ;

        res = "<produccion>";
        for (i = 0; i < datos.length; i++) {
            item = datos[i];
            res = res + "<producto>" +
                    "<idpro>" + item.get("idpro") + "</idpro>" +
                    "<nombre>" + item.get("titp") + "</nombre>" +
                    "<periodo>" + item.get("fini") + "-" + item.get("ffin") + "</periodo>" +
                    "<tipo>" + item.get("tipp") + "</tipo>" +
                    "<blq>" + item.get("blq") + "</blq>" +
                    "</producto>";
        }
        res = res + "</produccion>";
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
