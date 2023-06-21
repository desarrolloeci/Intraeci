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
public class getDocencia extends HttpServlet {
   
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
            datos = emp.getDocencia();
        } catch (Exception ex) {
            Logger.getLogger(getDocencia.class.getName()).log(Level.SEVERE, null, ex);
        }
        HashMap item ;
        int i ;

        res = "<listadocencia>";
        for (i = 0; i < datos.length; i++) {
            item = datos[i];
            res = res + "<asignatura>" +
                    "<periodo>" + item.get("periodo") + "</periodo>" +
                    "<asig>" + item.get("nom_asig") + "</asig>" +
                    "<grp>" + item.get("grupo") + "</grp>" +
                    "<cant>" + item.get("can_alum") + "</cant>" +
                    "<gan>" + item.get("can_gan") + "</gan>" +
                    "<per>" + item.get("perdida") + "</per>" +
                    "<cancel>" + item.get("cancelaron") + "</cancel>" +
                    "</asignatura>";
        }
        res = res + "</listadocencia>";
        //Enviar Respuesta
        response.setContentType("text/xml");
        pw.write(res);
        pw.flush();
        pw.close();
         } catch (Exception e) {
            Correo correo = new Correo();
            correo.enviar("Docencia", e.getMessage() );
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
