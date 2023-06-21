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
public class adminperfil extends HttpServlet {

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
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        HashMap item = null;

        try {
            item = emp.getPerfil();
        } catch (Exception ex) {
            Logger.getLogger(adminperfil.class.getName()).log(Level.SEVERE, null, ex);
        }

        res = "<perfil>" + item.get("perfil") + "</perfil>";
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
        int ret = 0;
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        String res = "<resultado>";

        String perfil = (String) request.getParameter("perf");
        try {
            ret = emp.setPerfil(perfil);
        } catch (Exception ex) {
            Logger.getLogger(adminperfil.class.getName()).log(Level.SEVERE, null, ex);
        }
        res = res + "<dato>" + String.valueOf(ret) + "</dato>";
        if (ret > 0) {
            res = res + "<valor>Operación Exitosa</valor>";
        } else {
            res = res + "<valor>Fallo en la Operación</valor>";
        }
        res = res + "</resultado>";
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
