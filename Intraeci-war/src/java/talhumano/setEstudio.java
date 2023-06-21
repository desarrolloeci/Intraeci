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
public class setEstudio extends HttpServlet {

    private String ident;
    private String titulo;
    private String instit;
    private String fecgrad;
    private String dur;
    private String nivel;
    private String tarprof;

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

        ident = (String) request.getParameter("idestud");
        titulo = (String) request.getParameter("titulo");
        instit = (String) request.getParameter("cinstit");
        fecgrad = (String) request.getParameter("fecgrad");
        dur = (String) request.getParameter("nsem");
        tarprof = (String) request.getParameter("ntarp");
        nivel = (String) request.getParameter("cniv");
        String blq = (String) request.getParameter("blqes");
        if (blq.equals("true")) {
            blq = "S";
        } else {
            blq = "N";
        }

        if (ident.equals("0")) {
            //== Se debe crear un registro de estudios para el empleado
            try {
                ret = emp.crearEstudio(titulo, instit, dur, fecgrad, tarprof, nivel, blq);
            } catch (Exception ex) {
                Logger.getLogger(setEstudio.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            //== Se modifica el registro del este identificador
            try {
                ret = emp.setEstudio(ident, instit, titulo, dur, fecgrad, tarprof, nivel, blq);
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int ret = 0;
        PrintWriter pw = response.getWriter();
        HttpSession sesion = request.getSession(false);
        EmpleadoRemote emp = (EmpleadoRemote) sesion.getAttribute("emp");
        String res = "<resultado>";

        ident = (String) request.getParameter("idestud");
        //== Se elimina el registro de experiencia para el empleado
        try {
            ret = emp.elimEstudio(ident);
        } catch (Exception ex) {
            Logger.getLogger(setEstudio.class.getName()).log(Level.SEVERE, null, ex);
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
