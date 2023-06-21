/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package talhumano;

import BDintraeci.EmpleadoRemote;
import java.io.IOException;
import java.io.PrintWriter;
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
public class partConvoca extends HttpServlet {

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
        int i, nc = 0, ret = 1;
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        String[] convs = new String[20];
        String res = "<resultado>";

        String oper = (String) request.getParameter("oper");
        nc = Integer.parseInt((String) request.getParameter("nc"));

        if (oper.equals("1") && nc > 0) {
            //== Se arma el arreglo de convocatorias a inscribir
            for (i = 0; i < nc; i++) {
                convs[i] = (String) request.getParameter("insc" + String.valueOf(i));
            }
            try {
                ret = emp.inscConvoca(convs, nc);
            } catch (Exception ex) {
                Logger.getLogger(setEstudio.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (oper.equals("2") && nc > 0) {
            //== Se Se arma el arreglo de convocatorias a desinscribir
            for (i = 0; i < nc; i++) {
                convs[i] = (String) request.getParameter("desinsc" + String.valueOf(i));
            }
            try {
                ret = emp.desinscConvoca(convs, nc);
            } catch (Exception ex) {
                Logger.getLogger(setEstudio.class.getName()).log(Level.SEVERE, null, ex);
            }
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
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
