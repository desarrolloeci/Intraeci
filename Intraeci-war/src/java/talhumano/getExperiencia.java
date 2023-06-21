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
import utiles.Correo;

/**
 *
 * @author jgarcia
 */
public class getExperiencia extends HttpServlet {
   
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

        String ident = request.getParameter("idhis") ;
        try {
            item = emp.detalleExperiencia(ident) ;
        } catch (Exception ex) {
            Logger.getLogger(getExperiencia.class.getName()).log(Level.SEVERE, null, ex);
        }

        String res = "<historia>" +
                "<idhis>" + item.get("idhis") + "</idhis>" +
                "<organizacion>" + item.get("nomorg") + "</organizacion>" +
                "<cargo>" + item.get("cargo") + "</cargo>" +
                "<fini>" + item.get("fini") + "</fini>" +
                "<ffin>" + item.get("ffin") + "</ffin>" +
                "<tcargo>" + item.get("tpcar") + "</tcargo>" +
                "<niveld>" + item.get("nivdoc") + "</niveld>" +
                "<blq>" + item.get("blq") + "</blq>" +
                "</historia>";

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
        try{
        response.setContentType("text/html;charset=UTF-8");
        String res = "";
        HttpSession sesion = request.getSession(false);
        PrintWriter pw = response.getWriter();
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp") ;
        HashMap[] datos = null ;
        try {
            datos = emp.getHislab();
        } catch (Exception ex) {
            Logger.getLogger(getExperiencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        HashMap item ;
        int i ;

        res = "<listalaboral>";
        for (i = 0; i < datos.length; i++) {
            item = datos[i];
            res = res + "<historia>" +
                    "<idhis>" + item.get("idhis") + "</idhis>" +
                    "<organizacion>" + item.get("nomorg") + "</organizacion>" +
                    "<cargo>" + item.get("cargo") + "</cargo>" +
                    "<periodo>" + item.get("fini") + " - " + item.get("ffin") + "</periodo>" +
                    "<tcargo>" + item.get("tpcar") + "</tcargo>" +
                    "<niveld>" + item.get("nivdoc") + "</niveld>" +
                    "<blq>" + item.get("blq") + "</blq>" +
                    "</historia>";
        }
        res = res + "</listalaboral>";
        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(res);
        pw.flush();
        pw.close();
         } catch (Exception e) {
            Correo correo = new Correo();
            correo.enviar("Get Experiencia", e.getMessage() );
        }
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
