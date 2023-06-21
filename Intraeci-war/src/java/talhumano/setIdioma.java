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
public class setIdioma extends HttpServlet {

    private String idlen;
    private String lengua;
    private String certif;
    private String instit;
    private String punt;
    private String nlee;
    private String nhabla;
    private String nescribe;
    private String fecha;

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
        int ret = 0;
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        String res = "<resultado>";

        idlen = (String) request.getParameter("idlen");
        //== Se elimina el registro de experiencia para el empleado
        try {
            ret = emp.elimIdioma(idlen);
        } catch (Exception ex) {
            Logger.getLogger(setIdioma.class.getName()).log(Level.SEVERE, null, ex);
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
        response.setContentType("text/html;charset=UTF-8");
        int ret = 0;
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        String res = "<resultado>";

        idlen = (String) request.getParameter("idlen");
        lengua = (String) request.getParameter("lengua");
        certif = (String) request.getParameter("certif");
        punt = (String) request.getParameter("punti");
        instit = (String) request.getParameter("organ");
        nlee = (String) request.getParameter("mlee");
        nhabla = (String) request.getParameter("mhab");
        nescribe = (String) request.getParameter("mesc");
        fecha = (String) request.getParameter("fcert");

        String blq = (String) request.getParameter("blqi");
        if (blq.equals("true")) {
            blq = "S";
        } else {
            blq = "N";
        }
        if (idlen.equals("0")) {
            //== Se debe crear un registro de distinción para el empleado
            try {
                ret = emp.crearIdioma(lengua, certif, instit, punt, fecha, nlee, nhabla, nescribe, blq);
            } catch (Exception ex) {
                Logger.getLogger(setIdioma.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            //== Se modifica el registro del este identificador
            try {
                ret = emp.setIdioma(idlen, lengua, certif, instit, punt, fecha, nlee, nhabla, nescribe, blq);
            } catch (Exception ex) {
                Logger.getLogger(setIdioma.class.getName()).log(Level.SEVERE, null, ex);
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
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
